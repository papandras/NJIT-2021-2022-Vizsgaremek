<template>
  <div class="menu">
    <ul>
      <div id="menucontent">
        <div>
          <li></li>
          <li>
            <div>
              <div id="picturegrid">
                <img src="#" alt="" />
                <label id="sziaNev">Szia {{ store.user.name }}</label>
                <p id="counter">(<LogOutCounter></LogOutCounter>)</p>
              </div>
            </div>
          </li>
        </div>
        <div>
          <li>
            <RouterLink to="/index" class="routerLink"
              ><input type="button" value="Főoldal" class="Főoldal"
            /></RouterLink>
          </li>
          <li>
            <RouterLink to="#" class="routerLink"
              ><input
                type="button"
                value="Megosztott fájlok"
                class="MegosztottFájlok"
            /></RouterLink>
          </li>
          <li>
            <RouterLink to="#" class="routerLink"
              ><input type="button" value="Kedvencek" class="Kedvencek"
            /></RouterLink>
          </li>
          <li>
            <RouterLink to="#" class="routerLink"
              ><input type="button" value="Törölt elemek" class="TöröltElemek"
            /></RouterLink>
          </li>
          <li>
            <RouterLink to="/users" class="routerLink"
              ><input type="button" value="Felhasználók" class="TöröltElemek"
            /></RouterLink>
          </li>
        </div>
        <div>
          <li>
            <RouterLink to="#" class="routerLink"
              ><input type="button" value="Statisztika" class="Statisztika"
            /></RouterLink>
          </li>
          <li>
            <RouterLink to="#" class="routerLink"
              ><input type="button" value="Beállítások" class="Beállítások"
            /></RouterLink>
          </li>
          <li>
            <RouterLink to="/logout" @click="logout" class="routerLink"
              ><input type="button" value="Kijelentkezés" class="Kijelentkezés"
            /></RouterLink>
          </li>
        </div>
      </div>
    </ul>
  </div>
</template>

<style scoped>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  background-color: #c4c4c4;
  height: 100%;
  position: fixed;
  overflow: auto;
  border-radius: 5px;
}

#menucontent {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 70%;
}

li input, #sziaNev, label {
  display: block;
  width: 150px;
  height: 30px;
  margin: 20px;
  text-decoration: none;
  text-align: center;
  background-color: white;
  color: black;
  border-radius: 5px;
  border: none;
}

li input:active {
  background-color: #009688;
}

.routerLink {
  text-decoration: none;
}

#picturegrid > img {
  height: 50px;
  width: 50px;
  background-color: white;
  border-radius: 50%;
  margin: auto;
  display: block;
}

#counter{
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
  setup() {
    const store = useAuth();
    const router = useRouter();
    const logout = async () => {
      await axios
        .post("http://localhost:8881/api/logout", null, {
          withCredentials: true,
        })
        .then((response) => {
          router.push("/unauthorized");
        });
    };

    return {
      logout,
      store,
    };
  },
  mounted() {
    const store = useAuth();
    axios.get("http://localhost:8881/api/getNewCookie", {
      withCredentials: true,
    });
    axios
      .get("http://localhost:8881/api/user", { withCredentials: true })
      .then((response) => {
        store.user = response.data;
      });
  },
};
</script>