const DomNode = require("./dom_node_collection.js");

window.$l = function(selector) {
    let funcArray = [];

    if(typeof selector === 'function'){
        
        if (document.readyState === 'complete'){
            selector();
        } else {
            funcArray.push(selector);
            document.addEventListener('DOMContentLoaded', () => {
            
            funcArray.forEach(func => {
                func();
            });
            funcArray = [];
        });
        }
    } else if(selector instanceof HTMLElement){
        const nodeArray = Array.from(selector);
        return new DomNode(nodeArray);
    } else {
        const nodelist = document.querySelectorAll(selector);
        nodeArray = Array.from(nodelist);
        return new DomNode(nodeArray);
    }

};

$l.extend = function(arg1, ...arg2){
    arg2.forEach( arg => {
        const argKeys = Object.keys(arg);
        argKeys.forEach( key => {
            arg1[key] = arg[key];
        });
    });
    return arg1;
};

$l.ajax = function(options){
    
};

// function ClickEvent() {
//     console.log("this should be after page loaded");
// }

// $l(ClickEvent);
