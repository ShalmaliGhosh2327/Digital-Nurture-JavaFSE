public class SingletonTest {

    public static void main(String[] args) {

        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("Application started");
        logger2.log("Testing Singleton Pattern");

        if (logger1 == logger2) {
            System.out.println("Only one Logger instance exists.");
        }
    }
}