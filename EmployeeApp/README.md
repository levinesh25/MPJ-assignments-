# Assignment 05 – Employee Registration (JSP + Servlet + JDBC)

## Project Structure

```
EmployeeApp/
├── sql/
│   └── setup.sql                          ← Run this first in MySQL
└── src/main/
    ├── java/com/employee/
    │   ├── model/
    │   │   └── Employee.java              ← POJO / Model
    │   ├── dao/
    │   │   ├── DBConnection.java          ← JDBC connection utility
    │   │   └── EmployeeDAO.java           ← DB operations (CRUD)
    │   └── servlet/
    │       └── EmployeeServlet.java       ← Controller (GET + POST)
    └── webapp/
        ├── index.jsp                      ← Registration form
        ├── success.jsp                    ← Post-registration confirmation
        ├── employees.jsp                  ← View all employees (with delete)
        └── WEB-INF/
            └── web.xml                    ← Deployment descriptor
```

---

## Step-by-Step Setup

### Step 1 – Prerequisites (install if not already done)
| Tool | Version | Download |
|------|---------|----------|
| JDK  | 1.8+    | https://adoptium.net |
| Apache Tomcat | 8.5+ | https://tomcat.apache.org |
| MySQL | 8.0+ | https://dev.mysql.com/downloads |
| Eclipse / STS | Latest | https://spring.io/tools or https://eclipse.org |
| MySQL Connector/J | 8.x | https://dev.mysql.com/downloads/connector/j |

---

### Step 2 – Set Up the Database
Open MySQL Workbench or the MySQL CLI and run:

```sql
SOURCE /path/to/EmployeeApp/sql/setup.sql;
```

Or paste the contents of `setup.sql` directly into MySQL Workbench and execute.

**Default credentials assumed in DBConnection.java:**
- Username: `root`
- Password: `root`
- Database: `employeedb`

Change these in `DBConnection.java` if yours are different.

---

### Step 3 – Create a Dynamic Web Project in Eclipse

1. Open Eclipse → **File → New → Dynamic Web Project**
2. Set **Project Name**: `EmployeeApp`
3. Set **Target Runtime**: Apache Tomcat 8.5 (add it if not already configured)
4. Click **Finish**

---

### Step 4 – Copy Files

Copy the files into your Eclipse project:

| Source path | Eclipse destination |
|-------------|---------------------|
| `src/main/java/com/employee/**` | `src/com/employee/...` |
| `src/main/webapp/*.jsp` | `WebContent/` |
| `src/main/webapp/WEB-INF/web.xml` | `WebContent/WEB-INF/web.xml` |

---

### Step 5 – Add the MySQL JAR to the Build Path

1. Download `mysql-connector-java-8.x.x.jar`
2. Right-click project → **Build Path → Configure Build Path**
3. **Libraries** tab → **Add External JARs** → select the JAR
4. Also copy the JAR into `WebContent/WEB-INF/lib/`

---

### Step 6 – Run on Tomcat

1. Right-click the project → **Run As → Run on Server**
2. Choose **Tomcat 8.5** → Finish
3. Browser opens automatically. If not, go to:

```
http://localhost:8080/EmployeeApp/
```

---

## Pages & URLs

| URL | Description |
|-----|-------------|
| `http://localhost:8080/EmployeeApp/` | Registration form |
| `http://localhost:8080/EmployeeApp/EmployeeServlet` | View all employees |
| Submitting the form | Redirects to success.jsp |
| Clicking Delete | Removes employee from DB |

---

## FAQ Answers (for viva)

**Q1: Difference between Servlet and JSP?**
- **Servlet** is a Java class that handles HTTP requests/responses. Logic-heavy.
- **JSP** is an HTML page with embedded Java code. Presentation-heavy.
- Servlet = Controller, JSP = View (in MVC pattern).

**Q2: Advantages of JSP**
- Easier to write HTML output than in Servlets
- Supports custom tags (JSTL)
- Automatic compilation by the container
- Separation of presentation from business logic

**Q3: GET vs POST**
- **GET**: Appends data to URL; bookmarkable; not secure; used for reading
- **POST**: Sends data in the request body; secure; used for creating/updating data

**Q4: GenericServlet vs HttpServlet**
- **GenericServlet**: Protocol-independent; implements `service()` method
- **HttpServlet**: HTTP-specific; provides `doGet()`, `doPost()`, etc.

**Q5: Major components of JDBC**
1. **DriverManager** – manages database drivers
2. **Connection** – represents a DB connection
3. **Statement / PreparedStatement** – executes SQL
4. **ResultSet** – holds query results
5. **SQLException** – handles DB errors
