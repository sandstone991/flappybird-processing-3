public class GameOverMenu extends Tickable {
    private PFont customFont;
    private int score;
    public GameOverMenu(int score) {
        this.customFont = createFont("fonts/flappy-font.ttf", 32);
        this.score = score;   
    }
    
    public void tick(){
        textFont(customFont);
        textAlign(CENTER, CENTER);
        textSize(32);
        text("Game Over", width / 2, height / 2 - 50);
        textSize(24);
        text("Score: " + score, width / 2, height / 2);
        textSize(16);
        text("Press SPACE to restart", width / 2, height / 2 + 50);
    }
    
}