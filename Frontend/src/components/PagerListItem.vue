<template>
  <li>
    <p id="title" @click="selectPage(this)">{{ "Index page" }}</p>
    <button id="close" @click="close">x</button>
  </li>
</template>

<style scoped>
li {
  display: inline-block;
  border-right: 1px solid black;
  border-left: 1px solid black;
  border-bottom: 2px solid black;
  width: 140px;
  text-align: center;
  line-height: 38px;
}
li:nth-child(1){
  border-left: none;
}
li:nth-last-child(2){
  border-right: none;
}
#close {
  border: none;
  background-color: #E9D8A6;
  display: none;
  padding-left: 5px;
  padding-right: 5px;
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
