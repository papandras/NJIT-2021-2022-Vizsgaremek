<template>
  <div id="whitediv">
    <LoginOrRegister></LoginOrRegister>
    <form @submit.prevent="submit">
      <input v-model="data.name" type="text" placeholder="Felhasználónév" class="input"/>
      <input v-model="data.password" type="password" placeholder="Jelszó" class="input"/>
      <input type="submit" value="Belépek" id="bejelentkezes" />
    </form>
    <p>vagy</p>
    <button class="google">
      <img src="https://image.similarpng.com/very-thumbnail/2020/12/Illustration-of-Google-icon-on-transparent-background-PNG.png" style="height: 20px" alt="Google icon" />
      Bejelntkezés Google fiókkal
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

.google {
  border: none;
  border-radius: 5px;
  background-color: white;
}

p{
  user-select: none;
}
</style>