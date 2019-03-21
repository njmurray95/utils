// Borrowed from https://www.mkyong.com/java/how-to-list-all-system-properties-key-and-value-in-java/
import java.util.Properties;

public class DisplayProperties {

    public static void main(String[] args) {

        Properties properties = System.getProperties();
        // Java 8
        properties.forEach((k, v) -> System.out.println(k + ":" + v));
    }
}
