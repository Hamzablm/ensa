import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
    Connection conn = null;

    public static Connection dbConnector() {

        try {
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/hamzabelmellouki", "hamzabelmellouki", "");
            return conn;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}