<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.employee.model.Employee, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>All Employees</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
      min-height: 100vh;
      padding: 40px 24px;
      color: #e2e8f0;
    }

    .top-bar {
      max-width: 1100px;
      margin: 0 auto 28px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 12px;
    }
    .top-bar h1 { font-size: 1.7rem; }
    .top-bar h1 span { color: #64b5f6; }

    .btn {
      padding: 10px 20px;
      border: none;
      border-radius: 8px;
      font-size: 0.9rem;
      font-weight: 600;
      cursor: pointer;
      text-decoration: none;
      display: inline-block;
      background: linear-gradient(135deg, #3b82f6, #2563eb);
      color: #fff;
      transition: transform 0.15s;
    }
    .btn:hover { transform: translateY(-1px); }

    /* ── Table ──────────────────────────────────────────────── */
    .table-wrap {
      max-width: 1100px;
      margin: 0 auto;
      overflow-x: auto;
      border-radius: 14px;
      border: 1px solid rgba(255,255,255,0.1);
      box-shadow: 0 20px 40px rgba(0,0,0,0.4);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: rgba(255,255,255,0.04);
      backdrop-filter: blur(10px);
      font-size: 0.88rem;
    }

    thead tr {
      background: rgba(59,130,246,0.2);
    }
    th {
      padding: 14px 16px;
      text-align: left;
      font-size: 0.78rem;
      text-transform: uppercase;
      letter-spacing: 0.8px;
      color: #64b5f6;
      font-weight: 700;
      white-space: nowrap;
    }
    td {
      padding: 13px 16px;
      border-top: 1px solid rgba(255,255,255,0.06);
      color: #cbd5e1;
      vertical-align: middle;
    }
    tr:hover td { background: rgba(255,255,255,0.04); }

    .badge {
      display: inline-block;
      padding: 3px 10px;
      border-radius: 20px;
      font-size: 0.78rem;
      font-weight: 600;
      background: rgba(59,130,246,0.2);
      color: #93c5fd;
      border: 1px solid rgba(59,130,246,0.3);
    }

    .del-btn {
      background: rgba(239,68,68,0.15);
      color: #fca5a5;
      border: 1px solid rgba(239,68,68,0.3);
      border-radius: 6px;
      padding: 5px 12px;
      font-size: 0.8rem;
      font-weight: 600;
      cursor: pointer;
      text-decoration: none;
      transition: background 0.2s;
    }
    .del-btn:hover { background: rgba(239,68,68,0.3); }

    .empty-row td {
      text-align: center;
      padding: 40px;
      color: #475569;
      font-style: italic;
    }
  </style>
</head>
<body>

<%
  @SuppressWarnings("unchecked")
  List<Employee> employees = (List<Employee>) request.getAttribute("employees");
%>

  <div class="top-bar">
    <h1>&#128203; Employee List
      <span>&nbsp;(<%= (employees != null ? employees.size() : 0) %> total)</span>
    </h1>
    <a href="index.jsp" class="btn">&#43; Register New Employee</a>
  </div>

  <div class="table-wrap">
    <table>
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Email</th>
          <th>Phone</th>
          <th>Department</th>
          <th>Designation</th>
          <th>Salary (&#8377;)</th>
          <th>Joining Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <% if (employees == null || employees.isEmpty()) { %>
          <tr class="empty-row">
            <td colspan="9">No employees registered yet. Click "Register New Employee" to get started.</td>
          </tr>
        <% } else {
             int sr = 1;
             for (Employee emp : employees) { %>
          <tr>
            <td><%= sr++ %></td>
            <td><strong style="color:#e2e8f0;"><%= emp.getFirstName() %> <%= emp.getLastName() %></strong></td>
            <td><%= emp.getEmail() %></td>
            <td><%= emp.getPhone() %></td>
            <td><span class="badge"><%= emp.getDepartment() %></span></td>
            <td><%= emp.getDesignation() %></td>
            <td><%= String.format("%.2f", emp.getSalary()) %></td>
            <td><%= emp.getJoinDate() %></td>
            <td>
              <a href="EmployeeServlet?action=delete&id=<%= emp.getId() %>"
                 class="del-btn"
                 onclick="return confirm('Delete this employee?')">&#128465; Delete</a>
            </td>
          </tr>
        <% } } %>
      </tbody>
    </table>
  </div>

</body>
</html>
