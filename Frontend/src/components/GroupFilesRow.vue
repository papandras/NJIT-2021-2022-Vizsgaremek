<template>
  <tr v-for="file in groupfiles" :key="file.id">
    <td class="imgtd">
      <img :src="'src/assets/format_icons/' + file.type + '.svg'" :alt="file.type" :title="file.type" />
    </td>
    <td :title="file.name">{{ file.name }}</td>
    <td>{{ file.size }}</td>
    <td>{{ file.owner }}</td>
    <td>
      <button class="button downloadbutton" @click="download(file.type, file.name, file.owner)">
        Letöltés
      </button>
    </td>
  </tr>
</template>

<script>
import axios from "axios";
export default {
  props: {
    groupid: Number,
    nofilemessage: Function,
  },
  data() {
    return {
      groupfiles: null,
    };
  },
  methods: {
    download(type, title, owner) {
      let filename = `${owner}-${title}.${type}`;
      axios.get(`http://localhost:8881/api/file/download/${filename}`, { withCredentials: true, responseType: 'arraybuffer' })
        .then(response => {
          let blob = new Blob([response.data])
          let link = document.createElement('a')
          link.href = window.URL.createObjectURL(blob)
          link.download = `${title}.${type}`
          link.click()
        })
    }
  },
  async mounted() {
    await axios
      .get(`http://localhost:8881/api/group/${this.groupid}/files`, {
        withCredentials: true,
      })
      .then((response) => {
        this.groupfiles = response.data.data;
        document.getElementById(`${this.groupid}-nofile`).style.display =
          "none";
        document.getElementById(`${this.groupid}-table`).style.display =
          "block";
        if (this.groupfiles.length < 1) {
          this.nofilemessage();
          document.getElementById(`${this.groupid}-nofile`).style.display =
            "block";
          document.getElementById(`${this.groupid}-table`).style.display =
            "none";
        }
      });
  },
};
</script>

<style scoped>
tr {
  background-color: white;
}

td {
  padding: 5px;
  padding-left: 20px;
  padding-right: 20px;
  text-align: center;
}

img {
  height: 30px;
}

.downloadbutton {
  background-color: #35b14a;
}
</style>