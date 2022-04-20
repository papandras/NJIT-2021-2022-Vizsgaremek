<template>
  <div class="row">
    <tr>
      <td>
        <input type="checkbox" :name="checkboxname" />
      </td>
      <td>
        <img src="#" :alt="type" />
      </td>
      <td>{{ title }}</td>
      <td>{{ size }}</td>
      <td>{{ lastedited }}</td>
      <td>{{ group ?? "Nincs megosztva senkivel" }}</td>
      <td>
        <img src="@/assets/doticon.svg" alt="menu" @click="showmenu" />
      </td>
    </tr>
    <tr class="menurow" v-if="minimenu">
      <td></td>
      <td></td>
      <td @click="download(type, title)" class="menuitem">Letöltés <img src="@/assets/download_icon.svg"
          alt="Letöltés" id="downloadicon"><br></td>
      <td class="menuitem">
        <p>Megosztás</p>
        <img src="@/assets/share_icon.svg" alt="Megosztás" id="shareicon">
        <div v-if="group == null">
          <select :id="title">
            <option v-for="group in groups" :value="group.id">{{
              group.name
            }}
            </option>
          </select>
          <button @click="share(id)">Megosztom</button>
        </div>
        <span v-if="group != null" class="removegroup" @click="unshare(id)">[Megosztás visszavonása]</span>
      </td>
      <td @click="deletefile(type, title)" class="menuitem">Törlés <img src="@/assets/delete_icon.svg" alt="Törlés"
          id="deleteicon"><br></td>
      <td></td>
      <td></td>
    </tr>
  </div>
</template>

<script>
import { toRefs } from "vue";
import { useAuth } from "../store/auth.js";
import axios from "axios";
export default {
  props: {
    id: Number,
    checkboxname: String,
    type: String,
    title: String,
    size: Number,
    lastedited: String,
    group: Number,
    refresh: Function
  },
  data() {
    return {
      minimenu: false,
      store: useAuth(),
      groups: null,
    }
  },
  setup(props) {
    const { checkboxname, type, title, size, lastedited, group } = toRefs(props)
  },
  methods: {
    showmenu() {
      this.minimenu = !this.minimenu;
      switch (this.minimenu) {
        case true:
          document.getElementById("minimenu").style.display = "block";
        default:
          document.getElementById("minimenu").style.display = "none";
      }
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
    }
  },
  mounted() {
    this.getgroups()
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
</style>