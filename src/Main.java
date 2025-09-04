import java.sql.Connection;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.get();
        Scanner scan = new Scanner(System.in)) {

            while (true) {
                System.out.println("1.View Students ");
                System.out.println("2.View Rooms");
                System.out.println("3.Add Contract");
                System.out.println("4.Exit");
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