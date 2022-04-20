<template>
    <div class="settings">
        <Menu id="menu" activepage="owned"></Menu>
        <div id="content">
            <LastFilesTable :lastfilesobject="lastfiles" :refresh="getlastfiles" title="Saját fájlok"/>
        </div>
    </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import LastFilesTable from "../components/LastFilesTable.vue";
import axios from "axios";

export default {
    components: {
        Menu,
        LastFilesTable
    },
    data() {
        return {
            lastfiles: null
        }
    },
    methods: {
        getlastfiles() {
            try {
                axios
                    .get("http://localhost:8881/api/file/get/3", {
                        withCredentials: true,
                    })
                    .then((response) => {
                        this.lastfiles = response.data;
                    });
            }
            catch (e) {
                console.log(e.response.data.errors);
            }
        }
    },
    mounted() {
        this.getlastfiles();
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