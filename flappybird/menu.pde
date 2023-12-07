import java.util.function.Consumer;

public class GameOverMenu extends Tickable {
    private Consumer<Void> restartCallback;
    private PFont customFont;

    public GameOverMenu(int score, Consumer<Void> restartCallback) {
        this.customFont = createFont("fonts/flappy-font.ttf", 32);
        textFont(customFont);
        this.restartCallback = restartCallback;
    }

    public void tick() {
        restartCallback.accept(null);
    }
}