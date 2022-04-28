<template>
  <h1 class="h1">Az oldal nem található</h1>
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
          404
        </h2>
      </div>
    </div>

<div class="row">
      <div class="bgc">
        <p>Úgy látszik hogy találtál egy nem létező oldalt!</p>
        <p>Menj vissza az előző oldalra és próbáld meg újra!</p>
      </div>
    </div>

<RouterLink to="/index" class="indexbutton">
    <span></span>
        <span></span>
        <span></span>
        <span></span>
        Tovább a főoldalra
</RouterLink>

</div>

</template>

<style scoped>
p{
  font-size: 30px;
  margin-top: 10px;
}
h1 {
  text-align: center;
  margin-top: 30px;
}

.h1{
  padding-top: 150px;
}
.title {
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
  margin: auto;
  padding: 30px 0 30px 0;
}

.loader__element {
  border-radius: 100%;
  border: var(--size) solid var(--point-color);
  margin: calc(var(--size)*2);
}

.loader__element:nth-child(1) {
  animation: preloader .6s ease-in-out alternate .0s infinite;
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


.indexbutton{
    position: absolute;
    left: 50%;
    transform: translate(-50%, 0);
    text-align: center;
    padding: 25px 30px;
    margin: auto;
    margin-top: 80px;
    color: #E9D8A6;
    background: rgb(0, 150, 136);
    text-decoration: none;
    text-transform: uppercase;
    transition: 0.5s;
    letter-spacing: 4px;
    overflow: hidden;
    box-shadow: 0 0 5px 5px #555;
   
}
.indexbutton:hover{
    background: #E9D8A6;
    color: rgb(0, 150, 136);
    box-shadow: 0 0 5px #E9D8A6,
                0 0 25px #E9D8A6,
                0 0 50px #E9D8A6,
                0 0 200px #E9D8A6;
     -webkit-box-reflect:below 1px linear-gradient(transparent, #0005);
}
.indexbutton:nth-child(1){
    filter: hue-rotate(270deg);
}
.indexbutton span{
    position: absolute;
    display: block;
}
.indexbutton span:nth-child(1){
    top: 0;
    left: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(90deg,transparent,#E9D8A6);
    animation: animate1 1s linear infinite;
}
@keyframes animate1{
    0%{
        left: -100%;
    }
    50%,100%{
        left: 100%;
    }
}
.indexbutton span:nth-child(2){
    top: -100%;
    right: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(180deg,transparent,rgb(0, 150, 136));
    animation: animate2 1s linear infinite;
    animation-delay: 0.25s;
    color: #E9D8A6;
}
@keyframes animate2{
    0%{
        top: -100%;
    }
    50%,100%{
        top: 100%;
    }
}
.indexbutton span:nth-child(3){
    bottom: 0;
    right: 0;
    width: 100%;
    height: 2px;
    background: linear-gradient(270deg,transparent,#E9D8A6);
    animation: animate3 1s linear infinite;
    animation-delay: 0.50s;
    color: #E9D8A6;
}
@keyframes animate3{
    0%{
        right: -100%;
    }
    50%,100%{
        right: 100%;
    }
}


.indexbutton span:nth-child(4){
    bottom: -100%;
    left: 0;
    width: 2px;
    height: 100%;
    background: linear-gradient(360deg,transparent,rgb(0, 150, 136));
    animation: animate4 1s linear infinite;
    animation-delay: 0.75s;
    color: #E9D8A6;
}
@keyframes animate4{
    0%{
        bottom: -100%;
    }
    50%,100%{
        bottom: 100%;
    }
}
</style>