PImage backgroundImage;
Game game;
boolean released = true;
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
  if(!released){
    return;
  }
  released = false;
  if (keyCode == 32) {
  if(game.isGameOver()){
    game.restart();
    return;
  }
  if(!game.isStarted()){
    game.start();
    return;
  }
  game.playerFlyUp();
  }
}

void keyReleased() {
  if (keyCode == 32) {
    released = true;
  }
}