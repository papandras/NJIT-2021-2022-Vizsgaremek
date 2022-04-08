<template>
    <div class="menu">
        <ul>
            <div id="menucontent">
              <div>
                <li>

                </li>
                <li>
                    <div class="profpic">
                        <img src="#" alt="profilpic">
                        <p>Szia {{ "store.user.name" }}</p>
                        <p>(<LogOutCounter></LogOutCounter>)</p>
                    </div>
                </li>
              </div>
              <div>
                <li>
                    <RouterLink to="#" class="routerLink"><input type="button" value="Főoldal" class="Főoldal"></RouterLink>
                </li>
                <li>
                    <RouterLink to="#" class="routerLink"><input type="button" value="Megosztott fájlok" class="MegosztottFájlok"></RouterLink>
                </li>
                <li>
                    <RouterLink to="#" class="routerLink"><input type="button" value="Kedvencek" class="Kedvencek"></RouterLink>
                </li>
                <li>
                    <RouterLink to="#" class="routerLink"><input type="button" value="Törölt elemek" class="TöröltElemek"></RouterLink>
                </li>
              </div>
              <div>
                <li>
                    <RouterLink to="#" class="routerLink"><input type="button" value="Statisztika" class="Statisztika"></RouterLink>
                </li>
                <li>
                    <RouterLink to="#" class="routerLink"><input type="button" value="Beállítások" class="Beállítások"></RouterLink>
                </li>
                <li>
                    <RouterLink to="/" @click="logout" class="routerLink"><input type="button" value="Kijelentkezés" class="Kijelentkezés"></RouterLink>
                </li>
              </div>
            </div>
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

ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  background-color: #C4C4C4;
  height: 100%;
  position: fixed;
  overflow: auto;
  border-radius: 5px;
  
}

#menucontent{
display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: 70%;
}

li input {
  display: block;
  width: 150px;
  height: 30px;
  color: #000;
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

.routerLink{
  text-decoration: none;
}

</style>
<script>
import { useAuth } from '../store/auth.js';
import { useRouter } from "vue-router";
import LogOutCounter from "./LogOutCounter.vue";
import axios from 'axios';
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
      axios.post("http://localhost:8881/api/logout", null, {
        withCredentials: true
      })
      .then(response => {
        router.push("/unauthorized");
      })
    };

    return {
      logout,
    };
  },
  mounted(){
    axios.get("http://localhost:8881/api/getNewCookie",{ withCredentials: true })
  }
};
</script>