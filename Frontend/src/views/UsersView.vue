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
        <p>fsd</p>
        <hr />
        <div v-if="friends == null || friends.length == 0">Jelenleg nincs egy barátod sem!</div>
        <ul id="friendlist">
          <li v-for="friend in friends" :key="friend.id" class="userListItem relationitem" :title="friend.nev">
          {{ friend[0].nev/*.substring(0, 8)*/ }}<!--<span v-if="friend.nev.length > 7">...</span>-->
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
      <div class="friendrequests relationblock">
        <h1>Bejelöltek barátnak</h1>
        <p>(ezek a kérések visszaigazolásra várnak)</p>
        <hr />
        <div v-if="friendrequests == null || friendrequests.length == 0">Nincs függőben lévő jelölésed!</div>
        <li v-for="user in friendrequests" :key="user.id" class="userListItem relationitem">
          {{ user[0].nev }}
          <img
            src="src/assets/accept_friend_icon.svg"
            alt="add_friend_icon"
            class="friendicon"
            @click="acceptfriend(user[0].id)"
          />
        </li>
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
      friendrequests: null,
      searchvalue: null,
      submitted: false,
    };
  },
  mounted() {
    this.getUsers();
    this.getFriends();
    this.getFriendRequests();
  },
  methods: {
    getUsers(){
      axios
      .get("http://localhost:8881/api/users", { withCredentials: true })
      .then((response) => {
        this.users = response.data.data;
      });
    },
    getFriends(){
      axios
      .get("http://localhost:8881/api/user/friends", { withCredentials: true })
      .then((response) => {
        this.friends = response.data;
      });
    },
    getFriendRequests(){
      axios
      .get("http://localhost:8881/api/user/friends/friendrequests", { withCredentials: true })
      .then((response) => {
        this.friendrequests = response.data;
        for(let f in this.friendrequests){
          console.log(f);
        }
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
    },
    acceptfriend(id){
      axios.post("http://localhost:8881/api/user/friends/accept/", {"id": id}, {withCredentials: true, mode: "no-cors"})
        .then(response => {
          console.log(response.data);
          this.getFriends();
          this.getFriendRequests();
        })
    }
  },
};
</script>

<style scoped>
@import url("../assets/css/UsersView.css");
</style>