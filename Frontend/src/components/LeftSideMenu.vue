<template>
    <div class="menu">
        <ul>
            <li>
                <div class="LOGO">
                    <img src="public/logo.svg" alt="logo" class="LOGOimg">
                </div>
            </li>
            <li>
                <div class="profpic">
                    <img src="#" alt="profilpic">
                    <p>Szia {{"Valaki"}}</p>
                </div>
            </li>
            <li>
                <RouterLink to="#"><p>Főoldal</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Megosztott fájlok</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Kedvencek</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Törölt elemek</p></RouterLink>
            </li>
            <li class="stat">
                <RouterLink to="#"><p>Statisztika</p></RouterLink>
            </li>
            <li>
                <RouterLink to="#"><p>Beállítások</p></RouterLink>
            </li>
            <li>
                <RouterLink to="/" @click="logout">Kijelentkezés</RouterLink>
            </li>
        </ul>
    </div>
</template>

<style scoped>
.LOGO{
    margin: 15px 0px 0px 15px;
    width: 150px;
    height: 100px;
}
.LOGOimg{
    width: 150px;
    height: 100px;
}
.profpic{
    margin: 20px 0px 0px 15px;
    width: 150px;
    height: 100px;
    background-color: red;
}
.stat{
    margin-top: 100px;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #C4C4C4;
  height: 100%; /* Full height */
  position: fixed; /* Make it stick, even on scroll */
  overflow: auto; /* Enable scrolling if the sidenav has too much content */
}

li a {
  display: block;
  width: 150px;
  height: 30px;
  color: #000;
  margin: 20px;
  text-decoration: none;
  text-align: center;
  background-color: white;
  color: black;
}

li a:hover {
  background-color: red;
  color: white;
}

li a:active {
  background-color: #04AA6D;
  color: white;
}
</style>
<script>
export default {
    name: "Menu",
    setup(){
        const logout = async () => {
            await fetch("http://localhost:8881/api/logout", {
              method: "POST",
              headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json",
              },
              credentials: 'include',
          })
        }

        return{
            logout
        }
    }
}
</script>