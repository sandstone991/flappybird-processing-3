public class Floor extends Entity {

    public Floor(int x) {
        super(x, height - 50, "sprites/base.png", width, 100);
    }

    public void tick(){
       super.draw();
    }
}

public class FloorPair extends Tickable{
    private Floor ent1;
    private Floor ent2;
    private final int speed = -2;
    public FloorPair() {
        ent1 = new Floor(0 );
        ent2 = new Floor(width);
    }

    public void tick() {
       ent1.moveTo((ent1.getX() + speed) % width, ent1.getY());
       if (ent1.getX() == 0) {
        ent2.moveTo(width , ent2.getY());
       } else {
        ent2.moveTo(width + ent1.getX() , ent2.getY());
       }
        ent1.tick();
        ent2.tick();
    }
    public boolean collidesWithPlayer(Player p) {
        return ent1.collide(p) || ent2.collide(p);
    }
}
