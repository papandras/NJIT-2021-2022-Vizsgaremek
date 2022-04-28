<template>
  <div class="menu">
    <ul>
        <div>
          <li>
            <div>
              <div id="picturegrid">
                <img :src="'http://localhost:8881/profilpic/'+store.user.profilpic" alt="Profilkép" title="Profilkép" />
                <label id="sziaNev" :title="store.user.name">Szia {{ store.user.name.substring(0, 12) }}<span
                    v-if="store.user.name.length > 11">...</span></label>
                <p id="counter">(<LogOutCounter></LogOutCounter>)</p>
              </div>
            </div>
          </li>
        </div>
        <div>
          <li>
            <RouterLink to="/index" class="routerLink"><input type="button" value="Főoldal" id="index" /></RouterLink>
          </li>
          <li>
            <RouterLink to="/myfiles" class="routerLink"><input type="button" value="Saját fájlok" id="owned" /></RouterLink>
          </li>
          <li>
            <RouterLink to="/shared" class="routerLink"><input type="button" value="Velem megosztva" id="shared" /></RouterLink>
          </li>
          <li>
            <RouterLink to="/users" class="routerLink"><input type="button" value="Felhasználók" id="users" />
            </RouterLink>
          </li>
        </div>
        <div>
          <li v-if="store.user.role == 'admin'">
            <RouterLink to="/admin" class="routerLink"><input type="button" value="Admin" id="admin" /></RouterLink>
          </li>
          <li>
            <RouterLink to="/settings" class="routerLink"><input type="button" value="Beállítások" id="settings" />
            </RouterLink>
          </li>
          <li>
            <RouterLink to="/logout" @click="logout" class="routerLink"><input type="button" value="Kijelentkezés"
                id="logout" /></RouterLink>
          </li>
        </div>
    </ul>
  </div>
</template>

<style scoped>
.menu {
  z-index: 999;
  width: fit-content;
  height: 100vh;
  background-color: #c4c4c4;
  position: fixed;
}

ul {
  list-style-type: none;
  background-color: #c4c4c4;
  width: fit-content;
  overflow: auto;
  border-radius: 5px;
  display: flex;
  padding: 20px;
  flex-direction: column;
  justify-content: space-between;
}

li input,
#sziaNev,
label {
  display: block;
  margin: auto;
  width: 150px;
  height: 30px;
  margin-top: 20px;
  margin-bottom: 20px;
  text-decoration: none;
  text-align: center;
  background-color: white;
  color: black;
  border-radius: 5px;
  border: none;
}

#sziaNev {
  height: auto;
  padding-top: 10px;
  padding-bottom: 10px;
}

li input:active {
  background-color: #009688;
}

.routerLink {
  text-decoration: none;
}

.routerLink>input:active {
  border: 2px solid #E9D8A6;
}

#picturegrid>img {
  height: 50px;
  width: 50px;
  background-color: white;
  border-radius: 50%;
  margin: auto;
  display: block;
}

#counter {
  text-align: center;
}
</style>
<script>
import axios from "axios";
import { useAuth } from "../store/auth.js";
import { useRouter } from "vue-router";
import LogOutCounter from "./LogOutCounter.vue";
export default {
  name: "Menu",
  components: {
    LogOutCounter,
  },
  props: {
    activepage: String
  },
  setup() {
    const store = useAuth();
    const router = useRouter();
    const logout = async () => {
      await axios
        .post("http://localhost:8881/api/logout", null, {
          withCredentials: true,
        })
        .then((response) => {
          store.logged = false;
        });
    };

    return {
      logout,
      store,
    };
  },
  async mounted() {
    this.$nextTick(function () {
      document.getElementById(this.activepage).style.backgroundColor = "#009688";
    })
    const store = useAuth();
    await axios.get("http://localhost:8881/api/getNewCookie", {
      withCredentials: true,
    });
    await axios
      .get("http://localhost:8881/api/user", { withCredentials: true })
      .then((response) => {
        store.user = response.data;
      });
  },
};
</script>