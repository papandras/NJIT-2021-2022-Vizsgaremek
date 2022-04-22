<template>
  <div class="shared">
    <Menu id="menu" activepage="shared"></Menu>
    <div id="content">
      <div v-if="groups != null">
        <div
          class="group"
          v-for="group in groups"
          :key="group.id"
        >
          <h1>{{ group.name }}</h1>
          <table v-if="!nofilemessage">
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
          </table>
          <div v-if="nofilemessage" class="nofilemessage">
            A csoportban nem található fájl!
          </div>
        </div>
      </div>
      <div v-if="groups == null" class="nofilemessage">
        Nem vagy tagja egy csoportnak sem!
      </div>
    </div>
  </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import axios from "axios";
import { useAuth } from "../store/auth.js";

export default {
  components: {
    Menu,
  },
  data() {
    return {
      store: useAuth(),
      groups: null,
      nofilemessage: true,
    };
  },
  methods: {
    async loadgroups() {
      await axios
        .get(`http://localhost:8881/api/user/${this.store.user.id}/groups`, {
          withCredentials: true,
        })
        .then((response) => {
          if (Object.keys(response.data) == "errors") {
            this.groups = null;
          }
          this.groups = response.data;
        });
    },
  },
  async mounted() {
    await axios
      .get("http://localhost:8881/api/user", { withCredentials: true })
      .then((response) => {
        this.store.user = response.data;
      });
    await this.loadgroups();
  },
};
</script>

<style scoped>
.shared {
  display: grid;
  grid-template-columns: 1fr 9fr;
  grid-template-rows: 1fr;
  grid-template-areas: "menu content";
}

#menu {
  grid-area: menu;
}

#content {
  padding: 20px;
  grid-area: content;
}

.group {
  background-color: rgb(245, 246, 249);
  padding-left: 20px;
  padding-right: 20px;
  width: 90%;
  display: block;
  margin: auto;
  margin-bottom: 20px;
}

.group > h1 {
  text-align: left;
  margin-bottom: 20px;
  color: rgb(132, 148, 165);
  padding-left: 10rem;
  padding-top: 1rem;
}

tr {
  margin-left: 20px;
  margin-right: 20px;
}

.nofilemessage {
  text-align: center;
  font-size: 120%;
  letter-spacing: 2px;
  text-transform: uppercase;
  padding-bottom: 50px;
  opacity: 0.3;
}
</style>