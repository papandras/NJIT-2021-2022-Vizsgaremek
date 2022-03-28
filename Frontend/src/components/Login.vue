<template>
  <div>
    <div id="success"></div>
    <LoginOrRegister></LoginOrRegister>
    <form @submit.prevent="submit">
      <input v-model="data.name" type="text" placeholder="Felhasználónév" />
      <input v-model="data.password" type="password" placeholder="Jelszó" />
      <input type="submit" value="Bejelentkezek" />
      <!--<RouterLink to="/index"><input type="submit" value="Bejelentkezek" @click="Login"></RouterLink>-->
    </form>
    <p>vagy</p>
    <button>
      <img
        src="https://image.similarpng.com/very-thumbnail/2020/12/Illustration-of-Google-icon-on-transparent-background-PNG.png"
        style="height: 20px"
        alt="Google icon"
      />
      Bejelntkezés Google fiókkal
    </button>
  </div>
</template>

<script lang="ts">
import LoginOrRegister from "./LoginOrRegister.vue";
import {reactive} from "vue";
import {useRouter} from "vue-router";
export default {
  components: {
    LoginOrRegister,
  },
  setup(){
    const data = reactive({
      name: '',
      password: ''
    });
    const router = useRouter();
    const submit = async() => {
        await fetch("http://localhost:8881/api/login", {
              method: "POST",
              headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json",
              },
              credentials: 'include',
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
    }

    return{
      data,
      submit
    }
  },
  mounted() {},
};
</script>