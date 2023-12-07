PImage backgroundImage;
Game game;

void setup() {
  size(480, 320);
  game = new Game();
  backgroundImage = loadImage("sprites/background-day.png");
  backgroundImage.resize(width, height);
}

void draw() {
   background(backgroundImage);
   game.tick();
}

// void mouseClicked() {
//   if(!game.isStarted()){
//     game.start();
//     return;
//   }
//   game.playerFlyUp();
// }

void keyPressed() {
  if (keyCode == 32) {
  if(!game.isStarted()){
    game.start();
    return;
  }
  game.playerFlyUp();
  }
}
