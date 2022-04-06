<template>
    <div class="menu">
        <ul>
            <li>

            </li>
            <li>
                <div class="profpic">
                    <img src="#" alt="profilpic">
                    <p>Szia {{ store.user.name }}</p>
                    <p>(<LogOutCounter></LogOutCounter>)</p>
                </div>
            </li>
            <li>
                <RouterLink to="#"><p>Főoldal</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Megosztott fájlok</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Kedvencek</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Törölt elemek</p></RouterLink>
            </li>
            <li class="stat">
                <RouterLink to="#"><p>Statisztika</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Beállítások</p></RouterLink>
            </li>
            <li>
                <RouterLink to="/" @click="logout">Kijelentkezés</RouterLink>
            </li>
        </ul>
    </div>
</template>

<style scoped>

.profpic{
    margin: 20px 0px 0px 15px;
    width: 150px;
    height: 100px;
    background-color: red;
}
.stat{
    margin-top: 100px;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  background-color: #C4C4C4;
  height: 100%;
  position: fixed;
  overflow: auto;
}

li a {
  display: block;
  width: 150px;
  height: 30px;
  color: #000;
  margin: 20px;
  text-decoration: none;
  text-align: center;
  background-color: white;
  color: black;
}

li a:hover {
  background-color: red;
  color: white;
}

li a:active {
  background-color: #04AA6D;
  color: white;
}
</style>
<script>
import { useAuth } from '../store/auth.js';
import { useRouter } from "vue-router";
import LogOutCounter from "./LogOutCounter.vue";
export default {
  name: "Menu",
  components: {
    LogOutCounter
  },
  data() {
    return {
      store: useAuth(),
    };
  },
  setup() {
    const router = useRouter();
    const logout = async () => {
      alert("biztos?");
      await fetch("http://localhost:8881/api/logout", {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        credentials: "include",
      }).then((response) => {
        if (response.status < 300) {
          router.push("/");
        }
      });
    };

    return {
      logout,
    };
  },
  async mounted() {
    await fetch("http://localhost:8881/api/getNewCookie", {
      method: "GET",
      headers: {
        Accept: "application/json",
        "Content-Type": "application/json",
      },
      credentials: "include",
    });
  },
};
</script>