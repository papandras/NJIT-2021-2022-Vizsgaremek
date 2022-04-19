<template>
    <h1>Csoportjaid</h1>
    <p>a fájlokat csoportokkal lehet megosztani</p>
    <hr />
    <div v-if="groups == null || groups.length == 0">
        Jelenleg nincs egy csoportod sem!
    </div>
    <div>
        <button class="createButton" @click="showform = !showform">
            <div class="create">
                <div id="createImg">
                    <img src="src/assets/add_icon.svg" style="height: 20px" alt="addicon" />
                </div>
                <div id="createText">Csoport létrehozása</div>
            </div>
        </button>
        <form @submit.prevent="createGroup" v-if="showform" id="addgroup">
            <input type="text" id="name" placeholder="Csoport neve" required v-model="newgroupname">
            <input type="submit" value="Létrehozás" id="submit">
        </form>
    </div>
    <ul id="grouplist">
        <li v-for="group in groups" :key="group.id" class="groupListItem" :title="group.name">
            <strong class="groupname">{{ group.name }}</strong>
            <img src="src/assets/delete_icon.svg" alt="delete_friend_icon" class="deletegroup"
                @click="deletegroup(group.id)" />
            
            <Groupmember :id="group.id" :name="group.name"/>
        </li>
    </ul>
</template>

<script>
import axios from "axios";
import Groupmember from "../components/Groupmembers.vue"
export default {
    data() {
        return {
            groups: null,
            showform: false,
            newgroupname: "",
        }
    },
    components:{
        Groupmember
    },
    methods: {
        createGroup() {
            axios.post("http://localhost:8881/api/group/create", { name: this.newgroupname },
                { withCredentials: true, mode: "no-cors" })
                .then(response => {
                    this.showform = !this.showform
                    this.getGroups()
                })
        },
        getGroups() {
            axios.get("http://localhost:8881/api/user/groups", {
                withCredentials: true,
            }).then(response => {
                this.groups = response.data
            })
        },
        deletegroup(id) {
            axios.delete(`http://localhost:8881/api/group/${id}/delete`, { withCredentials: true, mode: "no-cors" })
                .then(response => {
                    this.getGroups()
                })
        },
    },
    mounted() {
        this.getGroups()
    }
}
</script>

<style scoped>
p{
    width: 95%;
}
#submit {
    background-color: #009688;
    color: white;
    width: 140px;
    height: 50px;
    border-radius: 5px;
    box-shadow: none;
    margin: auto;
    border: none;
    margin-top: 20px;
    display: block;
}

#submit:active {
    border: 2px solid #c4c4c4;
}

#name {
    background-color: #c4c4c4;
    opacity: 80%;
    border-radius: 5px;
    border-color: none;
    width: 180px;
    height: 30px;
    text-align: center;
    border: none;
    margin-top: 10px;
    outline: none;
}

label {
    display: block;
}

#addicon {
    height: 30px;
}

.createButton {
    border: none;
    border-radius: 5px;
    background-color: white;
    height: 40px;
    box-shadow: 0 0 2px #009688;
    margin-top: 10px;
    padding-left: 20px;
    padding-right: 20px;
}

.createButton:active {
    border: 2px solid #c4c4c4;
}

.create {
    display: grid;
    grid-template-columns: 11% 89%;
    grid-template-rows: 100%;
    grid-template-areas: "pic content";
    margin: auto;
}

#createImg {
    grid-area: pic;
    margin-right: 10px;
    position: relative;
    top: 5px;
}

#createText {
    grid-area: content;
    line-height: 28px;
}

.groupListItem {
    background-color: #E9D8A6;
    border-radius: 10px;
    padding: 20px;
    padding-left: 50px;
    padding-right: 50px;
    display: inline-block;
    margin-top: 5px;
    margin-bottom: 5px;
    width: 300px;
    position: relative;
}

.groupListItem:hover img {
    display: inline-block;
}

.deletegroup {
    height: 30px;
    position: absolute;
    right: 30px;
    bottom: 15px;
    display: none;
}

.groupname{
    font-size: 120%;
    margin-bottom: 20px;
}

#addgroup{
    margin: auto;
    margin-top: 20px;
    border-top: 1px solid rgba(0,150,136, 0.8);
    border-left: 1px solid rgba(0,150,136, 0.4);
    border-right: 1px solid rgba(0,150,136, 0.4);
    border-bottom: 1px solid rgba(0,150,136, 0.5);
    padding-top: 10px;
    padding-bottom: 10px;
    width: 50%;
    display: block;
    background-color: rgba(0,150,136, 0.1);
}
</style>