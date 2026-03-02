import java.util.*;

class Employee {
    protected double salary;

    Employee(double salary) {
        this.salary = salary;
    }

    void displaySalary() {
        System.out.println("Salary : " + salary);
    }
}

class FullTimeEmployee extends Employee {

    FullTimeEmployee(double salary) {
        super(salary);
    }

    void calculateSalary() {
        salary = salary + (salary * 0.5);
    }
}

class InternEmployee extends Employee {

    InternEmployee(double salary) {
        super(salary);
    }

    void calculateSalary() {
        salary = salary + (salary * 0.25);
    }
}

public class Assign2 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        // Full Time Employee
        System.out.print("Enter Full Time Employee Salary: ");
        double fteSalary = sc.nextDouble();

        FullTimeEmployee fte = new FullTimeEmployee(fteSalary);

        System.out.println("\nFull time employee before hike:");
        fte.displaySalary();

        fte.calculateSalary();

        System.out.println("Full time employee salary after hike:");
        fte.displaySalary();

        System.out.println();

        // Intern Employee
        System.out.print("Enter Intern Employee Salary: ");
        double internSalary = sc.nextDouble();

        InternEmployee intern = new InternEmployee(internSalary);

        System.out.println("\nIntern employee before hike:");
        intern.displaySalary();

        intern.calculateSalary();

        System.out.println("Intern employee salary after hike:");
        intern.displaySalary();

        sc.close();
    }
}
