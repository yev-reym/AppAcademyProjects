function range(start, end){
    if (start === end){
        return [end];
    }

    if (start > end){
        return "Can't fam";
    }

    return [start].concat(range(start + 1, end));
}

// console.log(range(10, 3));

function sumRec(arr) {
    if (arr.length <= 1) {
        return arr[0];
    }

    return arr[0] + sumRec(arr.slice(1,arr.length));
}

// console.log(sumRec([]));

function exponent(base, exp) {
    if (exp === 0){
        return 1;
    }

    return base * exponent(base, exp - 1);
}

// console.log(exponent(2, 3));

function fibonacci(n){
    if (n === 1){
        return [1];
    }

    if (n === 2){
        return [1, 1];
    }

    let fib = fibonacci(n - 1);
    
    fib.push(fib[fib.length - 1] + fib[fib.length - 2]);
    return fib;

}

// console.log(fibonacci(4));

function deepDup(arr){
    if (!Array.isArray(arr)){
        return arr;
    }

    arr.map(function(element){
        if (Array.isArray(element)){
            deepDup(element);
        } else {
            return element;
        }
    });
}

console.log(deepDup([1, [2, 3], 5, 6]) === [1, [2, 3], 5, 6]);