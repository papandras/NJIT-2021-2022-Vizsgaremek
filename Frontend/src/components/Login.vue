<template>
  <div id="whitediv">
    <img src="@/assets/logo.svg" alt="Logo" id="logo" />
    <LoginOrRegister></LoginOrRegister>
    <div id="failed_login" v-if="data.failed">
      Hibás felhasználónév vagy jelszó!
    </div>
    <form @submit.prevent="submit">
      <input v-model="data.name" type="text" placeholder="Felhasználónév" class="input" required minlength="3"
        maxlength="20" />
      <input v-model="data.password" type="password" placeholder="Jelszó" class="input" required minlength="8"
        maxlength="20" />
      <input type="submit" value="Belépek" id="bejelentkezes" />
    </form>
    <p>vagy</p>
    <button class="googleButton">
      <div class="google">
        <div id="googleImg">
          <img src="@/assets/google_icon.svg" style="height: 20px" alt="Google icon" />
        </div>
        <div id="googleText">Bejelentkezés Google fiókkal</div>
      </div>
    </button>
    <a href="#" @click="displayreminder">Elfelejtett jelszó</a>
    <div id="reminder" v-if="remindershow.status">
      <p>Kérjük, add meg az e-mail címed, amellyel oldalunkra regisztráltál. A megadott címre küldünk egy linket,
        amelyre kattintva jelszavad módosíthatod!</p>
        <form @submit.prevent="reminder" method="post">
          <input v-model="passwordreminder.email" type="email" placeholder="E-mail cím" minlength="10" maxlength="50" required class="input" />
          <input type="submit" value="Küldés" id="bejelentkezes">
        </form>
        <p v-if="mailsent.status" id="mailsent">Email sikeresen elküldve!</p>
    </div>
  </div>
</template>

<script lang="ts">
import axios from "axios";
import LoginOrRegister from "./LoginOrRegister.vue";
import { reactive } from "vue";
import { useRouter } from "vue-router";
import { useAuth } from "../store/auth.js";
export default {
  components: {
    LoginOrRegister,
  },
  setup() {
    const store = useAuth();
    const data = reactive({
      name: "",
      password: "",
      failed: false,
    });
    let mailsent = reactive({status: false});
    let remindershow = reactive({status: false});;
    const passwordreminder = reactive({
      email: "",
    });
    const router = useRouter();
    const submit = () => {
      axios
        .post("http://localhost:8881/api/login", data, {
          withCredentials: true,
        })
        .then((response) => {
          store.logged = true;
          router.push("/index");
        })
        .catch((error) => {
          data.failed = true;
          setTimeout(() => {
            data.failed = false;
          }, 5000);
        });
    };

    const displayreminder = () => {
      remindershow.status = !remindershow.status;
    }

    const reminder = () => {
      axios.post("http://localhost:8881/api/forgot-password", passwordreminder, {
          withCredentials: true,
        }).then(response => {
          if(response.status < 300){
            mailsent.status = true;
          }
        })
    }

    return {
      data,
      submit,
      store,
      passwordreminder,
      mailsent,
      remindershow,
      displayreminder,
      reminder
    };
  },
  mounted() { },
};
</script>

<style scoped>
a{
  display: block;
  margin-top: 20px;
  text-decoration: none;
}

#reminder{
  margin-top: 20px;
}

#mailsent{
  margin-top: 20px;
}

#failed_login {
  width: 300px;
  color: #842029;
  background-color: #f8d7da;
  border-color: #f5c2c7;
  padding: 1rem 1rem;
  margin-bottom: 1rem;
  border: 1px solid transparent;
  border-radius: 0.25rem;
  display: block;
  margin: auto;
  border-radius: 5px;
}

#whitediv {
  width: 400px;
  height: fit-content;
  background-color: white;
  border-radius: 5px;
  vertical-align: center;
  text-align: center;
  margin: auto;
  margin-top: 50px;
  padding-top: 0px;
  padding-bottom: 50px;
  border: none;
}

form>input {
  display: block;
  margin: auto;
}

#bejelentkezes {
  background-color: #009688;
  color: white;
  width: 140px;
  height: 50px;
  border-radius: 5px;
  box-shadow: none;
  margin: auto;
  border: none;
  margin-top: 20px;
}

#bejelentkezes:active {
  border: 2px solid #c4c4c4;
}

.input {
  background-color: #c4c4c4;
  opacity: 80%;
  border-radius: 5px;
  border-color: none;
  width: 60%;
  height: 30px;
  text-align: center;
  border: none;
  margin-top: 10px;
  margin-bottom: 10px;
  outline: none;
}

.googleButton {
  border: none;
  border-radius: 5px;
  background-color: white;
  height: 40px;
  box-shadow: 0 0 2px #009688;
  margin-top: 10px;
  padding-left: 20px;
  padding-right: 20px;
}

.googleButton:active {
  border: 2px solid #009688;
}

.google {
  display: grid;
  grid-template-columns: 11% 89%;
  grid-template-rows: 100%;
  grid-template-areas: "pic content";
  margin: auto;
}

#googleImg {
  grid-area: pic;
  margin-right: 10px;
  position: relative;
  top: 5px;
}

#googleText {
  grid-area: content;
  line-height: 28px;
}

p {
  user-select: none;
}

input:focus {
  border: 2px solid #009688;
}

#logo {
  width: 400px;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}
</style>