<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.employee.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Registration Successful</title>
  <style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 24px;
    }

    .card {
      background: rgba(255,255,255,0.05);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 16px;
      padding: 40px 44px;
      max-width: 560px;
      width: 100%;
      text-align: center;
      box-shadow: 0 25px 50px rgba(0,0,0,0.4);
    }

    .icon {
      font-size: 4rem;
      margin-bottom: 12px;
      animation: pop 0.4s ease;
    }
    @keyframes pop {
      0%   { transform: scale(0.5); opacity: 0; }
      80%  { transform: scale(1.15); }
      100% { transform: scale(1);   opacity: 1; }
    }

    h1 { color: #4ade80; font-size: 1.8rem; margin-bottom: 6px; }
    .subtitle { color: #94a3b8; font-size: 0.9rem; margin-bottom: 28px; }

    .details {
      background: rgba(255,255,255,0.05);
      border: 1px solid rgba(255,255,255,0.08);
      border-radius: 12px;
      padding: 20px 24px;
      text-align: left;
    }
    .detail-row {
      display: flex;
      justify-content: space-between;
      padding: 8px 0;
      border-bottom: 1px solid rgba(255,255,255,0.06);
      font-size: 0.9rem;
    }
    .detail-row:last-child { border-bottom: none; }
    .detail-label { color: #64b5f6; font-weight: 600; }
    .detail-value { color: #e2e8f0; text-align: right; max-width: 60%; }

    .btn-row { display: flex; gap: 12px; margin-top: 28px; }
    .btn {
      flex: 1; padding: 12px; border: none; border-radius: 10px;
      font-size: 0.95rem; font-weight: 600; cursor: pointer;
      text-decoration: none; display: inline-block; text-align: center;
      transition: transform 0.15s, box-shadow 0.15s;
    }
    .btn:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(0,0,0,0.3); }
    .btn-primary { background: linear-gradient(135deg, #3b82f6, #2563eb); color: #fff; }
    .btn-secondary {
      background: rgba(255,255,255,0.08);
      color: #94a3b8;
      border: 1px solid rgba(255,255,255,0.15);
    }
  </style>
</head>
<body>

<%
  Employee emp = (Employee) request.getAttribute("emp");
%>

  <div class="card">
    <div class="icon">&#10004;&#65039;</div>
    <h1>Registration Successful!</h1>
    <p class="subtitle">The employee has been added to the database.</p>

    <% if (emp != null) { %>
    <div class="details">
      <div class="detail-row">
        <span class="detail-label">Name</span>
        <span class="detail-value"><%= emp.getFirstName() %> <%= emp.getLastName() %></span>
      </div>
      <div class="detail-row">
        <span class="detail-label">Email</span>
        <span class="detail-value"><%= emp.getEmail() %></span>
      </div>
      <div class="detail-row">
        <span class="detail-label">Phone</span>
        <span class="detail-value"><%= emp.getPhone() %></span>
      </div>
      <div class="detail-row">
        <span class="detail-label">Department</span>
        <span class="detail-value"><%= emp.getDepartment() %></span>
      </div>
      <div class="detail-row">
        <span class="detail-label">Designation</span>
        <span class="detail-value"><%= emp.getDesignation() %></span>
      </div>
      <div class="detail-row">
        <span class="detail-label">Salary</span>
        <span class="detail-value">&#8377; <%= String.format("%.2f", emp.getSalary()) %></span>
      </div>
      <div class="detail-row">
        <span class="detail-label">Joining Date</span>
        <span class="detail-value"><%= emp.getJoinDate() %></span>
      </div>
    </div>
    <% } %>

    <div class="btn-row">
      <a href="index.jsp"        class="btn btn-primary">&#43; Register Another</a>
      <a href="EmployeeServlet"  class="btn btn-secondary">&#128203; View All</a>
    </div>
  </div>

</body>
</html>
