import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class StudentDAO {
    public static void listAll(Connection conn) throws Exception {
        String sql = "SELECT * FROM Students";
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            System.out.println("ID | Name | Email");
            while (rs.next()) {
                System.out.printf("%d | %s | %s%n",
                        rs.getInt("student_id"),
                        rs.getString("name"),
                        rs.getString("email"));
            }
        }
    }
}
