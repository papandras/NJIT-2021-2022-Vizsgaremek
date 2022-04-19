<template>
  <div>
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
      <td colspan="2" @click="download(type, title)">Letöltés <img src="src/assets/download_icon.svg" alt="Letöltés"
          id="downloadicon"><br></td>
      <td colspan="2">
        <p>Megosztás</p>
        <img src="src/assets/share_icon.svg" alt="Megosztás" id="shareicon">
        <select>
          <option v-for="group in groups" :value="group.id">{{
            group.name
          }}
          </option>
        </select>
      </td>
      <td colspan="2" @click="deletefile(type, title)">Törlés <img src="src/assets/delete_icon.svg" alt="Törlés"
          id="deleteicon"><br></td>
    </tr>
  </div>
</template>

<script>
import { toRefs } from "vue";
import { useAuth } from "../store/auth.js";
import axios from "axios";
export default {
  props: {
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
      minimenu: true,
      store: useAuth(),
      groups: null
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
      let filename = `${this.store.user.name}-${title}.${type}`;
      axios.delete(`http://localhost:8881/api/file/delete/${filename}`, { withCredentials: true });
    },
    async getgroups() {
            await axios.get("http://localhost:8881/api/user/groups", {
                withCredentials: true,
            }).then(response => {
                this.groups = response.data
            })
        },
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
  padding-top: 10px;
  text-align: center;
  width: 20%;
}

tr:nth-child(2n)>td {
  text-align: center;
  border-top: 2px solid black;
}

tr:nth-child(2n) {
  padding-bottom: 10px;
}
</style>