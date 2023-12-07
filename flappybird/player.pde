
public class Player extends Entity {

    protected int speed = 0;
    protected int acceleration = 0;
    protected int fallSpeed = 0;
    protected boolean facingUp = false;
    protected final int MAX_FALLSPEED = 5;
    protected boolean started = false;
    protected int currentSpirteIndex = 0;
    protected String[] sprites = {"sprites/yellowbird-downflap.png", "sprites/yellowbird-midflap.png", "sprites/yellowbird-upflap.png"};
    public Player() {
        super(width/2, height/2, "sprites/yellowbird-downflap.png" , 34, 24);
    }
    
    public void start() {
        started = true;
    }
    
    public void flyUp() {
        acceleration = -4;
        speed = 0;
        super.rotateInto(-30);
        facingUp = true;
    }
    
    public void fallAnimation(){
      super.rotateBy(4);
      if(getRotationAngle() == 90){
        facingUp = false;
      }
    }
    
    public void tick() {
        if (started) {
            speed += acceleration;
            if(speed > MAX_FALLSPEED){
              speed = MAX_FALLSPEED;
            }
            acceleration++;
            if(facingUp && speed == MAX_FALLSPEED){
              fallAnimation();
            }
        }
        super.moveBy(0, speed);
        super.draw();
    }
}
