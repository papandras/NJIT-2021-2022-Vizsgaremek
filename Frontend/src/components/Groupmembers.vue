<template>
    <ul v-if="groupmembers != null && groupmembers.length != 0">
        <li v-for="member in groupmembers">{{ member[0].nev }} <span class="removemember" @click="removemember(member[0].id)">[Tag eltávolítása]</span></li>
    </ul>
    <p v-if="groupmembers == null || groupmembers.length == 0">Nincs tag hozzárendelve!</p>
</template>

<script>
import axios from "axios";
export default {
    data() {
        return {
            groupmembers: null,
        }
    },
    props: {
        id: Number
    },
    methods: {
        getmembers() {
            axios.get(`http://localhost:8881/api/group/${this.id}/members`, {
                withCredentials: true,
            }).then(response => {
                this.groupmembers = response.data
            })
        },
        removemember(id) {
            let conf = confirm("Biztosan eltávolítja?");
            if(conf){
                axios.delete(`http://localhost:8881/api/group/${this.id}/member/${id}/delete`, { withCredentials: true, mode: "no-cors" })
                .then(response => {
                    this.getmembers()
                })
            }
        }
    },
    mounted() {
        this.getmembers()
    }
}
</script>

<style scoped>
ul {
    text-align: left;
    list-style-type:upper-roman;
    width: 90%;
    position: relative;
}

.removemember {
    position: absolute;
    right: 2px;
    cursor: pointer;
}

.removemember:hover {
    color: red
}

.removemember:active {
    color: blue
}
</style>