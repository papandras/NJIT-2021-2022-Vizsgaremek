<template>
  <h1>Az oldal nem található</h1>
  <div class="container">
  
    <div class="row">
      <div class="col loader">
        <span class="loader__element"></span>
        <span class="loader__element"></span>
        <span class="loader__element"></span>
      </div>
    </div>

    <div class="row">
      <div class="bgc">
        <h2 class="hero-title back-front tittle">
          444
        </h2>
      </div>
    </div>

<div class="row">
      <div class="bgc">
        <p>Úgy látszik hogy találtál egy nem létező oldalt!</p>
        <p>Menj vissza az előző oldalra és próbáld meg újra!</p>
      </div>
    </div>


</div>

</template>

<style>
p{
  font-size: 30px;
  margin-top: 10px;
}
h1 {
  text-align: center;
  margin-top: 30px;
}
.tittle {
  text-align: center;
  margin-top: 70px;
  margin-bottom: 100px;
  font-size: 40px;
}
.bgc {
  height: 50px;
  text-align: center;
}



:root {
  --main-color: #ecf0f1;
  --point-color: #555;
  --size: 5px;
}

.loader {
  width: 20px;
  height: 20px;
  top: 0; left: 0;
  display: flex;
  align-items: center;
  align-content: center; 
  justify-content: center;  
  z-index: 100000;
}

.loader__element {
  border-radius: 100%;
  border: var(--size) solid var(--point-color);
  margin: calc(var(--size)*2);
}

.loader__element:nth-child(1) {
  animation: preloader .6s ease-in-out alternate infinite;
}
.loader__element:nth-child(2) {
  animation: preloader .6s ease-in-out alternate .2s infinite;
}

.loader__element:nth-child(3) {
  animation: preloader .6s ease-in-out alternate .4s infinite;
}

@keyframes preloader {
  100% { transform: scale(2); }
}
</style>