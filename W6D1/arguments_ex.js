
// function sum() {
//     let sum = 0;

//     for (let i = 0; i < arguments.length; i++) {
//         sum += arguments[i];
//     }

//     return sum;

// }

// function sum(...args) {
//     let sum = 0;

//     for (let i = 0; i < args.length; i++) {
//         sum += args[i];
//     }

//     return sum;

// }

// console.log(sum(1, 2, 3, 4) === 10)
// console.log(sum(1, 2, 3, 4, 5) === 15)

Function.prototype.myBind = function(context,...bindArgs) {
    return (...callArgs) => {
        return this.apply(context,bindArgs.concat(callArgs));
    };
};

Function.prototype.myBind = function (context) {
    const bindArgs = Array.from(arguments).slice(1);
    
    const that = this;

    return function () {
        const callArgs = Array.from(arguments);
     
        return that.apply(context, bindArgs.concat(callArgs));
    };
};


// class Cat {
//     constructor(name) {
//         this.name = name;
//     }

//     says(sound, person) {
//         console.log(`${this.name} says ${sound} to ${person}!`);
//         return true;
//     }
// }

// class Dog {
//     constructor(name) {
//         this.name = name;
//     }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true

function curriedSum(numArgs) {
    let numbers = [];

    function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            let summer = (accumulator,el) => accumulator + el;
            return numbers.reduce(summer);
        } else {
            return _curriedSum;
        }
    }

    return _curriedSum;
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56
// console.log(curriedSum(4)(5)(30)(20)(1));


Function.prototype.curry = function (numArgs) {
    let args = [];
    const that = this;

    function _curry (arg) {
        args.push(arg);
        if (args.length < numArgs) {
            return _curry;
        } else {
            // return that.apply(null, args);
            return that(...args);
        }
    }

    return _curry;
};

function sumThree(num1, num2, num3) {
    return num1 + num2 + num3;
}

// sumThree(4, 20, 6); // == 30

// you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30


// console.log(sumThree.curry(3)(4)(20)(6));

Function.prototype.inherits = function (superClass) {

    // function Surrogate() {} //ASK ABOUT THE CLASS
    // Surrogate.prototype = superClass.prototype;
    // this.prototype = new Surrogate();
    // this.prototype.constructor = this;

    this.prototype = Object.create(superClass.prototype);

};



function MovingObject() {    
}

MovingObject.prototype.move = function () {
    console.log("I'm moving!");  
};


function Ship() { }
Ship.inherits(MovingObject);
Ship.prototype.sail = function () {
    console.log("...and I'm sailing");
};

function Asteroid() { }
Asteroid.inherits(MovingObject);



s = new Ship();
s.move();
s.sail();

a = new Asteroid();
a.move();
// a.sail();
