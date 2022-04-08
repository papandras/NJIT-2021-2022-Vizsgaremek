<template>
  <div class="index">
    <Menu id="menu"></Menu>
    <div id="content">
      <div id="search">
        <form>
          <input type="search" name="" id="keresesInput">
        </form>
        <button id="ujFajl">Új fájl létrehozása</button>
      </div>
      <div id="last_file">
        <h1>Legutóbbi fájlok</h1>
        <LastFilesTable></LastFilesTable>
      </div>
      <div id="stat">
        <StatElement icon="media.png" typeName="Media file" size="15" progress="80" color="#03a0c2"></StatElement>
        <StatElement icon="image.png" typeName="Images" size="10" progress="60" color="#1cc842"></StatElement>
        <StatElement icon="document.png" typeName="Documents" size="7" progress="40" color="#ffc720"></StatElement>
        <StatElement icon="other.png" typeName="Other files" size="5" progress="30" color="#9a45ee"></StatElement>
      </div>
      <div id="upload"></div>
    </div>
  </div>
</template>

<script lang="ts">
import Menu from "../components/LeftSideMenu.vue";
import LastFilesTable from "./LastFilesTable.vue";
import StatElement from "./StatElement.vue";
export default {
  name: "Index",
  components: {
    Menu,
    LastFilesTable,
    StatElement
  },
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
  grid-template-rows: 2fr 4fr 4fr;
  grid-template-areas:
    "search search"
    "lastfiles lastfiles"
    "stat upload";
}

#search {
  grid-area: search;
  background-color: #C4C4C4;
  border-radius: 5px;
}

#last_file {
  grid-area: lastfiles;
}

#stat {
  grid-area: stat;
}

#upload {
  grid-area: upload;
}

form{
  display: inline-block;
  width: 80%;
}

#ujFajl{
  background-color: #009688;
  border-radius: 5px;
  border: none;
  width: 150px;
  height: 30px;
  color: white;
  display: inline-block;
}

#keresesInput{
  width: 50%;
  height: 30px;
  border-color: none;
  border: none;
  outline: none;
  border-radius: 5px;
  margin: 5px;
  display: inline-block;
}

#keresesInput:focus{
  border:2px solid #009688;
}

</style>
