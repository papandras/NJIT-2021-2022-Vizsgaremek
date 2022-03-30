<template>
  <li>
    <p id="title" @click="selectPage(this)">{{ "Index page" }}</p>
    <button id="close" @click="close">x</button>
  </li>
</template>

<style scoped>
#close {
  border: none;
  background-color: #E9D8A6;
  display: none;
}
li:hover > #close{
    display: inline-block;
}
#title {
  display: inline-block;
  margin-right: 30px;
}
 #close:hover {
  border: 1px solid rgb(20, 14, 14);
  border-radius: 50%;
}
</style>

<script>

export default({
    setup() {
        const close = () => {
            alert("close");
        }

        const selectPage = (elem) => {
            alert(elem);
            
        }

        return{
            close,
            selectPage
        }
    },
})
</script>
