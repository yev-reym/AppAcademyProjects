
Array.prototype.myEach = function(callback) {

    for (let i = 0; i < this.length; i++) {

        callback(this[i]);
    }
};

// [1,2,3,4].myEach(function(element) {

//     console.log(element*2)
// });

Array.prototype.myMap = function(callback) {
    const map = [];

    this.myEach(function (element) {
        map.push(callback(element));
    });

    return map;
};

// const trash = [1, 2, 3, 4].myMap(function (element) {
//     return (element * 2);
// });

// console.log(trash);


Array.prototype.myReduce = function(callback, initialValue) {
    let duped = this.slice();
    let acc = initialValue || duped.shift();

    duped.myEach(function (element) {
       acc =  callback(acc,element);
    });

    return acc;
};

// // without initialValue
// console.log([1, 2, 3].myReduce(function (acc, el) {
//     return acc + el;
// })); // => 6

// // with initialValue
// console.log([1, 2, 3].myReduce(function (acc, el) {
//     return acc + el;
// }, 25)); // => 31