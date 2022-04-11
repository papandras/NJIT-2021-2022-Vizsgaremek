<template>
  <div class="users">
    <Menu id="menu" activepage="users"></Menu>
    <div id="content">
      <div id="search">
        <form @submit.prevent="findUsers">
          <input
            type="search"
            name=""
            id="keresesInput"
            v-model="searchvalue"
            required
          />
          <button id="keresesGomb">Keresés</button>
        </form>
      </div>
      <img src="https://i.gifer.com/origin/c0/c0bf6e330c9d364e65b6549271806932_w200.gif" alt="">
      <div id="userlistDiv">
        <div v-if="submitted">
          Találat a következő keresésre: {{ searchvalue }}
        </div>
        <ul id="userlist">
          <li v-for="user in users" :key="user.id" class="userListItem">
            <div class="username">{{ user.nev }}</div>
            <!--<img
              src="src/assets/block_user_icon.svg"
              alt="block_user_icon"
              class="blockicon"
              @click="blockuser(user.id)"
            />-->
            <img
              src="src/assets/add_friend_icon.svg"
              alt="add_friend_icon"
              class="friendicon"
              @click="addfriend(user.id)"
            />
          </li>
        </ul>
      </div>
      <div class="friends relationblock">
        <h1>Barátok</h1>
        <hr />
        <div v-if="friends == null || friends.length == 0">Jelenleg nincs egy barátod sem!</div>
        <ul id="friendlist">
          <li v-for="friend in friends" :key="friend.id" class="userListItem relationitem" :title="friend.nev">
          {{ friend.nev/*.substring(0, 8)*/ }}<!--<span v-if="friend.nev.length > 7">...</span>-->
          <!--<img
              src="src/assets/block_user_icon.svg"
              alt="block_user_icon"
              class="blockicon"
              @click="addfriend(friend.id)"
            />-->
          <img
            src="src/assets/remove_friend_icon.svg"
            alt="add_friend_icon"
            class="friendicon"
            @click="removefriend(friend.id)"
          />
        </li>
        </ul>
      </div>
      <div class="blockedUsers relationblock">
        <h1>Blokkolt felhasználók</h1>
        <hr />
        <li v-for="user in users" :key="user.id" class="userListItem relationitem">
          {{ user.nev }}
          <img
            src="src/assets/remove_friend_icon.svg"
            alt="add_friend_icon"
            class="friendicon"
            @click="addfriend(user.id)"
          />
        </li>
      </div>
    </div>
  </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import axios from "axios";
export default {
  components: {
    Menu,
  },
  data() {
    return {
      users: null,
      friends: null,
      searchvalue: null,
      submitted: false,
    };
  },
  mounted() {
    this.getUsers();
    this.getFriends();
  },
  methods: {
    getUsers(){
      axios
      .get("http://localhost:8881/api/users", { withCredentials: true })
      .then((response) => {
        this.users = response.data.data;
        for(let user of this.users){
          console.log(user);

        }
      });
    },
    getFriends(){
      axios
      .get("http://localhost:8881/api/user/friends", { withCredentials: true })
      .then((response) => {
        this.friends = response.data.data;
      });
    },
    findUsers() {
      axios
        .get(`http://localhost:8881/api/users/${this.searchvalue}`, {
          withCredentials: true,
        })
        .then((response) => {
          this.users = response.data.data;
          this.submitted = true;
          setTimeout(() => {
            this.submitted = false;
          }, 5000);
        });
    },
    addfriend(id) {
      axios.post("http://localhost:8881/api/user/friends/add/", {"id": id}, {withCredentials: true, mode: "no-cors"})
        .then(response => {
          console.log(response.data);
          this.getFriends();
        })
    },
    removefriend(id){
      axios.post("http://localhost:8881/api/user/friends/remove/", {"id": id}, {withCredentials: true, mode: "no-cors"})
        .then(response => {
          console.log(response.data);
          this.getFriends();
        })
    }
  },
};
</script>

<style scoped>
.users {
  display: grid;
  grid-template-columns: 10% 90%;
  grid-template-rows: 100%;
  grid-template-areas: "menu content";
}

#menu {
  grid-area: menu;
}

#content {
  grid-area: content;
  display: grid;
  grid-template-rows: 2fr 8fr;
  grid-template-columns: 5fr 1fr 5fr;
  grid-template-areas:
    "search search search"
    "users users users"
    "friends friends friends";
  padding: 30px;
}

#search {
  grid-area: search;
  background-color: #c4c4c4;
  border-radius: 5px;
  margin: auto;
  display: block;
  padding-left: 30px;
  padding-right: 30px;
  padding-top: 10px;
  padding-bottom: 10px;
}

#keresesInput{
    width: 800px;
    padding: 20px;
    border-radius: 10px;
    text-align: center;
}

#keresesInput:focus {
  border: 2px solid #009688;
}

#userlistDiv {
  grid-area: users;
  margin-bottom: 30px;
}

.relationblock, #userlistDiv {
  background-color: white;
  border-radius: 10px;
  padding: 20px;
  padding-left: 50px;
  padding-right: 50px;
  text-align: center;
}

.friends {
  grid-area: friends;
}

.blockedUsers {
  grid-area: blocked;
  display: none;
}

#userlist {
  list-style-type: none;
  user-select: none;
}

.userListItem {
  background-color: #E9D8A6;
  border-radius: 10px;
  padding: 20px;
  padding-left: 50px;
  padding-right: 50px;
  display: inline-block;
  margin-left: 20px;
  margin-right: 20px;
  margin-top: 5px;
  margin-bottom: 5px;
  width: 300px;
  display: inline-block;
  position: relative;
}

.friendicon {
  height: 30px;
  position: absolute;
  right: 30px;
  bottom: 15px;
}

.blockicon{
  height: 30px;
  position: absolute;
  right: 80px;
  bottom: 15px;
}

img{
  display: none;
}

.userListItem:hover img{
  display: inline-block;
}
</style>