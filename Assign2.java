class Employee{
    protected double salary;

    Employee(double salary){
        this.salary=salary;
    }
    void displaySalary(){
        System.out.println("Salary : "+salary);
    }
}

class FullTimeEmployee extends Employee{

    FullTimeEmployee(double salary){
        super(salary);
    }
    void calculateSalary(){
        salary=salary+(salary*0.5);
    }
}

class InternEmployee extends Employee{

    InternEmployee(double salary){
        super(salary);
    }
    void calculateSalary(){
        salary=salary+(salary*.25);
    }
}

public class Assign2 {
    public static void main(String[] args){
        FullTimeEmployee fte=new FullTimeEmployee(40000);
        System.out.println("Full time employee before hike : ");
        fte.displaySalary();
        fte.calculateSalary();
        System.out.println("Full time employee salary after hike : ");
        fte.displaySalary();

        System.out.println();

        InternEmployee intern=new InternEmployee(20000);
        System.out.println("Intern employee before hike : ");
        intern.displaySalary();
        intern.calculateSalary();
        System.out.println("Intern employee salary after hike : ");
        intern.displaySalary();
    }
}



// Full time employee before hike : 
// Salary : 40000.0
// Full time employee salary after hike : 
// Salary : 60000.0

// Intern employee before hike : 
// Salary : 20000.0
// Intern employee salary after hike : 
// Salary : 25000.0
