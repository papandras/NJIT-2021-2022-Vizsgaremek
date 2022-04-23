<template>
    <div class="admin">
        <Menu id="menu" activepage="admin"></Menu>
        <div id="content">
            <div id="adminpage">
                <div id="adminmenu">
                    <button class="button" @click="changecomponnent">Fájlok kezelése</button>
                    <button class="button" @click="changecomponnent">Felhasználók kezelése</button>
                </div>
                <div id="admincontent">
                    <Files v-if="showfiles"/>
                    <Users v-if="showusers"/>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import Files from "../components/admin/Files.vue";
import Users from "../components/admin/Users.vue";

export default {
    components: {
        Menu,
        Files,
        Users
    },
    data() {
        return {
            showfiles: true,
            showusers: false
        }
    },
    methods: {
        changecomponnent() {
            this.showfiles = !this.showfiles
            this.showusers = !this.showusers
        }
    }
};
</script>

<style scoped>
.settings {
    display: grid;
    grid-template-columns: 1fr 9fr;
    grid-template-rows: 100%;
    grid-template-areas: "menu content";
}

#content {
    padding: 20px;
    grid-area: content;
}

#adminpage {
    display: grid;
    grid-template-columns: 1fr 9fr;
    grid-template-rows: 1fr 9fr;
    grid-template-areas:
        ". adminmenu"
        ". admincontent";
}

#menu {
    grid-area: menu;
}

#adminmenu {
    grid-area: adminmenu;
    display: flex;
    justify-content: center;
}

#admincontent {
    grid-area: admincontent;
    padding: 20px;
}

button {
    margin: 20px;
}
</style>