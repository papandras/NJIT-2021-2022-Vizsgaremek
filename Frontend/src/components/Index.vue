<template>
  <div class="index">
    <Menu id="menu"></Menu>
    <div id="content">
      <div id="search">
        {{message}}
        <form>
          <input type="search" name="" id="">
          <input type="submit" value="Keresés">
        </form>
        <button>Új fájl létrehozása</button>
      </div>
      <div id="last_file">
        <h1>Legutóbbi fájlok</h1>
        <LastFilesTable></LastFilesTable>
      </div>
      <div id="stat"></div>
      <div id="upload"></div>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted, ref } from "vue";
import Menu from "../components/LeftSideMenu.vue";
import LastFilesTable from "./LastFilesTable.vue";
export default {
  name: "Index",
  setup() {
    const message = ref("Nem vagy bejelentkezve");
    onMounted(async () => {
      const response = await fetch("http://localhost:8881/api/user", {
        method: "GET",
        credentials: "include",
      });

      const content = await response.json();

      message.value = `Hello ${content.name}`;
    });

    return {
      message,
    };
  },
  components: {
    Menu,
    LastFilesTable
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
  background-color: red;
}

#last_file {
  grid-area: lastfiles;
  background-color: yellow;
}

#stat {
  grid-area: stat;
  background-color: green;
}

#upload {
  grid-area: upload;
  background-color: blue;
}
</style>
