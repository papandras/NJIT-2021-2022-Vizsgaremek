<template>


<div class="bg"></div>
<div class="bg bg2"></div>
<div class="bg bg3"></div>
  <router-view></router-view>
</template>

<style>
*{
    padding:0;
    margin:0;
    user-select: none;
}
  body{
    background-color: #E9D8A6;
  }
  #keresesInput, .input{
  width: 50%;
  height: 30px;
  border-color: none;
  border: none;
  outline: none;
  border-radius: 5px;
  margin: 5px;
  display: inline-block;
}

#keresesGomb, .button{
  background-color: #009688;
  border-radius: 5px;
  border: none;
  width: 150px;
  height: 30px;
  color: white;
  display: inline-block;
  margin: 10px;
}

.button:active {
  animation: shadow .15s ease-in-out;
}

@keyframes shadow {
  0% {
    box-shadow: inset 5px 5px 10px black, inset 5px -5px 10px white;
  }

  100% {
    box-shadow: none;
  }
}

  /* width */
::-webkit-scrollbar {
  width: 10px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px #009688; 
  border-radius: 10px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #009688; 
  border-radius: 10px;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #009688; 
}

.sectionheader {
  background-color: #009688;
  color: rgb(245, 246, 249);
  padding-top: 10px;
  padding-bottom: 10px;
  border-top-left-radius: 10px;
  border-top-right-radius: 10px;
}

.sectioncontent {
  padding: 20px;
  padding-left: 50px;
  padding-right: 50px;
}

.bg {
  animation:slide 3s ease-in-out infinite alternate;
  background-image: linear-gradient(-20deg, #009688 50%, #E9D8A6 50%);
  bottom:0;
  left:-100%;
  opacity:.5;
  position:fixed;
  right:-50%;
  top:0;
  z-index:-1;
  border-radius: 50%;
}

.bg2 {
  animation-direction:alternate-reverse;
  animation-duration:40s;
}

.bg3 {
  animation-duration:50s;
}

@keyframes slide {
  0% {
    transform:translateX(-25%);
  }
  100% {
    transform:translateX(25%);
  }
}

input[type=file]::file-selector-button {
  border: 2px solid #009688;
  padding: .2em .4em;
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
  background-color: #009688;
  transition: 1s;
  padding: 10px 20px 10px 20px;
  margin-right: 20px;
  color: #E9D8A6;
}

input[type=file]{
  background-color: #009688;
  border-radius: 10px;
  padding-right: 20px;
  width: 100%;
}

input[type=file]::file-selector-button:hover {
  background-color: #E9D8A6;
  color: #009688;
  border-top-left-radius: 10px;
  border-bottom-left-radius: 10px;
}
</style>