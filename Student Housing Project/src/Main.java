import java.sql.Connection;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.get();
        Scanner scan = new Scanner(System.in)) {

            while (true) {
                System.out.println("/n1.View Students 2.View Rooms 3.Add Contract 4.Exit");
                int choice = scan.nextInt();
                switch (choice) {
                    case 1 -> StudentDAO.listAll(conn);
                    case 2 -> RoomDAO.listAvailable(conn);
                    case 3 -> ContractDAO.add(conn, scan);
                    case 4 -> { System.out.println("Goodbye!"); return; }
                    default -> System.out.println("Invalid choice");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}