package com.employee.servlet;

import com.employee.dao.EmployeeDAO;
import com.employee.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final EmployeeDAO dao = new EmployeeDAO();

    // ── GET — list all employees (or delete if ?action=delete&id=N) ──────────
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("delete".equalsIgnoreCase(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.deleteEmployee(id);
            resp.sendRedirect("EmployeeServlet");
            return;
        }

        // Default: show all employees
        List<Employee> employees = dao.getAllEmployees();
        req.setAttribute("employees", employees);
        req.getRequestDispatcher("employees.jsp").forward(req, resp);
    }

    // ── POST — register a new employee ──────────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // Read form fields
        String firstName   = req.getParameter("firstName").trim();
        String lastName    = req.getParameter("lastName").trim();
        String email       = req.getParameter("email").trim();
        String phone       = req.getParameter("phone").trim();
        String department  = req.getParameter("department").trim();
        String designation = req.getParameter("designation").trim();
        double salary      = Double.parseDouble(req.getParameter("salary"));
        String joinDate    = req.getParameter("joinDate").trim();

        Employee emp = new Employee(firstName, lastName, email, phone,
                                    department, designation, salary, joinDate);

        boolean success = dao.insertEmployee(emp);

        if (success) {
            req.setAttribute("message", "Employee registered successfully!");
            req.setAttribute("emp", emp);
            req.getRequestDispatcher("success.jsp").forward(req, resp);
        } else {
            req.setAttribute("error", "Registration failed. Please try again.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}
