<template>
    <div class="menu">
        <ul>
            <li>
                <img src="#" alt="logo">
            </li>
            <li>
                <img src="#" alt="profilpic">
                <p>Szia {{"Valaki"}}</p>
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
            <li>
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

<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: gray;
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
  text-align: left;
  background-color: white;
  color: black;
  padding-left: 25px;
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