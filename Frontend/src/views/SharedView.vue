<template>
  <div class="shared">
    <Menu id="menu" activepage="shared"></Menu>
    <div id="content">
      <LastFilesTable v-for="group in groups" :key="group.id" :lastfilesobject="ngdfgsdull" :refresh="nusgddll" :title="group.name" id="groups" name="groups" />
    </div>
  </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import axios from "axios";
import { useAuth } from "../store/auth.js";
import LastFilesTable from "../components/LastFilesTable.vue";

export default {
  components: {
    Menu,
    LastFilesTable
  },
  data() {
    return {
      store: useAuth(),
      groups: null,
    }
  },
  methods: {
    async loadgroups() {
      await axios
        .get(`http://localhost:8881/api/user/${this.store.user.id}/groups`, { withCredentials: true })
        .then((response) => {
          this.groups = response.data.data;
          console.log(response.data)
        })
    }
  },
  async mounted() {
    await axios
      .get("http://localhost:8881/api/user", { withCredentials: true })
      .then((response) => {
        this.store.user = response.data;
      });
    await this.loadgroups()
  }
};
</script>

<style scoped>
.settings {
  display: grid;
  grid-template-columns: 10% 90%;
  grid-template-rows: 100%;
  grid-template-areas: "menu content";
}

#menu {
  grid-area: menu;
}

#content {
  padding: 20px;
  grid-area: content;
}
</style>