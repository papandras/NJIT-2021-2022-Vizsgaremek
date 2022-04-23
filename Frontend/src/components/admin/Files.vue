<template>
    <div id="admin_files">
        <form @submit.prevent="searchFile">
            <input type="text" id="filename" v-model="searchvalue.file" placeholder="Fájl neve">
            <input type="text" id="username" v-model="searchvalue.user" placeholder="Felhasználó neve">
            <input class="button" type="submit" value="Keresés">
            <p id="help">Itt tudsz szűrni fájl és/vagy felhasználó névre. Ha nem adsz meg semmi akkor mindent kilistáz!</p>
        </form>
        <table v-if="files != null">
            <tr>
                <th>Név</th>
                <th>Kiterjesztés</th>
                <th>Méret</th>
                <th>Tulajdonos</th>
                <th>Feltöltve</th>
                <th>Legutóbb módosítva</th>
                <th>Letöltés</th>
                <th>Törlés</th>
            </tr>
            <tr v-for="file in files">
                <td>{{ file.name }}</td>
                <td>{{ file.type }}</td>
                <td>{{ file.size }}</td>
                <td>{{ file.owner }}</td>
                <td>{{ file.uploaded }}</td>
                <td>{{ file.edited }}</td>
                <td><button class="button downloadbutton"
                        @click="download(file.type, file.name, file.owner)">Letöltés</button></td>
                <td><button class="button deletebutton"
                        @click="deletefile(file.type, file.name, file.owner)">Törlés</button></td>
            </tr>
        </table>
        <div class="message" v-if="files == null">
            {{ message }}
        </div>
    </div>
</template>

<script>
import axios from "axios";
export default {
    data() {
        return {
            files: null,
            message: "Nincsen keresett érték",
            searchvalue: {
                user: null,
                file: null,
            }
        }
    },
    methods: {
        searchFile() {
            console.log(this.searchvalue)
            axios
                .post(
                    "http://localhost:8881/api/admin/files/",
                    this.searchvalue,
                    { withCredentials: true, mode: "no-cors" }
                )
                .then((response) => {
                    console.log(response.data)
                    this.files = response.data.data
                    console.log(this.files)
                    if (this.files.length == 0) {
                        this.files = null
                        this.message = "Nincsen találat"
                    }
                });
        },
        download(type, title, username) {
            let filename = `${username}-${title}.${type}`;
            axios.get(`http://localhost:8881/api/file/download/${filename}`, { withCredentials: true, responseType: 'arraybuffer' })
                .then(response => {
                    console.log(response.data)
                    let blob = new Blob([response.data])
                    let link = document.createElement('a')
                    link.href = window.URL.createObjectURL(blob)
                    link.download = `${title}.${type}`
                    link.click()
                })
        },
        deletefile(type, title, username) {
            let conf = confirm("Biztosan törli?")
            if (conf) {
                let filename = `${username}-${title}.${type}`;
                axios.delete(`http://localhost:8881/api/file/delete/${filename}`, { withCredentials: true })
                    .then(response => {
                        this.searchFile()
                    })
            }
        }
    },
    mounted() {
        this.searchFile()
    }
}
</script>

<style>
#admin_files {
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
    width: 150px;
    height: 30px;
    text-align: center;
    border: none;
    margin-top: 10px;
    margin-bottom: 10px;
    margin-right: 10px;
    outline: none;
}

input[type=submit] {
    display: block;
    margin: auto;
    margin-bottom: 10px;
}

table {
    border-collapse: separate;
    width: 80%;
    margin: auto;
    margin-top: 20px;
    color: rgb(70, 84, 114);
}

td:first-child {
    text-align: left;
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

.downloadbutton {
    background-color: #35b14a;
}

#help {
    padding-top: 10px;
    padding-bottom: 10px;
    padding-left: 20px;
    padding-right: 20px;
    border-radius: 10px;
    background-color: rgb(245, 246, 249);
    width: fit-content;
    margin: auto;
}
</style>