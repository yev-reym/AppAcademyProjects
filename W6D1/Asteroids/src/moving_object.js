function MovingObject (pos, vel, radius, color) {
    this.pos = pos;
    this.vel = vel;
    this.radius = radius;
    this.color = color;
}

MovingObject.prototype.draw = function (ctx) {
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.stroke();
    ctx.fillStyle = `${this.color}`;
    ctx.fill();
};

MovingObject.prototype.move = function () {
    this.pos += this.vel;
};



module.exports = MovingObject;