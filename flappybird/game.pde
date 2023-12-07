public class Game extends Tickable {
    protected Player player;
    protected ArrayList < ObstaclePair > obstacles;
    protected ObstaclePair lastAdded;
    protected boolean started = false;
    protected boolean isGameOver = false;
    public Game() {
        player = new Player();
        obstacles = new ArrayList < ObstaclePair > ();
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
        return false;
    }
    public void tick() {
        if(isGameOver) return;
        player.tick();
        for (ObstaclePair pair: obstacles) {
            pair.tick();
        }
        deleteOffScreenObstacles();
        addNewObstacle();
        if(checkCollisions()){
          isGameOver = true;
        }
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
