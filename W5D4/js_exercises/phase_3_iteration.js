Array.prototype.bubbleSort = function() {
    // const sorted_arr = []
    let sorted = false
    let i = 0;

    while (!sorted) {
        sorted = true;
        for(i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i + 1]) {
                // let temp = this[i];
                // this[i] = this[i + 1];
                // this[i + 1] = temp;
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
};

// console.log([1, 2, 6, 8, 7, 3, 5, 7, 2, 9].bubbleSort());

String.prototype.subStrings = function() {

    const subs = [];

    for (let i = 0; i < this.length; i++) {

        for (let j = i; j < this.length; j++) {

            subs.push(this.slice(i,j+1));

        }
    }

    return subs;

};

// console.log("Cats".subStrings());
