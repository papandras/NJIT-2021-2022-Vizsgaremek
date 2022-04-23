<template>
    <div id="admin_files">
        <form @submit.prevent="searchFile">
            <label for="username">Add meg a keresett fájl nevét: </label>
            <input type="text" id="username" required>
            <input class="button" type="submit" value="Keresés">
            <label @click="getallfile">[Összes megjelenítése]</label>
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
            message: "Nincsen keresett érték"
        }
    },
    methods: {
        searchFile() {

        },
        getallfile() {

        }
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
    width: 300px;
    height: 30px;
    text-align: center;
    border: none;
    margin-top: 10px;
    margin-bottom: 10px;
    outline: none;
}

table {
    border-collapse: separate;
    width: 80%;
    margin: auto;
    color: rgb(70, 84, 114);
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