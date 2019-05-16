
class DomNodeCollection {
    constructor(array){
        this.elements = array;
    }

    html(string){
        if(string === undefined){
            return this.elements[0].innerHTML;
        } else{
            this.elements.forEach( ele =>  ele.innerHTML = string );
        }
    }

    empty(){
        this.html("");
    }

    append(arg){
        const that = this;
        if(arg instanceof DomNodeCollection){
            arg.elements.forEach(ele => {
                that.elements.forEach( el => {
                    let content = el.innerHTML;
                    el.innerHTML = (content + ele.outerHTML);
                });
            });
        } else if(arg instanceof HTMLElement){
            that.elements.forEach(ele => {
                let content = ele.innerHTML;
                ele.innerHTML = (content + arg.outerHTML);
            });
        } else {
            that.elements.forEach(ele => {
                let content = ele.innerHTML;
                ele.innerHTML = (content + arg);
            });
        }
    }

    attr(attribute,value){
        this.elements.forEach(el => {
            el.setAttribute(attribute, value);
        });
    }

    addClass(newClass){
        this.elements.forEach(el => {
            el.classList.add(newClass);
        });
    }

    removeClass(className){
        this.elements.forEach(el => el.classList.remove(className));
    }

    children(){
        let array = [];
        this.elements.forEach(ele => {
            array.push(...Array.from(ele.children));
        });
        return new DomNodeCollection(array);
    }

    parent(){
        let array = [];
        this.elements.forEach(ele => {
            array.push(ele.parentElement);
        });

        return new DomNodeCollection(array);
    }

    find(selector){
        let array = [];
        this.elements.forEach(ele => {
            array.push(...Array.from(ele.querySelectorAll(selector)));
        });

        return new DomNodeCollection(array);
    }

    remove(){
        this.elements.forEach(ele => {
            ele.outerHTML = "";
        });
    }

    on(event,callback){
        this.elements.forEach(ele => {
            ele.addEventListener(event, callback);
            const eventName = `event-${event}`;
            if (ele[eventName] === undefined){
                ele[eventName] = [callback];
            } else {
                ele[eventName].push(callback);
            }
        });
        
    }
    
    off(event){
        this.elements.forEach(ele => {
            const eventName = `event-${event}`;
            let actions = ele[eventName];
            actions.forEach(action => {
                ele.removeEventListener(event, action);
            });
            ele[eventName] = undefined;
        });
    }

}

module.exports = DomNodeCollection;