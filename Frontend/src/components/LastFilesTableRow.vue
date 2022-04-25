<template>
  <div class="row" :id="id">
    <tr>
      <td>
        <input type="checkbox" :name="checkboxname" @click="additem(id, title, type)" :id="`checkbox-${id}`" />
      </td>
      <td class="imgtd">
        <img :src="'src/assets/format_icons/' + type + '.svg'" :alt="type" :title="type" />
      </td>
      <td>{{ title }}</td>
      <td>{{ size }}</td>
      <td>{{ lastedited }}</td>
      <td class="imgtd">
        <p v-if="group == null">{{ group ?? "Nincs megosztva senkivel" }}</p>
        <img v-if="group != null" class="memberimage" v-for="groupmember in groupmembers"
          :src="'http://localhost:8881/profilpic/' + groupmember[0].kep" :alt="groupmember[0].nev"
          :title="groupmember[0].nev">
      </td>
      <td>
        <img src="@/assets/doticon.svg" alt="menu" @click="showmenu" />
      </td>
    </tr>
    <tr class="menurow" v-if="minimenu">
      <td></td>
      <td></td>
      <td @click="download(type, title)" class="menuitem">
        <p>Letöltés</p>
        <button class="button downloadbutton" @click="downloadselected">Letöltés</button>
      </td>
      <td class="menuitem">
        <p>Megosztás</p>
        <p v-if="groups.message != null">Hozz létre csoportot a megosztáshoz!</p>
        <div v-if="groups.message == null">
          <button @click="share(id)" class="button sharebutton">Megosztom</button>
          <select :id="title">
            <option v-for="group in groups" :value="group.id">{{
                group.name
            }}
            </option>
          </select>
        </div>
        <span v-if="group != null" class="removegroup" @click="unshare(id)">[Megosztás visszavonása]</span>
      </td>
      <td @click="deletefile(type, title)" class="menuitem">
        <p>Törlés</p><button class="button deletebutton" @click="deleteselected">Törlés</button>
      </td>
      <td></td>
      <td></td>
    </tr>
  </div>
</template>

<script>
import { useAuth } from "../store/auth.js";
import axios from "axios";
export default {
  props: {
    id: String,
    checkboxname: String,
    type: String,
    title: String,
    size: String,
    lastedited: String,
    group: Number,
    refresh: Function,
    checkedboxdata: Object,
    checked: Boolean
  },
  data() {
    return {
      minimenu: false,
      store: useAuth(),
      groups: null,
      ischecked: this.checked,
      groupmembers: null
    }
  },
  methods: {
    showmenu() {
      this.minimenu = !this.minimenu;
    },
    download(type, title) {
      let filename = `${this.store.user.name}-${title}.${type}`;
      axios.get(`http://localhost:8881/api/file/download/${filename}`, { withCredentials: true, responseType: 'arraybuffer' })
        .then(response => {
          let blob = new Blob([response.data])
          let link = document.createElement('a')
          link.href = window.URL.createObjectURL(blob)
          link.download = `${title}.${type}`
          link.click()
        })
    },
    deletefile(type, title) {
      let conf = confirm("Biztosan törli?")
      if (conf) {
        let filename = `${this.store.user.name}-${title}.${type}`;
        axios.delete(`http://localhost:8881/api/file/delete/${filename}`, { withCredentials: true })
          .then(response => {
            this.refresh()
          })
      }
    },
    async getgroups() {
      await axios.get("http://localhost:8881/api/user/groups", {
        withCredentials: true,
      }).then(response => {
        this.groups = response.data
      })
    },
    share(id) {
      let group = document.getElementById(this.title).value
      axios.put(`http://localhost:8881/api/file/${id}`, { group_id: group }, { withCredentials: true })
        .then(response => {
          this.refresh()
        })
    },
    unshare(id) {
      let conf = confirm("Biztosan visszavonod a megosztást?")
      if (conf) {
        axios.put(`http://localhost:8881/api/file/${id}/unshare`, {}, { withCredentials: true })
          .then(response => {
            this.refresh()
          })
      }
    },
    additem() {
      this.ischecked = !this.ischecked
    },
    async getgroupmembers(id) {
      await axios.get(`http://localhost:8881/api/group/${id}/members`, {
        withCredentials: true,
      }).then(response => {
        this.groupmembers = response.data
      })
    },
  },
  mounted() {
    this.getgroups()
    this.ischecked = document.getElementById(`checkbox-${this.id}`).checked
    if (this.group != null) {
      this.getgroupmembers(this.group)
    }
  },
  watch: {
    checked(newval, oldval) {
      this.ischecked = newval
    },
    ischecked(newval, oldval) {
      document.getElementById(`checkbox-${this.id}`).checked = newval
      if (newval == true) {
        this.checkedboxdata[this.id] = {
          "id": this.id,
          "title": this.title,
          "type": this.type
        }
      }
      if (newval == false) {
        delete this.checkedboxdata[this.id]
      }
    }
  }
}
</script>

<style scoped>
#minimenu {
  display: none;
}

#downloadicon,
#shareicon,
#deleteicon {
  height: 20px;
  display: block;
  margin: auto;
  margin-top: 5px;
  margin-bottom: 5px;
}

tr:nth-child(2n+1)>td {
  text-align: center;
  width: 20%;
}

.removegroup {
  cursor: pointer;
}

.removegroup:hover {
  color: red
}

.removegroup:active {
  color: blue
}

table td:nth-child(1),
table td:nth-child(2),
table td:nth-child(7) {
  width: 10%;
}

.row {
  background-color: white;
  border-radius: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  padding-bottom: 20px;
}

.menurow {
  text-align: center;
}

.menuitem {
  border: 2px solid black;
  border-radius: 5px;
  border-top: 1px solid rgba(62, 76, 121, 0.8);
  border-left: 1px solid rgba(62, 76, 121, 0.4);
  border-right: 1px solid rgba(62, 76, 121, 0.4);
  border-bottom: 1px solid rgba(62, 76, 121, 0.5);
}

.imgtd {
  position: relative;
  height: 30px;
}

.imgtd>img {
  height: 30px;
  vertical-align: top;
}

.button {
  border-radius: 5px;
  border: none;
  width: 150px;
  height: 30px;
  color: white;
  display: inline-block;
  margin-bottom: 10px;
}

.deletebutton {
  background-color: #DC143C;
}

.sharebutton {
  background-color: #0f52ba;
}

.downloadbutton {
  background-color: #35b14a;
}

.memberimage {
  height: 30px;
  width: 30px;
  border-radius: 50%;
}
</style>