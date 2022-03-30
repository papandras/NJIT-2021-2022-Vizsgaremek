<template>
  <div>
    <div id="success"></div>
    <LoginOrRegister></LoginOrRegister>
    <form @submit.prevent="submit">
      <input v-model="data.name" type="text" placeholder="Felhasználónév" id="felhasznalonev" />
      <input v-model="data.password" type="password" placeholder="Jelszó" id="jelszo"/>
      <input type="submit" value="Belépek" id="bejelentkezes" />
      <!--<RouterLink to="/index"><input type="submit" value="Bejelentkezek" @click="Login"></RouterLink>-->
    </form>
    <p>vagy</p>
    <button class="google">
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

<style scoped>
  #bejelentkezes{
    background-color: #009688;
    color: white;
    width: 140px;
    height: 50px;
    border-radius: 5px;
    box-shadow: none;
    margin: auto;
    margin-top: 30px;
    margin-left: 685px;
    border: none;
  }

  #felhasznalonev{
    margin-top: -380px;
    margin-left: 640px;
    display: flex;
    justify-content: center;
    background-color: #C4C4C4;
    opacity: 80%;
    border-radius: 5px;
    border-color: none;
    width: 15%;
    height: 30px;
    text-align: center;
    border: none;
  }

  #jelszo{
    margin-top: 20px;
    margin-left: 640px;
    display: flex;
    justify-content: center;
    background-color: #C4C4C4;
    opacity: 80%;
    border-radius: 5px;
    border-color: none;
    width: 15%;
    height: 30px;
    text-align: center;
    border: none;
  }

  p{
    margin-top: 30px;
    margin-left: 740px;
  }

  .google{
    margin-top: 10px;
    margin-left: 660px;
    border: none;
    border-radius: 5px;
    background-color: white;
  }
</style>