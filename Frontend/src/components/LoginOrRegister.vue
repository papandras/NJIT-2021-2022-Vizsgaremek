<template>
    <div >
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
    border: none;
  }

  nav{
    text-align: center;
  }

  .bejelentkezes:active{
    border: 2px solid #c4c4c4;
  }
</style>