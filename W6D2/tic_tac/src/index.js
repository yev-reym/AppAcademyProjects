const View = require("./ttt-view.js")// require appropriate file
const Game = require("../tic_tac_sol/game.js")// require appropriate file

const init_view = () => {
  const game = new Game();
  const $ttt = $(".ttt");
  const view = new View(game, $ttt);
};
  $(  init_view );
 

