<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Employee Registration</title>
  <style>
    /* ── Reset & Base ─────────────────────────────────────────── */
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 40px 16px;
    }

    /* ── Header ───────────────────────────────────────────────── */
    .header {
      text-align: center;
      margin-bottom: 32px;
      color: #e2e8f0;
    }
    .header h1 {
      font-size: 2rem;
      font-weight: 700;
      letter-spacing: 1px;
    }
    .header p { color: #94a3b8; margin-top: 6px; font-size: 0.95rem; }

    /* ── Card ─────────────────────────────────────────────────── */
    .card {
      background: rgba(255,255,255,0.05);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(255,255,255,0.1);
      border-radius: 16px;
      padding: 36px 40px;
      width: 100%;
      max-width: 680px;
      box-shadow: 0 25px 50px rgba(0,0,0,0.4);
    }

    /* ── Form Grid ────────────────────────────────────────────── */
    .form-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
    }
    .form-group { display: flex; flex-direction: column; gap: 6px; }
    .form-group.full { grid-column: 1 / -1; }

    label {
      font-size: 0.82rem;
      font-weight: 600;
      text-transform: uppercase;
      letter-spacing: 0.8px;
      color: #64b5f6;
    }

    input, select {
      background: rgba(255,255,255,0.08);
      border: 1px solid rgba(255,255,255,0.15);
      border-radius: 8px;
      color: #e2e8f0;
      font-size: 0.95rem;
      padding: 10px 14px;
      transition: border-color 0.25s, background 0.25s;
      outline: none;
    }
    input::placeholder { color: #64748b; }
    input:focus, select:focus {
      border-color: #64b5f6;
      background: rgba(100,181,246,0.08);
    }
    select option { background: #1e293b; color: #e2e8f0; }

    /* ── Error Banner ─────────────────────────────────────────── */
    .error-banner {
      background: rgba(239,68,68,0.15);
      border: 1px solid rgba(239,68,68,0.4);
      color: #fca5a5;
      border-radius: 8px;
      padding: 12px 16px;
      margin-bottom: 20px;
      font-size: 0.9rem;
    }

    /* ── Buttons ──────────────────────────────────────────────── */
    .btn-row {
      margin-top: 28px;
      display: flex;
      gap: 12px;
    }
    .btn {
      flex: 1;
      padding: 12px;
      border: none;
      border-radius: 10px;
      font-size: 0.95rem;
      font-weight: 600;
      cursor: pointer;
      transition: transform 0.15s, box-shadow 0.15s;
    }
    .btn:hover { transform: translateY(-1px); box-shadow: 0 6px 20px rgba(0,0,0,0.3); }
    .btn-primary { background: linear-gradient(135deg, #3b82f6, #2563eb); color: #fff; }
    .btn-secondary {
      background: rgba(255,255,255,0.08);
      color: #94a3b8;
      border: 1px solid rgba(255,255,255,0.15);
    }

    /* ── View link ────────────────────────────────────────────── */
    .view-link {
      margin-top: 20px;
      text-align: center;
      color: #64b5f6;
      font-size: 0.9rem;
    }
    .view-link a { color: #64b5f6; text-decoration: none; font-weight: 600; }
    .view-link a:hover { text-decoration: underline; }

    @media (max-width: 580px) {
      .form-grid { grid-template-columns: 1fr; }
      .card { padding: 24px 20px; }
    }
  </style>
</head>
<body>

  <div class="header">
    <h1>&#128188; Employee Registration</h1>
    <p>Fill in the details below to register a new employee</p>
  </div>

  <div class="card">

    <!-- Error message (if any) -->
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %>
      <div class="error-banner">&#9888; <%= error %></div>
    <% } %>

    <form action="EmployeeServlet" method="POST">
      <div class="form-grid">

        <!-- First Name -->
        <div class="form-group">
          <label for="firstName">First Name</label>
          <input type="text" id="firstName" name="firstName"
                 placeholder="John" required maxlength="50"/>
        </div>

        <!-- Last Name -->
        <div class="form-group">
          <label for="lastName">Last Name</label>
          <input type="text" id="lastName" name="lastName"
                 placeholder="Doe" required maxlength="50"/>
        </div>

        <!-- Email -->
        <div class="form-group">
          <label for="email">Email Address</label>
          <input type="email" id="email" name="email"
                 placeholder="john.doe@company.com" required/>
        </div>

        <!-- Phone -->
        <div class="form-group">
          <label for="phone">Phone Number</label>
          <input type="tel" id="phone" name="phone"
                 placeholder="9876543210" required pattern="[0-9]{10}"/>
        </div>

        <!-- Department -->
        <div class="form-group">
          <label for="department">Department</label>
          <select id="department" name="department" required>
            <option value="">-- Select Department --</option>
            <option>Engineering</option>
            <option>Human Resources</option>
            <option>Finance</option>
            <option>Marketing</option>
            <option>Operations</option>
            <option>Sales</option>
            <option>IT Support</option>
          </select>
        </div>

        <!-- Designation -->
        <div class="form-group">
          <label for="designation">Designation</label>
          <input type="text" id="designation" name="designation"
                 placeholder="Software Engineer" required maxlength="80"/>
        </div>

        <!-- Salary -->
        <div class="form-group">
          <label for="salary">Salary (₹)</label>
          <input type="number" id="salary" name="salary"
                 placeholder="50000" required min="0" step="0.01"/>
        </div>

        <!-- Join Date -->
        <div class="form-group">
          <label for="joinDate">Joining Date</label>
          <input type="date" id="joinDate" name="joinDate" required/>
        </div>

      </div><!-- /.form-grid -->

      <div class="btn-row">
        <button type="reset"  class="btn btn-secondary">&#8635; Reset</button>
        <button type="submit" class="btn btn-primary">&#10003; Register Employee</button>
      </div>

    </form>

    <div class="view-link">
      <a href="EmployeeServlet">&#128203; View All Registered Employees &rarr;</a>
    </div>

  </div><!-- /.card -->

</body>
</html>
