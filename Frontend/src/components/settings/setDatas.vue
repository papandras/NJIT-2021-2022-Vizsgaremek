<template>
  <div id="datagrid">
    <img src="@/assets/default_user.svg" alt="" />
    <label>Új kép feltöltése</label>
    <input type="file" />
    <input type="email" placeholder="E-mail cím" class="input" />
  </div>
</template>

<style scoped>
img {
  width: 50px;
}

div {
    height: 200px;
}

div > * {
    display: block;
    padding-left: 15px;
    padding-right: 15px;
    padding-bottom: 15px;
    padding-top: 8px;
  }

</style>