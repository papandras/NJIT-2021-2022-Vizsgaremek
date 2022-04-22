<template>
  <div class="shared">
    <Menu id="menu" activepage="shared"></Menu>
    <div id="content">
      <div v-if="groups != null">
        <div class="group" v-for="group in groups" :key="group.id">
          <h1>{{ group.name }}</h1>
          <table :id="group.id + '-table'">
            <div>
              <tr>
                <th>Típus</th>
                <th>Dokumentum neve</th>
                <th>Méret</th>
                <th>Tulajdonos</th>
                <th>Letöltés</th>
              </tr>
            </div>
            <TableRow
              :groupid="group.id"
              :nofilemessage="
                () => {
                  nofilemessage = true;
                }
              "
            />
          </table>
          <div class="nofilemessage" :id="group.id + '-nofile'">
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
import TableRow from "../components/GroupFilesRow.vue";

export default {
  components: {
    Menu,
    TableRow,
  },
  data() {
    return {
      store: useAuth(),
      groups: null,
      nofilemessage: false,
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
          } else {
            this.groups = response.data;
          }
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
  background-color: #c4c4c4;
  width: 90%;
  display: block;
  margin: auto;
  margin-bottom: 20px;
  padding-top: 20px;
  padding-bottom: 20px;
}

.group > h1 {
  text-align: left;
  margin-bottom: 20px;
  color: rgb(132, 148, 165);
  padding-left: 10rem;
  padding-top: 1rem;
}

table {
  display: block;
  margin: auto;
  width: 90%;
  background-color: rgb(245, 246, 249);
  padding-left: 10rem;
  padding-top: 1rem;
  padding-bottom: 20px;
  border-collapse: collapse;
}

tr {
  margin-left: 20px;
  margin-right: 20px;
}

th {
  padding: 5px;
  padding-left: 10px;
  padding-right: 10px;
  width: 20%;
  text-align: center;
}

tr:first-child {
  color: rgb(179, 187, 198);
}

.nofilemessage {
  text-align: center;
  font-size: 120%;
  letter-spacing: 2px;
  text-transform: uppercase;
  padding-bottom: 50px;
  opacity: 0.3;
  display: none;
}
</style>