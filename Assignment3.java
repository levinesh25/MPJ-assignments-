import java.util.Scanner;

class Shapes {

    void area(int side) {
        System.out.println("Square area: " + (side * side));
    }

    void area(int length, int breadth) {
        System.out.println("Rectangle area: " + (length * breadth));
    }

    void area(double radius) {
        System.out.println("Circle area: " + (3.14 * radius * radius));
    }
}

// Method Overriding
class Hillstations {
    void famous() {
        System.out.println("Hillstation is famous");
    }
}

class Manali extends Hillstations {
    void famous() {
        System.out.println("Manali is in Uttarakhand");
    }
}

class Goa extends Hillstations {
    void famous() {
        System.out.println("Panjim is in Goa");
    }
}

public class Assignment3 {
    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);
        Shapes s = new Shapes();

        System.out.println("Area of Shapes");

        System.out.print("Enter side of square: ");
        int side = sc.nextInt();
        s.area(side);

        System.out.print("Enter length and breadth of rectangle: ");
        int l = sc.nextInt();
        int b = sc.nextInt();
        s.area(l, b);

        System.out.print("Enter radius of circle: ");
        double r = sc.nextDouble();
        s.area(r);

        System.out.println("\n Hillstation");

        Hillstations h;

        h = new Manali();
        h.famous();

        h = new Goa();
        h.famous();
    }
}

