<template>
  <div class="shared">
    <Menu id="menu" activepage="shared"></Menu>
    <div id="content">
      <div v-if="groups != null">
        <div class="group" v-for="group in groups" :key="group.id">
          <h1>{{ group.name }}</h1>
          <table :id="group.id + '-table'">
            <tr class="thead">
              <th>Típus</th>
              <th>Dokumentum neve</th>
              <th>Méret</th>
              <th>Tulajdonos</th>
              <th>Letöltés</th>
            </tr>
            <TableRow :groupid="group.id" :nofilemessage="
              () => {
                nofilemessage = true;
              }
            " />
            <tr>
              <td colspan="4"></td>
              <td><p class="leavegroup" @click="leavegroup(group.id)">[Kilépés a csoportból]</p></td>
            </tr>
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
    leavegroup(id){
      axios.delete(`http://localhost:8881/api/group/${id}/leave`, { withCredentials: true })
          .then(response => {
            this.loadgroups()
          })
    }
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

.group>h1 {
  text-align: left;
  margin-bottom: 20px;
  color: rgb(132, 148, 165);
  padding-left: 10rem;
  padding-top: 1rem;
}

table {
  border-collapse: collapse;
  width: fit-content;
  margin: auto;
  color: rgb(70, 84, 114);
  text-align: center;
  padding-bottom: 20px;
}

tr:first-child {
  color: rgb(179, 187, 198);
  border-radius: 10px;
  margin-top: 10px;
  margin-bottom: 10px;
  padding-bottom: 20px;
}

th {
  padding: 5px;
  padding-left: 10px;
  padding-right: 10px;
  text-align: center;
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

.leavegroup{
  padding-top: 20px;
  padding-bottom: 20px;
}

.leavegroup:active {
  color: rgb(0, 150, 136);
}
</style>