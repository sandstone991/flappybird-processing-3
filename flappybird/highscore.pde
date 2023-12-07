public class HighScoreManager{
    private int highscore;
    private final String path = "highscore.txt";
    public HighScoreManager() {
         boolean fileExists = new File(path).exists();
        if (!fileExists) {
        PrintWriter writer = createWriter(path);
        writer.println("0");
        writer.flush();
        writer.close();
        }
        highscore = Integer.parseInt(readHighScore());
    }

    private String readHighScore() {
        BufferedReader reader = createReader(path);
        String line;
        try {
          line = reader.readLine();
        } catch (IOException e) {
          e.printStackTrace();
          line = null;
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
        PrintWriter writer = createWriter(path);
        writer.println(score);
        writer.flush();
        writer.close();
    }
}