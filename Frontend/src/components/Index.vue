<template>
  <div class="index">
    <Menu id="menu" activepage="index"></Menu>
    <div id="content">
      <div id="last_file">
        <LastFilesTable :lastfilesobject="lastfiles" :refresh="getlastfiles" title="Legutóbbi fájlok"></LastFilesTable>
      </div>
      <div id="stat">
        <StatElement icon="media.png" typeName="Media file" size="15" progress="80" color="#03a0c2"></StatElement>
        <StatElement icon="image.png" typeName="Images" size="10" progress="60" color="#1cc842"></StatElement>
        <StatElement icon="document.png" typeName="Documents" size="7" progress="40" color="#ffc720"></StatElement>
        <StatElement icon="other.png" typeName="Other files" size="5" progress="30" color="#9a45ee"></StatElement>
      </div>
      <div id="upload">
        <form method="post" @submit.prevent="uploadfile" enctype="multipart/form-data">
          <input type="file" name="file" id="keresesInput">
          <button id="keresesGomb">Új fájl feltöltése</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import Menu from "../components/LeftSideMenu.vue";
import LastFilesTable from "./LastFilesTable.vue";
import StatElement from "./StatElement.vue";
import axios from "axios";
export default {
  name: "Index",
  components: {
    Menu,
    LastFilesTable,
    StatElement
  },
  data() {
    return {
      lastfiles: null,
    }
  },
  methods: {
    uploadfile() {
      let input = document.querySelector("input[type=file]");
      let data = new FormData()
      data.append('file', input.files[0]);
      try {
        axios
          .post(
            "http://localhost:8881/api/file/upload",
            data,
            { withCredentials: true, mode: "no-cors", Accept: "application/json" }
          )
          .then((response) => {
            this.getlastfiles();
          });

      }
      catch (e) {
        console.log(e.response.data.errors);
      }
    },
    getlastfiles() {
      try {
        axios
          .get("http://localhost:8881/api/file/get/3", {
            withCredentials: true,
          })
          .then((response) => {
            this.lastfiles = response.data;
          });
      }
      catch (e) {
        console.log(e.response.data.errors);
      }
    }
  },
  mounted() {
    this.getlastfiles();
  }
};
</script>

<style scoped>
.index {
  display: grid;
  grid-template-columns: 10% 90%;
  grid-template-rows: 100%;
  grid-template-areas: "menu content";
}

#menu {
  grid-area: menu;
}

#content {
  grid-area: content;
  display: grid;
  grid-template-columns: 5fr 5fr;
  grid-template-rows: 4fr 4fr;
  grid-template-areas:
    "lastfiles lastfiles"
    "stat upload";
}

#last_file {
  grid-area: lastfiles;
  background-color: #C4C4C4;
  width: 90%;
  border-radius: 5px;
  margin: auto;
  display: block;
  margin-top: 20px;
  padding-top: 20px;
  padding-bottom: 20px;
}

#stat {
  grid-area: stat;
  background-color: #C4C4C4;
  width: 90%;
  border-radius: 5px;
  margin: auto;
  display: block;
  margin-left: 85px;
  margin-top: 20px;
}

#upload {
  grid-area: upload;
  background-color: #C4C4C4;
  border-radius: 5px;
  width: 90%;
  margin: auto;
  display: block;
}

form {
  display: inline-block;
  width: 80%;
}

#keresesGomb:active {
  border: 2px solid #c4c4c4;
}

#keresesInput:focus {
  border: 2px solid #009688;
}
</style>