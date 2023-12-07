PImage photo;
public abstract class Entity extends Tickable {
    protected int x, y;
    protected PImage sprite;
    protected int entityWidth, entityHeight;
    // in degrees
    protected float rotationAngle;
    
    public Entity(int x, int y, String sprite, int entityWidth, int entityHeight) {
        this.x = x;
        this.y = y;
        this.sprite = loadImage(sprite);
        this.entityWidth = entityWidth;
        this.entityHeight = entityHeight;
    }
    
    public int getX() {
        return x;
    }
    public void setCurrentSprite(String sprite){
      this.sprite = loadImage(sprite);
    }
    public int getY() {
        return y;
    }
    
    public int getWidth(){
      return entityWidth;
    }
    public boolean isOnScreen(){
      return x + entityWidth > 0 && x < width && y + entityHeight > 0 && y < height;
    }
    public int getHeight(){
      return entityHeight;
    }
    
    public boolean collide(Entity otherEntity) {
        return x < otherEntity.getX()+ otherEntity.getWidth() &&
               x + entityWidth > otherEntity.getX() &&
               y < otherEntity.getY() + otherEntity.getHeight() &&
               y + entityHeight > otherEntity.getY();
    }

    public void rotateInto(float angle) {
        rotationAngle = angle;
    }
    
    public void rotateBy(float angle) {
        rotationAngle += angle;
    }
    
    public void moveBy(int dx, int dy) {
        x += dx;
        y += dy;
    }
    
    public void moveTo(int x, int y) {
        this.x = x;
        this.y = y;
    }
    
    public float getRotationAngle() {
        return rotationAngle;
    }
    
    public void draw(){
        pushMatrix(); 
        translate(x + entityWidth / 2, y + entityHeight / 2);
        rotate(radians(rotationAngle));
        image(sprite, -entityWidth / 2, -entityHeight / 2, entityWidth, entityHeight);
        popMatrix();
    }    
}
