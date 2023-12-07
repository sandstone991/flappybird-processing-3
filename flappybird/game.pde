public class Game extends Tickable {
    protected Player player;
    protected ArrayList < ObstaclePair > obstacles;
    protected ObstaclePair lastAdded;
    protected boolean started = false;
    protected boolean isGameOver = false;
    protected ScoreManager score;
    protected FloorPair floor;
    protected GameOverMenu gameOverMenu;
    public Game() {
        player = new Player();
        obstacles = new ArrayList <ObstaclePair> ();
        score = new ScoreManager();
        floor = new FloorPair();
    }

    private ObstaclePair getMinXCoordianteObstacle() {
        ObstaclePair min = null;
        for (ObstaclePair pair: obstacles) {
            if (min == null) min = pair;
            if (min.getX() > pair.getX()) min = pair;
        }
        return min;
    }
    private void addNewObstacle() {
        ObstaclePair min = getMinXCoordianteObstacle();
        if (obstacles.size() < 2 && (min == null || min.getX() < width / 2)) {
            obstacles.add(new ObstaclePair());
            score.incScore();
        }
    }
    private void deleteOffScreenObstacles() {
        ArrayList < ObstaclePair > deleteCandidates = new ArrayList < ObstaclePair > ();
        for (ObstaclePair pair: obstacles) {
            if (pair.shouldBeDeleted()) {
                deleteCandidates.add(pair);
            }
        }
        for (ObstaclePair pair: deleteCandidates) {
            obstacles.remove(pair);
        }
    }
    private boolean checkCollisions(){
        for (ObstaclePair pair: obstacles) {
            if(pair.collidesWithPlayer(player)) return true;
        }
        if(floor.collidesWithPlayer(player)) return true;
        if(player.getY() < 0) return true;
        return false;
    }
    public void tick() {
        if(isGameOver) {
            if(gameOverMenu == null) {
                gameOverMenu = new GameOverMenu(score.getScore());
            }
            gameOverMenu.tick();
            return;
        }
       
        player.tick();
        if (started) {
            for (ObstaclePair pair: obstacles) {
                pair.tick();
            }
            deleteOffScreenObstacles();
            addNewObstacle();
            if(checkCollisions()){
                isGameOver = true;
                // GameOverMenu menu = new GameOverMenu(this.score.getScore(), this::restartGame);
            }
            score.tick();
        }
        floor.tick();
    }
    private void restart() {
        started = false;
        score.setScore(-1);
        obstacles = new ArrayList <ObstaclePair> ();
        isGameOver = false;
        player = new Player();
    }
    public boolean isGameOver(){
        return isGameOver;
    }
    public void start(){
      started = true;
      player.start();
    }
    public boolean isStarted(){
      return started;
    }
    public void playerFlyUp(){
      player.flyUp();
    }
}
