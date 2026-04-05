import java.util.*;
import java.io.*;

public class Assignment4{
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        try {
            System.out.print("Enter ID less than 21: ");
            int id = sc.nextInt();

            if (id < 1 || id > 20) {
                System.out.println("Invalid ID");
                return;
            }

            sc.nextLine();

            System.out.print("Enter Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Amount greater than 1000: ");
            int amount = sc.nextInt();

            if (amount < 1000) {
                System.out.println("Minimum balance should be 1000");
                return;
            }

            System.out.print("Enter amount to withdraw: ");
            int w = sc.nextInt();

            if (w > amount) {
                System.out.println("Not enough balance");
                return;
            }

            if (w < 0) {
                System.out.println("Amount should be greater than 0");
                return;
            }

            amount = amount - w;

            // Write to file
            FileWriter fw = new FileWriter("data.txt");
            fw.write("ID: " + id + "\n");
            fw.write("Name: " + name + "\n");
            fw.write("Balance: " + amount + "\n");
            fw.close();

            System.out.println("\nData saved to file!");20
            BufferedReader br = new BufferedReader(new FileReader("data.txt"));
            String line;

            System.out.println("\nFile:");
            while ((line = br.readLine()) != null) {
                System.out.println(line);
            }

            br.close();

        } catch (Exception e) {
            System.out.println("Error occurred");
        }
    }
}