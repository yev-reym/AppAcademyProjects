/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nclass DomNodeCollection {\n    constructor(array){\n        this.elements = array;\n    }\n\n    html(string){\n        if(string === undefined){\n            return this.elements[0].innerHTML;\n        } else{\n            this.elements.forEach( ele =>  ele.innerHTML = string );\n        }\n    }\n\n    empty(){\n        this.html(\"\");\n    }\n\n    append(arg){\n        const that = this;\n        if(arg instanceof DomNodeCollection){\n            arg.elements.forEach(ele => {\n                that.elements.forEach( el => {\n                    let content = el.innerHTML;\n                    el.innerHTML = (content + ele.outerHTML);\n                });\n            });\n        } else if(arg instanceof HTMLElement){\n            that.elements.forEach(ele => {\n                let content = ele.innerHTML;\n                ele.innerHTML = (content + arg.outerHTML);\n            });\n        } else {\n            that.elements.forEach(ele => {\n                let content = ele.innerHTML;\n                ele.innerHTML = (content + arg);\n            });\n        }\n    }\n\n    attr(attribute,value){\n        this.elements.forEach(el => {\n            el.setAttribute(attribute, value);\n        });\n    }\n\n    addClass(newClass){\n        this.elements.forEach(el => {\n            el.classList.add(newClass);\n        });\n    }\n\n    removeClass(className){\n        this.elements.forEach(el => el.classList.remove(className));\n    }\n\n    children(){\n        let array = [];\n        this.elements.forEach(ele => {\n            array.push(...Array.from(ele.children));\n        });\n        return new DomNodeCollection(array);\n    }\n\n    parent(){\n        let array = [];\n        this.elements.forEach(ele => {\n            array.push(ele.parentElement);\n        });\n\n        return new DomNodeCollection(array);\n    }\n\n    find(selector){\n        let array = [];\n        this.elements.forEach(ele => {\n            array.push(...Array.from(ele.querySelectorAll(selector)));\n        });\n\n        return new DomNodeCollection(array);\n    }\n\n    remove(){\n        this.elements.forEach(ele => {\n            ele.outerHTML = \"\";\n        });\n    }\n\n    on(event,callback){\n        this.elements.forEach(ele => {\n            ele.addEventListener(event, callback);\n            const eventName = `event-${event}`;\n            if (ele[eventName] === undefined){\n                ele[eventName] = [callback];\n            } else {\n                ele[eventName].push(callback);\n            }\n        });\n        \n    }\n    \n    off(event){\n        this.elements.forEach(ele => {\n            const eventName = `event-${event}`;\n            let actions = ele[eventName];\n            actions.forEach(action => {\n                ele.removeEventListener(event, action);\n            });\n            ele[eventName] = undefined;\n        });\n    }\n\n}\n\nmodule.exports = DomNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DomNode = __webpack_require__(/*! ./dom_node_collection.js */ \"./src/dom_node_collection.js\");\n\nwindow.$l = function(selector) {\n    let funcArray = [];\n\n    if(typeof selector === 'function'){\n        \n        if (document.readyState === 'complete'){\n            selector();\n        } else {\n            funcArray.push(selector);\n            document.addEventListener('DOMContentLoaded', () => {\n            \n            funcArray.forEach(func => {\n                func();\n            });\n            funcArray = [];\n        });\n        }\n    } else if(selector instanceof HTMLElement){\n        const nodeArray = Array.from(selector);\n        return new DomNode(nodeArray);\n    } else {\n        const nodelist = document.querySelectorAll(selector);\n        nodeArray = Array.from(nodelist);\n        return new DomNode(nodeArray);\n    }\n\n};\n\n$l.extend = function(arg1, ...arg2){\n    arg2.forEach( arg => {\n        const argKeys = Object.keys(arg);\n        argKeys.forEach( key => {\n            arg1[key] = arg[key];\n        });\n    });\n    return arg1;\n};\n\n$l.ajax = function(options){\n    \n};\n\n// function ClickEvent() {\n//     console.log(\"this should be after page loaded\");\n// }\n\n// $l(ClickEvent);\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });