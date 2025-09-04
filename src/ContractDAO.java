import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class ContractDAO {
    public static void add(Connection conn, Scanner scan) throws Exception {
       System.out.print("Enter student ID: ");
       int studentId = scan.nextInt();

       System.out.print("Enter room ID: ");
       int roomId = scan.nextInt();

       System.out.print("Enter start date (YYYY-MM-DD): ");
       String startDate = scan.next();

       System.out.print("Enter end date (YYYY-MM-DD): ");
       String endDate = scan.next();

       System.out.print("Enter monthly rent: ");
       double rent = scan.nextDouble();

       String insertSql = """
         INSERT INTO Contracts
         (student_id, room_id, start_date, end_date, monthly_rent)
         VALUES (?, ?, ?, ?, ?)
         """;

       try (PreparedStatement pstmt = conn.prepareStatement(insertSql)) {
          pstmt.setInt(1, studentId);
          pstmt.setInt(2, roomId);
          pstmt.setString(3, startDate);
          pstmt.setString(4, endDate);
          pstmt.setDouble(5, rent);

          int rows = pstmt.executeUpdate();
          if (rows > 0) {
              System.out.println("Contract added successfully!");

              String updateRoomSql = "UPDATE Rooms SET is_available = FALSE WHERE room_id = ?";
              try (PreparedStatement upStmt = conn.prepareStatement(updateRoomSql)) {
                  upStmt.setInt(1, roomId);
                  upStmt.executeUpdate();
              }
          } else {
              System.out.println("Failed to add Contract.");
          }
       } catch (SQLException e) {
           System.err.println("Error inserting contract: " + e.getMessage());
       }
    }
}
