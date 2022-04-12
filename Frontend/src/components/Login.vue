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

    return {
      data,
      submit,
      store,
    };
  },
  mounted() { },
};
</script>

<style scoped>
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
  height: 600px;
  background-color: white;
  border-radius: 5px;
  vertical-align: center;
  text-align: center;
  margin: auto;
  margin-top: 50px;
  padding-top: 0px;
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

input {
  outline: none;
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