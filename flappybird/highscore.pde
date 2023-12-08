public class HighScoreManager{
    private int highscore;
    private final String path = "highscore.txt";
    public HighScoreManager() {
        String highscoreString = readHighScore();
        if (highscoreString != null) {
            highscore = Integer.parseInt(highscoreString);
        }
        else {
            highscore = 0;
            writeHighscore(0);
        }
    }

    private String readHighScore() {
        String line = null;
        String[] lines = loadStrings(path);
        if (lines != null) {
            line = lines[0];
        }
        return line;
    }

    public int getHighScore() {
        return highscore;
    }
    public void setHighScore(int score){
        if (score > highscore) {
            highscore = score;
            writeHighscore(score);
        }
    }
    public void writeHighscore(int score) {
        saveStrings(path, new String[] {Integer.toString(score)});
    }
}