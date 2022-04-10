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
          />
          <button id="keresesGomb">Keresés</button>
        </form>
      </div>
      <div id="userlistDiv">
        <div v-if="submitted">
          Találat a következő keresésre: {{ searchvalue }}
        </div>
        <ul id="userlist">
          <li v-for="user in users" :key="user.id" class="userListItem">
            <div class="username">{{ user.nev }}</div>
            <img
              src="src/assets/block_user_icon.svg"
              alt="block_user_icon"
              class="blockicon"
              @click="addfriend(user.id)"
            />
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
        <li v-for="user in users" :key="user.id" class="userListItem relationitem" :title="user.nev">
          {{ user.nev.substring(0, 8) }}<span v-if="user.nev.length > 7">...</span>
          <img
              src="src/assets/block_user_icon.svg"
              alt="block_user_icon"
              class="blockicon"
              @click="addfriend(user.id)"
            />
          <img
            src="src/assets/remove_friend_icon.svg"
            alt="add_friend_icon"
            class="friendicon"
            @click="addfriend(user.id)"
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
      searchvalue: null,
      submitted: false,
    };
  },
  mounted() {
    axios
      .get("http://localhost:8881/api/users", { withCredentials: true })
      .then((response) => {
        this.users = response.data.data;
      });
  },
  methods: {
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
  },
  setup() {
    const addfriend = (id) => {
      alert("friend added " + id);
    };

    return {
      addfriend,
    };
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
    "friends .  blocked";
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
  min-width: 200px;
  max-width: 300px;
  display: block;
  margin: 20px;
  margin-left: auto;
  margin-right: auto;
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

.relationitem{
  display: inline-block;
  margin-left: 20px;
  margin-right: 20px;
  margin-top: 5px;
  margin-bottom: 5px;
  min-width: 100px;
  max-width: 200px;
}

img{
  display: none;
}

.userListItem:hover{
  width: 120%;
}

.userListItem:hover img{
  display: inline-block;
}
</style>