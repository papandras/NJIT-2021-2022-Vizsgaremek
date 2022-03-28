<template>
    <div>
      <LoginOrRegister></LoginOrRegister>
      <form @submit.prevent="submit">
        <input
          v-model="data.name"
          type="text"
          placeholder="Felhasználónév"
          minlength="3"
          maxlength="20"
          required
        />
        <sub>{{ nameLenght }}/20</sub>
        <div>{{ name }}</div>
        <input
          v-model="data.email"
          type="email"
          placeholder="E-mail cím"
          minlength="10"
          maxlength="50"
          required
        />
        <sub>{{ emailLenght }}/50</sub>
        <div>{{ mail }}</div>
        <input
          v-model="data.password"
          type="password"
          placeholder="Jelszó"
          minlength="8"
          maxlength="20"
          required
        />
        <sub>{{ passwordLenght }}/20</sub>
        <input
          v-model="data.passwordConfirm"
          type="password"
          placeholder="Jelszó megerősítés"
          minlength="8"
          maxlength="20"
          required
        />
        <sub>{{ passwordConfirmLenght }}/20</sub>
        <input type="submit" value="Regisztrálok" />
      </form>
      <p>vagy</p>
      <button>
        <img
          src="https://image.similarpng.com/very-thumbnail/2020/12/Illustration-of-Google-icon-on-transparent-background-PNG.png"
          style="height: 20px"
          alt="Google icon"
        />
        Regisztráció Google fiókkal
      </button>
    </div>
  </template>

<script lang="ts">
    import LoginOrRegister from "./LoginOrRegister.vue";
    import {
        reactive
    } from "vue";
    import {
        useRouter
    } from "vue-router";
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