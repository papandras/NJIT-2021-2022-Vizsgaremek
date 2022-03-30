<template>
  <li>
    <p>{{ "Index page" }}</p>
    <button>x</button>
  </li>
</template>

<style scoped>
li > button,
li > p {
  display: inline-block;
}
li > p {
  margin-right: 30px;
}
li > button {
  border: none;
  background-color: white;
}
li > button:hover {
  border: 1px solid black;
  border-radius: 50%;
}
</style>