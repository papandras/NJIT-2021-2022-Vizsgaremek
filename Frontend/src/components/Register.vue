<template>
    <div id="whitediv">
      <img src="@/assets/logo.svg" alt="Logo" id="logo">
      <LoginOrRegister></LoginOrRegister>
      <form @submit.prevent="submit">
        <input v-model="data.name" type="text" placeholder="Felhasználónév" minlength="3" maxlength="20" required class="input"/>
        <sub>{{ nameLenght }}/20</sub>
        <div>{{ name }}</div>
        <input v-model="data.email" type="email" placeholder="E-mail cím" minlength="10" maxlength="50" required class="input"/>
        <sub>{{ emailLenght }}/50</sub>
        <div>{{ mail }}</div>
        <input v-model="data.password" type="password" placeholder="Jelszó" minlength="8" maxlength="20" required class="input"/>
        <sub>{{ passwordLenght }}/20</sub>
        <input v-model="data.passwordConfirm" type="password" placeholder="Jelszó megerősítés" minlength="8" maxlength="20" required class="input"/>
        <sub>{{ passwordConfirmLenght }}/20</sub>
        <input type="submit" value="Regisztrálok" id="regisztracio"/>
      </form>
      <p>vagy</p>
      <button class="google">
        <img src="https://image.similarpng.com/very-thumbnail/2020/12/Illustration-of-Google-icon-on-transparent-background-PNG.png" style="height: 20px" alt="Google icon" />
        Regisztráció Google fiókkal
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
        mounted() {},
        setup() {
            const data = reactive({
                name: "",
                email: "",
                password: "",
                passwordConfirm: "",
            });
            const router = useRouter();
            const submit = async() => {
                if (data.password == data.passwordConfirm) {
                    await fetch("http://localhost:8881/api/register", {
                            method: "POST",
                            headers: {
                                "Accept": "application/json",
                                "Content-Type": "application/json",
                            },
                            body: JSON.stringify(data),
                        })
                        .then((response) => {
                            if (response.status < 300) {
                                router.push("/");
                            }
                        })
                        .catch((error) => {
                            console.log(error.errors);
                        });
                } else {
                    alert("A jelszavak nem egyeznek!");
                }
            };
            return {
                data,
                submit,
            };
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
  #whitediv {
    width: 400px;
    height: 800px;
    background-color: white;
    border-radius: 5px;
    vertical-align: center;
    text-align: center;
    margin: auto;
    margin-top: 50px;
    padding-top: 0px;
    border: none;
  }

  form > input {
  display: block;
  margin: auto;
  }

  form > sub{
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

#regisztracio:active{
  border: 2px solid #c4c4c4;
}

.google{
  text-align: center;
  box-shadow: 1px solid #c4c4c4;
  line-height: 200%;
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