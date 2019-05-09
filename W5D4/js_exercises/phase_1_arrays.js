
Array.prototype.uniq = function() {

    const unique = [];

    this.forEach(function(element) {
        
        if (!unique.includes(element)) {
            unique.push(element);
        }

    });  

    return unique;
};


// console.log([1,2,2,4,5,8,8,9].uniq())

Array.prototype.twoSum = function() {
    const results = [];

    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this.length; j++) {
            if (i < j && this[i] + this[j] === 0) {
                results.push([i, j]);
            }
        }
    }

    return results;
};

// console.log([1, 2, 3, -2, -1].twoSum()); //[[0, 4], [1, 3]]

Array.prototype.transpose = function() {
    const transposed = [];

    let i = 0;
    while (i < this.length){
        let new_sub = [];

        this.forEach(function(sub_array) {
            new_sub.push(sub_array[i]);
        });

        transposed.push(new_sub);
        i++;
    }

    return transposed;
};

// console.log([[1,2,3],[4,5,6],[7,8,9]].transpose());
