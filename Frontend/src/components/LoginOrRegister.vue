<template>
    <div id="whitediv">
        <nav>
      <RouterLink to="/"><input type="button" value="Bejelentkezés" class="bejelentkezes"></RouterLink>
      <RouterLink to="/register"><input type="button" value="Regisztráció" class="bejelentkezes"></RouterLink>
    </nav>
    </div>
</template>

<style>
  .bejelentkezes{
    background-color: #009688;
    color: white;
    width: 140px;
    height: 50px;
    border-radius: 5px;
    box-shadow: none;
    margin: 20px;
    margin-top: 120px;
  }
  #whitediv{
    width: 400px;
    height: 600px;
    background-color: white;
    border-radius: 5px;
    vertical-align: center;
    margin: auto;
    display: flex;
    justify-content: center;
    margin-top: 80px;
    padding-top: 0px;
  }
</style>