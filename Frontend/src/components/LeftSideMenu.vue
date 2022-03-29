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