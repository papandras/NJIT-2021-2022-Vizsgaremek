<template>
  <div class="index">
    <Menu id="menu" activepage="index"></Menu>
    <div id="content">
      <div id="last_file">
        <LastFilesTable :lastfilesobject="lastfiles" :refresh="getlastfiles" title="Legutóbbi fájlok" id="lastfiles"
          name="lastfiles" />
      </div>
      <div id="stat">
        <h1>Statisztika</h1>
        <div v-if="stat != null">
          <StatElement class="statelement" icon="src/assets/category_icons/music-file.svg" typeName="Zenék"
            :size="stat.audio.sizewithunit" :progress="stat.audio.size" color="#03a0c2" />
          <StatElement class="statelement" icon="src/assets/category_icons/video-file.svg" typeName="Videók"
            :size="stat.video.sizewithunit" :progress="stat.video.size" color="#DC143C" />
          <StatElement class="statelement" icon="src/assets/category_icons/image-file.svg" typeName="Képek"
            :size="stat.image.sizewithunit" :progress="stat.image.size" color="#1cc842" />
          <StatElement class="statelement" icon="src/assets/category_icons/text-file.svg" typeName="Dokumentumok"
            :size="stat.text.sizewithunit" :progress="stat.text.size" color="#ffc720" />
          <StatElement class="statelement" icon="src/assets/category_icons/unknown-file.svg" typeName="Egyéb fájlok"
            :size="stat.other.sizewithunit" :progress="stat.other.size" color="#9a45ee" />
          <StatElement class="statelement" icon="src/assets/category_icons/blank-file.svg" typeName="Összes fájl"
            :size="stat.all.sizewithunit + ' / 10 MB'" :progress="stat.all.size" color="#009688" />
        </div>
      </div>
      <div id="upload">
        <h1>Fájl feltöltése</h1>
        <div>
          <form method="post" @submit.prevent="uploadfile" enctype="multipart/form-data">
            <input type="file" name="file" id="selectfile">
            <button id="keresesGomb">Feltöltés</button>
          </form>
        </div>
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
      stat: null
    }
  },
  methods: {
    uploadfile() {
      let input = document.querySelector("input[type=file]");
      if (input.files[0] == null) {
        alert("Nem választottál ki fájlt!")
      }
      else {
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
              this.getStat();
            });

        }
        catch (e) {
          console.log(e.response.data.errors);
        }
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
    },
    getStat() {
      axios
        .get("http://localhost:8881/api/file/stat", {
          withCredentials: true,
        })
        .then((response) => {
          this.stat = response.data;
          console.log(this.stat)
        });
    }
  },
  mounted() {
    this.getlastfiles();
    this.getStat();
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
  grid-template-columns: repeat(2, minmax(300px, 1fr));
  grid-template-rows: repeat(2, minmax(400px, 1fr));
  grid-template-areas:
    "lastfiles lastfiles"
    "stat upload";
  width: 90%;
  margin: auto;
  position: relative;
}

#last_file {
  grid-area: lastfiles;
  background-color: #C4C4C4;
  width: 100%;
  border-radius: 5px;
  margin-top: 20px;
  padding-top: 20px;
  padding-bottom: 20px;
  display: flex;
  align-content: center;
}

#stat {
  grid-area: stat;
  background-color: #C4C4C4;
  width: 99%;
  height: 50%;
  border-radius: 5px;
  margin-top: 20px;
  position: absolute;
  left: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 30px;
}

#stat>h1 {
  position: absolute;
  left: 10px;
}

#upload {
  grid-area: upload;
  background-color: #C4C4C4;
  width: 99%;
  height: 50%;
  border-radius: 5px;
  margin: auto;
  display: block;
  margin-top: 20px;
  position: absolute;
  right: 0;
  display: flex;
  justify-content: center;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 30px;
}

#upload>h1 {
  position: absolute;
  left: 10px;
}

form {
  display: inline-block;
  width: fit-content;
  text-align: center;
}

#keresesGomb:active {
  border: 2px solid #c4c4c4;
}

#keresesInput:focus {
  border: 2px solid #009688;
}

.statelement {
  display: block;
}

#selectfile {
  display: block;
}

h1 {
  color: rgb(132, 148, 165);
}
</style>