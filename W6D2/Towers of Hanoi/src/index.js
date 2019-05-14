const HanoiGame = require("./game.js");
const HanoiView = require("../dist/view.js");



$(() => {
  const rootEl = $('.towers');
  const game = new HanoiGame();
  new HanoiView(game, rootEl);
  console.log("I am alive");
});

