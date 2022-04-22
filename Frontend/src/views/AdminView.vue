<template>
    <div class="admin">
        <Menu id="menu" activepage="admin"></Menu>
        <div id="content">

        </div>
    </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";

export default {
    components: {
        Menu
    }
};
</script>

<style scoped>
.settings {
    display: grid;
    grid-template-columns: 10% 90%;
    grid-template-rows: 100%;
    grid-template-areas: "menu content";
}

#content {
    padding: 20px;
    grid-area: content;
}

#menu {
    grid-area: menu;
}
</style>