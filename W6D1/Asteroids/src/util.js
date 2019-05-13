import { __esModule } from "../dist/main";

function distance(coords1, coords2) {
    return Math.sqrt(Math.pow(coords1[0] - coords2[0], 2) + Math.pow(coords1[1] - coords2[1], 2)); 
}

function norm(coords) {
    distance([0,0], coords);
}

const Util = {
    inherits(Child,Parent) {
        function Surrogate() {}
        Surrogate.prototype = Parent.prototype;
        Child.prototype = new Surrogate();
        Child.prototype.constructor = Child;
    }
};

module.exports= Util;
