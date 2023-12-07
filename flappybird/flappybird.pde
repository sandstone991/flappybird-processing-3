Game game;
void setup() {
  size(480, 320);
  game = new Game();
}

void draw() {
   background(255);
   game.tick();
}

void mouseClicked() {
  if(!game.isStarted()){
    game.start();
    return;
  }
  game.playerFlyUp();
}
