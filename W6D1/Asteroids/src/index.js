console.log("Webpack is working....nerd");

const MovingObject = require("./moving_object.js")

window.MovingObject = MovingObject;

window.addEventListener('DOMContentLoaded', () => {
    const canvas = document.getElementById('game-canvas');
    const ctx = canvas.getContext('2d'); 
});

module