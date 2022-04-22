<template>
  <div class="table">
    <h1>{{ title }}</h1>
    <table v-if="lastfiles != null">
      <div class="thead">
        <tr>
          <th>
            <input type="checkbox" name="" id="" @click="checkall" />
          </th>
          <th>Típus</th>
          <th>Dokumentum neve</th>
          <th>Méret</th>
          <th>Legutóbbi módosítás</th>
          <th>Tagok</th>
          <th width="200px">#</th>
        </tr>
      </div>
      <TableRow class="tablerow" v-if="lastfiles != null && lastfiles.message == null" v-for="file in lastfiles"
        :key="file.name" :type="file.type" :title="file.name" :size="file.size" :lastedited="file.updated"
        :group="file.shared_group_id" :refresh="refresh" :id="file.id + '-' + file.name"
        :checkedboxdata="checkedBoxesData" :checked="checked" />
    </table>
    <div v-if="nofilemessage != null" class="nofilemessage">
      {{ nofilemessage }}
    </div>
    <div class="buttons" v-if="lastfiles != null">
      <button class="button downloadbutton" @click="downloadselected">Letöltés</button>

      <div class="sharemanybuttondiv">
        <button class="button sharebutton" @click="shareselected">Megosztás</button>
        <p v-if="groups != null && groups.message != null">Hozz létre csoportot a megosztáshoz!</p>
        <div v-if="groups != null && groups.message == null">
          <select id="sharemany">
            <option v-for="group in groups" :value="group.id">{{
              group.name
            }}
            </option>
          </select>
        </div>
      </div>
      <button class="button deletebutton" @click="deleteselected">Törlés</button>
    </div>
  </div>
</template>

<script>
import TableRow from "./LastFilesTableRow.vue";
import { useAuth } from "../store/auth.js";
import axios from "axios";
export default {
  components: {
    TableRow,
  },
  data() {
    return {
      lastfiles: null,
      nofilemessage: null,
      checked: false,
      checkedBoxesData: new Object(),
      store: useAuth(),
      groups: null,
    }
  },
  props: {
    lastfilesobject: Object, //the object of the files to display
    refresh: Function, //the function what is refreshing the files
    title: String, //the title of the component
    name: String,
  },
  methods: {
    async getgroups() {
      await axios.get("http://localhost:8881/api/user/groups", {
        withCredentials: true,
      }).then(response => {
        this.groups = response.data
      })
    },
    checkall() {
      let checkboxes = document.getElementById(this.name).querySelectorAll("input[type=checkbox]")
      this.checked = !this.checked
      for (let i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = this.checked;
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
      let filename = `${this.store.user.name}-${title}.${type}`;
      axios.delete(`http://localhost:8881/api/file/delete/${filename}`, { withCredentials: true })
        .then(response => {
          this.refresh()
        })
    },
    share(id) {
      let group = document.getElementById("sharemany").value
      axios.put(`http://localhost:8881/api/file/${id}`, { group_id: group }, { withCredentials: true })
        .then(response => {
          this.refresh()
        })
    },
    downloadselected() {
      let conf = confirm("Biztosan letölti a kiválasztott elemeket?")
      if (conf) {
        for (let [key, value] of Object.entries(this.checkedBoxesData)) {
          this.download(value.type, value.title)
        }
      }
    },
    deleteselected() {
      let conf = confirm("Biztosan törli a kiválasztott elemeket?")
      if (conf) {
        for (let [key, value] of Object.entries(this.checkedBoxesData)) {
          this.deletefile(value.type, value.title)
        }
      }
    },
    shareselected() {
      let conf = confirm("Biztosan megosztja a kiválasztott elemeket?")
      if (conf) {
        for (let [key, value] of Object.entries(this.checkedBoxesData)) {
          this.share(value.id)
        }
      }
    }
  },
  watch: {
    lastfilesobject(newfiledata, oldfiledata) {
      if (newfiledata != null) {
        this.lastfiles = newfiledata.data;
        this.nofilemessage = newfiledata.message;
      }
    }
  },
  mounted() {
    this.getgroups()
  }
};
</script>

<style>
th {
  width: 20%;
  text-align: center;
}

table {
  border-collapse: separate;
  width: 80%;
  margin: auto;
  color: rgb(70, 84, 114);
}

.table {
  background-color: rgb(245, 246, 249);
  padding-left: 20px;
  padding-right: 20px;
  width: 90%;
  display: block;
  margin: auto;
}

.table>h1 {
  text-align: left;
  margin-bottom: 20px;
  color: rgb(132, 148, 165);
  padding-left: 10rem;
  padding-top: 1rem;
}

table th:nth-child(1),
table th:nth-child(2),
table th:nth-child(7) {
  width: 10%;
}

th:last-child {
  width: 200px;
}

.tablerow,
.thead {
  margin-left: 20px;
  margin-right: 20px;
}

.thead {
  color: rgb(179, 187, 198);
}

.nofilemessage {
  text-align: center;
  font-size: 120%;
  letter-spacing: 2px;
  text-transform: uppercase;
  padding-bottom: 50px;
  opacity: 0.3;
}

.buttons {
  display: flex;
  justify-content: flex-end;
}

.button {
  border-radius: 5px;
  border: none;
  width: 150px;
  height: 30px;
  color: white;
  display: inline-block;
  margin: 10px;
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

select {
  background-color: #c4c4c4;
  opacity: 80%;
  border-radius: 5px;
  border-color: none;
  width: 150px;
  height: 30px;
  text-align: center;
  border: none;
  margin-top: 10px;
  outline: none;
  display: block;
  margin: auto;
  margin-bottom: 10px;
}

.sharemanybuttondiv {
  display: inline-block;
}

#sharemany {
  margin-bottom: 20px;
}
</style>