<template>
  <div id="whitediv">
    <img src="@/assets/logo.svg" alt="Logo" id="logo" />
    <LoginOrRegister></LoginOrRegister>
    <div id="invalidconfirm">A jelszavak nem egyeznek!</div>
    <form @submit.prevent="submit">
      <input v-model="data.name" type="text" placeholder="Felhasználónév" minlength="3" maxlength="20" required
        class="input" />
      <div v-for="name in errors.name" class="failed_login">{{ name }}</div>
      <sub>{{ nameLenght }}/20</sub>
      <input v-model="data.email" type="email" placeholder="E-mail cím" minlength="10" maxlength="50" required
        class="input" />
      <div v-for="email in errors.email" class="failed_login">{{ email }}</div>
      <sub>{{ emailLenght }}/50</sub>
      <input v-model="data.password" type="password" placeholder="Jelszó" minlength="8" maxlength="20" required
        class="input" id="password" />
      <div v-for="password in errors.password" class="failed_login">{{ password }}</div>
      <sub>{{ passwordLenght }}/20</sub>
      <input v-model="data.passwordConfirm" type="password" placeholder="Jelszó megerősítés" minlength="8"
        maxlength="20" required class="input" id="confirm" />
      <sub>{{ passwordConfirmLenght }}/20</sub>
      <input type="submit" value="Regisztrálok" id="regisztracio" />
      <p>vagy</p>
      <button class="googleButton">
        <div class="google">
          <div id="googleImg">
            <img src="@/assets/google_icon.svg" style="height: 20px" alt="Google icon" />
          </div>
          <div id="googleText">Regisztráció Google fiókkal</div>
        </div>
      </button>
    </form>
  </div>
</template>

<script lang="ts">
import LoginOrRegister from "./LoginOrRegister.vue";
import { reactive } from "vue";
import axios from "axios";
import { useRouter } from "vue-router";
export default {
  components: {
    LoginOrRegister,
  },
  data() {
    return {
      errors: {
        name: "",
        email: "",
        password: "",
      },
      data: {
        name: "",
        email: "",
        password: "",
        passwordConfirm: "",
      },
      router: useRouter()
    };
  },
  mounted() { },
  methods: {
    async submit() {
      if (this.data.password == this.data.passwordConfirm) {
        try {
          await axios.post("http://localhost:8881/api/register", this.data)
          document.getElementsByTagName("form")[0].innerHTML = "Sikeres regisztráció!";
          setTimeout(() => {
            this.router.push("/");
          }, 5000);
        }
        catch (e) {
          console.log(e.response.data.errors);
          this.errors = e.response.data.errors;
        }
      } else {
        document.getElementById("confirm").style.border = "2px solid #842029";
        document.getElementById("confirm").classList.add("invalid");
        document.getElementById("invalidconfirm").style.display = "block";
        setTimeout(() => {
          document.getElementById("confirm").classList.remove("invalid");
          document.getElementById("confirm").value = null;
        }, 300);
        setTimeout(() => {
          document.getElementById("confirm").style.border = "none";
          document.getElementById("invalidconfirm").style.display = "none";
        }, 5000);
      }
    },
  },
  computed: {
    nameLenght() {
      return this.data.name.length;
    },
    emailLenght() {
      return this.data.email.length;
    },
    passwordLenght() {
      return this.data.password.length;
    },
    passwordConfirmLenght() {
      return this.data.passwordConfirm.length;
    },
  },
};
</script>

<style scoped>
.failed_login {
  color: red;
}

#invalidconfirm {
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
  display: none;
}

.invalid {
  animation: shake 300ms;
}

@keyframes shake {
  25% {
    transform: translateX(4px);
  }

  50% {
    transform: translateX(-4px);
  }

  75% {
    transform: translateX(4px);
  }
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
  margin-bottom: 20px;
  padding-top: 0px;
  padding-bottom: 20px;
  border: none;
}

form>input {
  display: block;
  margin: auto;
}

form>sub {
  position: relative;
  left: 30%;
  user-select: none;
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

#regisztracio {
  background-color: #009688;
  color: white;
  width: 140px;
  height: 50px;
  border-radius: 5px;
  box-shadow: none;
  margin: auto;
  border: none;
}

#regisztracio:active {
  border: 2px solid #c4c4c4;
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

#logo {
  width: 400px;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}
</style>