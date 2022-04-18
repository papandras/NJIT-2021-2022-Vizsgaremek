<template>
  <div class="users">
    <Menu id="menu" activepage="users"></Menu>
    <div id="content">
      <div id="search">
        <!-- Section: Felhasználó keresés -->
        <form @submit.prevent="findUsers">
          <label for="keresesInput">Felhasználó keresése</label>
          <input type="search" name="" id="keresesInput" v-model="searchvalue" required />
          <button id="keresesGomb">Keresés</button>
        </form>
        <footer>
          <ul id="lettersearch">
            <li v-for="letter in letters" :key="letter">[<a @click="searchbyletter(letter)">{{
              letter.toUpperCase()
            }}</a>]</li>
          </ul>
        </footer>
        <!-- Section vége -->
      </div>
      <div id="userlistDiv" v-if="users != null">
        <div v-if="submitted">
          Találat a következő keresésre: {{ searchvalue }}
        </div>
        <!-- Section: Felhasználók kilistázása -->
        <div v-if="users == null || users.length == 0">Nincs találat</div>
        <ul id="userlist">
          <li v-for="user in users" :key="user.id" class="userListItem">
            <div class="username">{{ user.nev }}</div>
            <img v-if="store.user.name != user.nev" src="src/assets/add_friend_icon.svg" alt="add_friend_icon"
              class="friendicon" @click="addfriend(user.id)" />
          </li>
        </ul>
        <!-- Section vége -->
      </div>
      <div id="friendblock">
        <div id="leftblock">
          <div class="friends relationblock">
            <!-- Section: Elküldött és visszaigazolt barát kérések -->
            <h1>Barátok</h1>
            <p>visszaigazolt kérések</p>
            <hr />
            <div v-if="friends == null || friends.length == 0">
              Jelenleg nincs egy barátod sem!
            </div>
            <ul id="friendlist">
              <li v-for="friend in friends" :key="friend.id" class="userListItem relationitem" :title="friend.nev">
                {{ friend[0].nev }}
                <img src="src/assets/remove_friend_icon.svg" alt="add_friend_icon" class="friendicon"
                  @click="removefriend(friend[0].id)" />
              </li>
            </ul>
            <!-- Section vége -->
          </div>
          <div class="groups relationblock">
            <!-- Section: Csoportok -->
            <Groups/>
            <!-- Section vége -->
          </div>
        </div>
        <div id="rightblock">
          <div class="sentrequests relationblock">
            <!-- Section: Elküldött de még nem visszaigazolt barát kérések -->
            <h1>Függőben lévő jelöléseid</h1>
            <p>visszaigazolatlan kérések</p>
            <hr>
            <div v-if="sentrequests == null || sentrequests.length == 0">
              Nincs elküldött kérésed!
            </div>
            <ul id="friendlist">
              <li v-for="friend in sentrequests" :key="friend[0].id" class="userListItem relationitem"
                :title="friend[0].nev">
                {{ friend[0].nev }}
                <img src="src/assets/remove_friend_icon.svg" alt="add_friend_icon" class="friendicon"
                  @click="cancelrequest(friend[0].id)" />
              </li>
            </ul>
            <!-- Section vége -->
          </div>
          <div class="friendrequests relationblock">
            <!-- Section: Beérkezett barát kérések -->
            <h1>Bejelöltek barátnak</h1>
            <p>ezek a kérések visszaigazolásra várnak</p>
            <hr />
            <div v-if="friendrequests == null || friendrequests.length == 0">
              Nincs függőben lévő jelölésed!
            </div>
            <ul>
              <li v-for="user in friendrequests" :key="user.id" class="userListItem relationitem">
                {{ user[0].nev }}
                <img src="src/assets/block_user_icon.svg" alt="block_user_icon" class="blockicon"
                  @click="reject(user[0].id)" />
                <img src="src/assets/accept_friend_icon.svg" alt="add_friend_icon" class="friendicon"
                  @click="acceptfriend(user[0].id)" />
              </li>
            </ul>
            <!-- Section vége -->
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script src="../assets/js/UsersView.js">

</script>

<style scoped>
@import url("../assets/css/UsersView.css");
</style>