<template>
    <div>
        <ul v-if="groupmembers != null && groupmembers.length != 0">
            <li v-for="member in groupmembers">{{ member[0].nev }} <span class="removemember"
                    @click="removemember(member[0].id)">[Tag eltávolítása]</span></li>
        </ul>
        <p v-if="groupmembers == null || groupmembers.length == 0">Nincs tag hozzárendelve!</p>
        <div id="addfield">
            <p>Tag hozzáadása</p>
            <select :id="name">
                <option v-for="friend in friendnames" :value="friend[0].id" :id="name + '-' + friend[0].nev">{{
                    friend[0].nev
                }}
                </option>
            </select>
            <button @click="addmember()">Hozzáadás</button>
        </div>
    </div>
</template>

<script>
import axios from "axios";
export default {
    data() {
        return {
            groupmembers: null,
            friendnames: null
        }
    },
    props: {
        id: Number,
        name: String
    },
    methods: {
        async getmembers() {
            await axios.get(`http://localhost:8881/api/group/${this.id}/members`, {
                withCredentials: true,
            }).then(response => {
                this.groupmembers = response.data
            })
        },
        async cremovemember(id) {
            let conf = confirm("Biztosan eltávolítja?");
            if (conf) {
                await axios.delete(`http://localhost:8881/api/group/${this.id}/member/${id}/delete`, { withCredentials: true, mode: "no-cors" })
                    .then(response => {
                        this.getmembers()
                    })
            }
        },
        async getFriends() {
            await axios
                .get("http://localhost:8881/api/user/friends", {
                    withCredentials: true,
                })
                .then((response) => {
                    this.friendnames = response.data
                });
        },
        async addmember() {
            let member = document.getElementById(this.name).value;
            let data = {
                group_id: this.id,
                group_member: member
            }

            await axios.post("http://localhost:8881/api/group/addmember", data, { withCredentials: true, mode: "no-cors" })
                .then((response) => {
                    this.getmembers();
                });
        }
    },
    async mounted() {
        await this.getmembers()
        await this.getFriends()

        for (let f of this.friendnames) {
            for (let g of this.groupmembers) {
                if (f[0].nev == g[0].nev) {
                    document.getElementById(`${this.name}-${g[0].nev}`).disabled = true;
                }
            }
        }
    }
}
</script>

<style scoped>
ul {
    text-align: left;
    list-style-type: upper-roman;
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

select {
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

button {
    background-color: #009688;
    color: white;
    width: 140px;
    height: 30px;
    border-radius: 5px;
    box-shadow: none;
    margin: auto;
    border: none;
    margin-top: 10px;
    display: block;
}

button:active {
    border: 2px solid #c4c4c4;
}

#addfield {
    margin-top: 20px;
    border-top: 1px solid rgba(255, 255, 255, 0.8);
    border-left: 1px solid rgba(255, 255, 255, 0.4);
    border-right: 1px solid rgba(255, 255, 255, 0.4);
    border-bottom: 1px solid rgba(62, 76, 121, 0.5);
    padding-top: 10px;
    padding-bottom: 10px;
    width: 90%;
}
</style>