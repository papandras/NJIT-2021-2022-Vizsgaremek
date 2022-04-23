<template>
    <div id="admin_users">
        <form @submit.prevent="searchUser('value')">
            <label for="username">Add meg a keresett felhasználó nevét: </label>
            <input type="text" id="username" v-model="username" required>
            <input class="button" type="submit" value="Keresés">
            <label @click="searchUser(null)" id="showall">[Összes megjelenítése]</label>
        </form>
        <table v-if="users != null">
            <tr>
                <th>Név</th>
                <th>Email</th>
                <th>Tárhely foglaltsága</th>
                <th>Regisztrált</th>
                <th>Szerepkör módosítása</th>
                <th>Törlés</th>
            </tr>
            <tr v-for="user in users" :key="user.id">
                <td>{{ user.name }}</td>
                <td>{{ user.email }}</td>
                <td>{{ user.filesize }}</td>
                <td>{{ user.registered }}</td>
                <td>
                    <p>Jelenlegi: {{ user.role }}</p>
                    <button class="button sharebutton" v-if="user.role == 'user'"
                        @click="changerole(user.id, user.name, 'admin')">Legyen admin</button>
                    <button class="button sharebutton" v-if="user.role == 'admin'"
                        @click="changerole(user.id, user.name, 'user')">Legyen user</button>
                </td>
                <td>
                    <br>
                    <button class="button deletebutton" @click="deleteuser(user.id, user.name)">Törlés</button>
                </td>
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

input[type=text] {
    background-color: #c4c4c4;
    opacity: 80%;
    border-radius: 5px;
    border-color: none;
    width: 300px;
    height: 30px;
    text-align: center;
    border: none;
    margin-top: 10px;
    margin-bottom: 10px;
    outline: none;
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

.deletebutton {
    background-color: #DC143C;
}

.sharebutton {
    background-color: #0f52ba;
}

#showall {
    cursor: pointer;
}

#showall:active {
    color: red;
}
</style>

<script>
import axios from "axios";
export default {
    data() {
        return {
            users: null,
            message: "Nincsen keresett érték",
            username: null
        }
    },
    methods: {
        searchUser(value) {
            let url = `http://localhost:8881/api/admin/users/${this.username}`
            if (value == null) {
                url = `http://localhost:8881/api/admin/users`
            }
            axios.get(url, { withCredentials: true })
                .then(response => {
                    this.users = response.data.data
                    if (this.users.length == 0) {
                        this.users = null
                        this.message = "Nincsen találat"
                    }
                })
        },
        changerole(id, name, role) {
            let conf = confirm(`Biztosan ${role} szerepkört adsz ${name} felhasználónak?`)
            if (conf) {
                axios.put(`http://localhost:8881/api/admin/users/setrole/${id}/${role}`, null, { withCredentials: true })
                    .then(response => {
                        this.searchUser(null)
                    })
            }
        },
        deleteuser(id, name) {
            let conf = confirm(`Biztosan törlöd ${name} felhasználót az adatbázisból?`)

            if (conf) {
                axios.delete(`http://localhost:8881/api/admin/users/delete/${id}`, { withCredentials: true })
                    .then(response => {
                        this.searchUser(null)
                    })
            }
        }
    },
    mounted() {
        this.searchUser(null)
    }
}
</script>