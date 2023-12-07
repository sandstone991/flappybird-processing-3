public class ScoreManager extends Tickable{
    private PFont customFont;
    private int score = -1 ;

    public ScoreManager() {
        this.customFont = createFont("fonts/flappy-font.ttf", 40);
        textFont(customFont);
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public void incScore() {
        score++;
    }

    public void tick() {
        fill(0);
        textSize(40);
        text(score, width/2, 40);
    }
}