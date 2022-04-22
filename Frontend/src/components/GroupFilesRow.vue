<template>
  <div v-for="file in groupfiles" :key="file.id">
    <tr class="row">
      <td class="imgtd">
        <img
          :src="'src/assets/format_icons/' + file.type + '.svg'"
          :alt="file.type"
          :title="file.type"
        />
      </td>
      <td>{{ file.name }}</td>
      <td>{{ file.size }}</td>
      <td>{{ file.owner }}</td>
      <td>
        <button class="button downloadbutton" @click="downloadselected">
          Letöltés
        </button>
      </td>
    </tr>
  </div>
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
  async mounted() {
    await axios
      .get(`http://localhost:8881/api/group/${this.groupid}/files`, {
        withCredentials: true,
      })
      .then((response) => {
        this.groupfiles = response.data.data;
        console.log(this.groupfiles);
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
    console.log(this.groupid);
  },
};
</script>

<style scoped>
img {
  height: 30px;
}

td {
  padding: 5px;
  padding-left: 10px;
  padding-right: 10px;
  width: 20%;
  text-align: center;
}

tr {
  margin-left: 20px;
  margin-right: 20px;
  background-color: white;
  border-radius: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  padding-bottom: 20px;
}
</style>