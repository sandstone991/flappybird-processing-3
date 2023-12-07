
public class Obstacle extends Entity {
    protected int speed = -2; 
    public Obstacle(int x, int obstacleHeight, boolean top) {
        super(x, height - obstacleHeight, "sprites/pipe-green.png", 52, 320);
        if(top){
          super.rotateBy(180);
          super.moveTo(x, obstacleHeight - height);
        }
    }
    public void tick(){
       super.moveBy(speed, 0);
       super.draw();
    }
}

public class ObstaclePair extends Tickable{
  protected Obstacle bottom;
  protected Obstacle top;
  protected final int minHeight = 20;
  ObstaclePair(){
    int tunnelHeight = 150;
    int remainingHeight = height - tunnelHeight;
    int bottomHeight = (int)random(minHeight, remainingHeight - minHeight);
    int topHeight = remainingHeight - bottomHeight;
    bottom = new Obstacle(width, bottomHeight, false);
    top = new Obstacle(width, topHeight, true);
  }
  public boolean shouldBeDeleted(){
    return !bottom.isOnScreen();
  }
  public int getX(){
    return bottom.getX();
  }
  public boolean collidesWithPlayer(Player player){
    return bottom.collide(player) || top.collide(player);
  }
  public void tick(){
    bottom.tick();
    top.tick();
  }
}
