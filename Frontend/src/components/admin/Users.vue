<template>
    <div id="admin_users">
        <form @submit.prevent="searchUser">
            <label for="username">Add meg a keresett felhasználó nevét: </label>
            <input type="text" id="username" required>
            <input class="button" type="submit" value="Keresés">
            <label @click="getalluser">[Összes megjelenítése]</label>
        </form>
        <table v-if="users != null">
            <tr>
                <th>Név</th>
                <th>Tárhely foglaltsága</th>
                <th>Regisztrált</th>
                <th>Szerepkör módosítása</th>
                <th>Törlés</th>
            </tr>
        </table>
        <div class="message" v-if="users == null">
            {{ message }}
        </div>
    </div>
</template>

<style>
#admin_users {
    width: 90%;
    background-color: white;
    display: block;
    margin: auto;
    border-radius: 10px;
    padding: 10px;
    padding-left: 30px;
    padding-right: 30px;
    text-align: center;
}

.message {
  text-align: center;
  font-size: 120%;
  letter-spacing: 2px;
  text-transform: uppercase;
  padding-top: 50px;
  padding-bottom: 50px;
  opacity: 0.3;
}
</style>

<script>
import axios from "axios";
export default {
    data() {
        return {
            users: null,
            message: "Nincsen keresett érték"
        }
    },
    methods: {
        searchUser() {

        },
        getalluser() {

        }
    }
}
</script>