package com.employee.model;

public class Employee {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private String department;
    private String designation;
    private double salary;
    private String joinDate;

    // Default constructor
    public Employee() {}

    // Parameterized constructor
    public Employee(String firstName, String lastName, String email,
                    String phone, String department, String designation,
                    double salary, String joinDate) {
        this.firstName   = firstName;
        this.lastName    = lastName;
        this.email       = email;
        this.phone       = phone;
        this.department  = department;
        this.designation = designation;
        this.salary      = salary;
        this.joinDate    = joinDate;
    }

    // Getters & Setters
    public int getId()                        { return id; }
    public void setId(int id)                 { this.id = id; }

    public String getFirstName()              { return firstName; }
    public void setFirstName(String v)        { this.firstName = v; }

    public String getLastName()               { return lastName; }
    public void setLastName(String v)         { this.lastName = v; }

    public String getEmail()                  { return email; }
    public void setEmail(String v)            { this.email = v; }

    public String getPhone()                  { return phone; }
    public void setPhone(String v)            { this.phone = v; }

    public String getDepartment()             { return department; }
    public void setDepartment(String v)       { this.department = v; }

    public String getDesignation()            { return designation; }
    public void setDesignation(String v)      { this.designation = v; }

    public double getSalary()                 { return salary; }
    public void setSalary(double v)           { this.salary = v; }

    public String getJoinDate()               { return joinDate; }
    public void setJoinDate(String v)         { this.joinDate = v; }
}
