import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class RoomDAO {
    public static void listAvailable(Connection conn) throws Exception {
     String sql = """
             SELECT r.room_id,
             r.room_number,
             r.capacity,
             r.rent,
             b.name AS building
             FROM Rooms r
             JOIN Buildings b
             ON r.building_id = b.building_id
             WHERE r.is_available = TRUE
             """;
     try (Statement stmt = conn.createStatement();
           ResultSet rs = stmt.executeQuery(sql)) {

         System.out.println("\nAvailable Rooms:");
         System.out.println("ID | Room Number | Capacity | Rent | Building");
         System.out.println("_______________________________________________");
         while (rs.next()) {
             System.out.printf(
                     "%2d | %-11s | %8d | %6.2f | %s%n",
                     rs.getInt("room_id"),
                     rs.getString("room_number"),
                     rs.getInt("capacity"),
                     rs.getDouble("rent"),
                     rs.getString("building")
             );
         }
     }
    }
}
