class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    const $ul = $('.grid');
    $ul.on("click", "li", (e) => {
      const $currLi = $(e.target);
      this.makeMove($currLi);
    });
  }

  makeMove($square) {
    const pos = $square.data('pos');
    if (!this.game.board.isEmptyPos(pos)) {
      return alert("You shall not pass!");
    }

    this.game.playMove(pos);

    if (this.game.isOver()) {
      const realWinner = this.game.winner() === 'x' ? 'o' : 'x';
      const $h1 = $("<h1>");
      $h1.html(`Congrats you are the winner ${realWinner}`);
      this.$el.append($h1);
    }
    const winPos = game.board.winnerArray;
    if(winPos.length > 0){
      for (let i = 0; i < winPos.length; i++) {
        const $ul = $('.grid');
        let winnerSquare = winPos[i]; 
        let $winLi = $ul.getAttribute(winnerSquare);
        let winnerClass = $winLi.attr('class');
        $winLi.removeClass(winnerClass);
        $winLi.addClass(".winner");
        if (winnerClass === ".xbox"); {
          $winLi.css("content: 'x' ");
        } else {
          $winLi.css("content: 'o' ");
        }
       
    
      }

    }

    if (this.game.currentPlayer === 'x') {
      $square.addClass("xbox");
    } else {
      $square.addClass("obox");
    }

  }

  setupBoard() {
   const $ul = $('<ul>');
    $ul.addClass("grid");
    let pos_array = [[0,0], [0,1], [0,2], [1,0], [1,1], [1,2], [2,0], [2,1], [2,2]];
   for (let i = 0; i < 9; i++) {
     let $li = $('<li>');
     $($li).data('pos', pos_array[i]);
     $ul.append($li);
   }
   this.$el.append($ul);
  }
}


module.exports = View;
