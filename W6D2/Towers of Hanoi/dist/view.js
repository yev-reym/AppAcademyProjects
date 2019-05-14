
class View {
    constructor(hanoiGame, $ele){
        this.hanoiGame = hanoiGame;
        this.$ele = $ele;
        this.setupTowers();
        this.render();
        this.clickTower();
    }

    setupTowers() {
        for (let i = 0; i < 3; i++) {
            let $ul = $('<ul>');
            $ul.attr("id", i); 
            $ul.attr("class", `stack:${i}`); 
            $('.towers').append($ul);
            if (i === 0) {
                for (let j = 0; j < 3; j++) {
                    let $li = $('<li>');
                    $li.attr("class", `disk_${j}`);
                    $ul.append($li);
                }
            } else {
                for (let j = 0; j < 3; j++) {
                    let $li = $('<li>');
                    $ul.append($li);
                }
            }
        }
    }

    render() {

    }

    clickTower() {
        let clicked = false;
        const $ul = this.$ele.find('ul')
        $ul.on("click", (e) => {
            clicked = true;
            const $thisUl = $(e.currentTarget);
            const $pile = $thisUl.getAttribute('class');
            const $pileNum = parseInt($pile[$pile.length - 1],10); 

        });

    }
}







module.exports = View;