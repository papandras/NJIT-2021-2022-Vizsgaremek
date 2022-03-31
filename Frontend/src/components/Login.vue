<template>
  <div id="whitediv">
    <img src="@/assets/logo.svg" alt="Logo" id="logo">
    <LoginOrRegister></LoginOrRegister>
    <form @submit.prevent="submit">
      <input v-model="data.name" type="text" placeholder="Felhasználónév" class="input"/>
      <input v-model="data.password" type="password" placeholder="Jelszó" class="input"/>
      <input type="submit" value="Belépek" id="bejelentkezes" />
    </form>
    <p>vagy</p>
    <button class="googleButton">
      <div class="google">
        <div id="googleImg">
        <img src="@/assets/google_icon.svg" style="height: 20px" alt="Google icon" />
      </div>
      <div id="googleText">
        Bejelentkezés Google fiókkal
      </div>
      </div>
    </button>
  </div>
</template>

<script lang="ts">
import LoginOrRegister from "./LoginOrRegister.vue";
import { reactive } from "vue";
import { useRouter } from "vue-router";
export default {
  components: {
    LoginOrRegister,
  },
  setup() {
    const data = reactive({
      name: "",
      password: "",
    });
    const router = useRouter();
    const submit = async () => {
      await fetch("http://localhost:8881/api/login", {
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify(data),
      })
        .then((response) => {
          console.log(response);
          if (response.status < 300) {
            router.push("/index");
          }
        })
        .catch((error) => {
          console.log(error.errors);
        });
    };

    return {
      data,
      submit,
    };
  },
  mounted() {},
};
</script>

<style scoped>
#whitediv {
  width: 400px;
  height: 600px;
  background-color: white;
  border-radius: 5px;
  vertical-align: center;
  text-align: center;
  margin: auto;
  margin-top: 80px;
  padding-top: 0px;
  border: none;
}
form > input {
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

#bejelentkezes:active{
  border: 2px solid #c4c4c4
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

.googleButton{
  border: none;
  border-radius: 5px;
  background-color: white;
  height: 40px;
  box-shadow: 0 0 2px #009688;
}

.googleButton:active{
  border: 2px solid #009688;
}

.google {
  display: grid;
  grid-template-columns: 11% 89%;
  grid-template-rows: 100%;
  grid-template-areas: "pic content";
  margin: auto;
}

#googleImg{
  grid-area: pic;
  margin-right: 10px;
  position: relative;
  top: 5px;
}

#googleText{
  grid-area: content;
  line-height: 28px;
}

p{
  user-select: none;
}

input{
  outline: none;
}

input:focus{
  border: 2px solid #009688;
}

#logo{
  width: 400px;
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
}

</style>