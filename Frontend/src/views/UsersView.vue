<template>
  <div class="users">
    <Menu id="menu"></Menu>
    <div id="content">
      <div id="search">
        <form @submit.prevent="findUsers">
          <input type="search" name="" id="keresesInput" v-model="searchvalue" />
          <button id="keresesGomb">Keresés</button>
        </form>
      </div>
      <div id="userlistDiv">
        <div v-if="submitted">Találat a következő keresésre: {{searchvalue}}</div>
        <ul id="userlist">
          <li v-for="user in users" :key="user.id" class="userListItem">
            {{ user.nev }}
            <img
              src="src/assets/add_friend_icon.svg"
              alt="add_friend_icon"
              class="friendicon"
              @click="addfriend(user.id)"
            />
          </li>
        </ul>
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
      submitted: false
    };
  },
  mounted() {
    axios
      .get("http://localhost:8881/api/users", { withCredentials: true })
      .then((response) => {
        this.users = response.data.data;
      });
  },
  methods:{
    findUsers() {
      axios
        .get(
          `http://localhost:8881/api/users/${
            this.searchvalue
          }`,
          { withCredentials: true }
        )
        .then((response) => {
          this.users = response.data.data;
          this.submitted = true;
          setTimeout(() => {
            this.submitted = false;
          }, 5000);
        });
    }
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
  grid-template-areas:
    "search"
    "users";
  padding: 30px;
}

#search {
  grid-area: search;
  background-color: #c4c4c4;
  border-radius: 5px;
  width: 90%;
  margin: auto;
  display: block;
}

#userlistDiv {
  grid-area: users;
}

#userlist {
  list-style-type: none;
  user-select: none;
}

.userListItem {
  background-color: #fff;
  border-radius: 10px;
  padding: 20px;
  padding-left: 50px;
  padding-right: 50px;
  width: 200px;
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
</style>