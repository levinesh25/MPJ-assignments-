import java.util.*;

class Student {

    private String name;
    private int rollNo;
    private int marks[];
    private double percentage;

    Student(String name, int rollNo, int marks[]) {
        this.name = name;
        this.rollNo = rollNo;
        this.marks = marks;
    }

    public void calculatePercentage() {
        int total = 0;
        for (int m : marks) {
            total += m;
        }
        percentage = total / (double) marks.length;
    }

    public double getPercentage() {
        return percentage;
    }

    public String getName() {
        return name;
    }

    public void displayResult() {
        System.out.println("\n------------------------------");
        System.out.println("Name       : " + name);
        System.out.println("Roll No    : " + rollNo);

        System.out.print("Marks      : ");
        for (int m : marks) {
            System.out.print(m + " ");
        }

        System.out.printf("\nPercentage : %.2f\n", percentage);

        if (percentage >= 75)
            System.out.println("Grade      : A");
        else if (percentage >= 60)
            System.out.println("Grade      : B");
        else if (percentage >= 40)
            System.out.println("Grade      : C");
        else
            System.out.println("Grade      : FAIL");
    }
}

public class Assignment1 {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        System.out.print("Enter number of students: ");
        int n = sc.nextInt();
        sc.nextLine();

        Student[] students = new Student[n];

        double totalClassPercentage = 0;
        double highest = 0;
        String topper = "";

        for (int i = 0; i < n; i++) {

            System.out.println("\nEnter details of Student " + (i + 1));

            System.out.print("Enter Name: ");
            String name = sc.nextLine();

            System.out.print("Enter Roll No: ");
            int rollNo = sc.nextInt();

            int[] marks = new int[5];
            System.out.println("Enter marks of 5 subjects:");
            for (int j = 0; j < 5; j++) {
                System.out.print("Subject " + (j + 1) + ": ");
                marks[j] = sc.nextInt();
            }
            sc.nextLine();

            students[i] = new Student(name, rollNo, marks);
            students[i].calculatePercentage();

            double percent = students[i].getPercentage();
            totalClassPercentage += percent;

            if (percent > highest) {
                highest = percent;
                topper = students[i].getName();
            }
        }

        System.out.println("\n========= STUDENT RESULTS =========");
        for (Student s : students) {
            s.displayResult();
        }

        double classAverage = totalClassPercentage / n;

        System.out.println("\n=================================");
        System.out.printf("Class Average Percentage = %.2f\n", classAverage);
        System.out.printf("Topper of the Class = %s (%.2f%%)\n", topper, highest);

        sc.close();
    }
}