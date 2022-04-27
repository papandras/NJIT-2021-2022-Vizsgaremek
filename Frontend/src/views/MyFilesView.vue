<template>
    <div class="myfiles">
        <Menu id="menu" activepage="owned"></Menu>
        <div id="content">
            <FileTable :lastfilesobject="files" :refresh="getfiles" title="Saját fájlok" id="myfiles" name="myfiles"/>
        </div>
    </div>
</template>

<script>
import Menu from "../components/LeftSideMenu.vue";
import FileTable from "../components/LastFilesTable.vue";
import axios from "axios";

export default {
    components: {
        Menu,
        FileTable
    },
    data() {
        return {
            files: null
        }
    },
    methods: {
        getfiles() {
            try {
                axios
                    .get("http://localhost:8881/api/file/get", {
                        withCredentials: true,
                    })
                    .then((response) => {
                        this.files = response.data;
                    });
            }
            catch (e) {
                console.log(e.response.data.errors);
            }
        }
    },
    mounted() {
        this.getfiles();
    }
};
</script>

<style scoped>
.myfiles {
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