import Menu from "../../components/LeftSideMenu.vue";
import axios from "axios";
import { useAuth } from "../../store/auth.js";
import Groups from "../../components/Groups.vue";
export default {
  components: {
    Menu,
    Groups
  },
  data() {
    return {
      users: null,
      friends: null,
      friendrequests: null,
      searchvalue: null,
      sentrequests: null,
      submitted: false,
      store: useAuth(),
      letters: "abcdefghijklmnopqrstuvwxyz",
    };
  },
  mounted() {
    this.getFriends();
    this.getFriendRequests();
    this.getSentrequests();
  },
  methods: {
    getUsers() {
      axios
        .get("http://localhost:8881/api/users", { withCredentials: true })
        .then((response) => {
          this.users = response.data.data;
        });
    },
    getFriends() {
      axios
        .get("http://localhost:8881/api/user/friends", {
          withCredentials: true,
        })
        .then((response) => {
          this.friends = response.data;
        });
    },
    getFriendRequests() {
      axios
        .get("http://localhost:8881/api/user/friends/friendrequests", {
          withCredentials: true,
        })
        .then((response) => {
          this.friendrequests = response.data;
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
        });
    },
    addfriend(id) {
      axios
        .post(
          "http://localhost:8881/api/user/friends/add/",
          { id: id },
          { withCredentials: true, mode: "no-cors" }
        )
        .then((response) => {
          this.getSentrequests();
        });
    },
    removefriend(id) {
      axios
        .post(
          "http://localhost:8881/api/user/friends/remove/",
          { id: id },
          { withCredentials: true, mode: "no-cors" }
        )
        .then((response) => {
          this.getFriends();
        });
    },
    acceptfriend(id) {
      axios
        .post(
          "http://localhost:8881/api/user/friends/accept/",
          { id: id },
          { withCredentials: true, mode: "no-cors" }
        )
        .then((response) => {
          this.getFriends();
          this.getFriendRequests();
        });
    },
    getSentrequests() {
      axios
        .get("http://localhost:8881/api/user/friends/sentrequests", {
          withCredentials: true,
        })
        .then((response) => {
          this.sentrequests = response.data;
        });
    },
    cancelrequest(id) {
      axios
        .post(
          "http://localhost:8881/api/user/friends/cancelrequest/",
          { id: id },
          { withCredentials: true, mode: "no-cors" }
        )
        .then((response) => {
          this.getSentrequests();
        });
    },
    reject(id) {
      axios
        .post(
          "http://localhost:8881/api/user/friends/rejectrequest/",
          { id: id },
          { withCredentials: true, mode: "no-cors" }
        )
        .then((response) => {
          this.getFriendRequests();
        });
    },
    searchbyletter(value) {
      axios
        .get(`http://localhost:8881/api/users/letter/${value}`, {
          withCredentials: true,
        })
        .then((response) => {
          this.searchvalue = value;
          this.users = response.data.data;
          this.submitted = true;
        });
    }
  },
};