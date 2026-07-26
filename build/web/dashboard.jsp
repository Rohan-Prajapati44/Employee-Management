

<%@ include file="connection.jsp" %>
<%    int totalEmployee = 0;
    int totalDepartment = 0;
    double totalSalary = 0;

    try {

        Statement st = con.createStatement();

        // Total Employees
        ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM employee");
        if (rs1.next()) {
            totalEmployee = rs1.getInt(1);
        }
        rs1.close();

        // Total Departments
        ResultSet rs2 = st.executeQuery("SELECT COUNT(DISTINCT department) FROM employee");
        if (rs2.next()) {
            totalDepartment = rs2.getInt(1);
        }
        rs2.close();

        // Total Salary
        ResultSet rs3 = st.executeQuery("SELECT IFNULL(SUM(salary),0) FROM employee");
        if (rs3.next()) {
            totalSalary = rs3.getDouble(1);
        }
        rs3.close();

        st.close();

    } catch (Exception e) {
        out.println(e);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Dashboard</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <style>
            body{
                background:#f5f5f5;
            }

            .sidebar{
                width:250px;
                height:100vh;
                background:#0d6efd;
                position:fixed;
                left:0;
                top:0;
            }

            .sidebar h3{
                color:white;
                text-align:center;
                padding:20px;
            }

            .sidebar a{
                display:block;
                color:white;
                text-decoration:none;
                padding:15px 20px;
                transition:.3s;
            }

            .sidebar a:hover{
                background:white;
                color:#0d6efd;
            }

            .main{
                margin-left:250px;
                padding:30px;
            }

            .card{
                border:none;
                border-radius:15px;
                box-shadow:0 5px 15px rgba(0,0,0,.2);
            }

            .card h3{
                font-size:35px;
            }

            .topbar{
                background:white;
                padding:15px;
                border-radius:10px;
                margin-bottom:20px;
            }
        </style>

    </head>
    <body>

        <div class="sidebar">

            <h3><i class="fa-solid fa-building"></i> Employee EMS</h3>

            <a href="dashboard.jsp">
                <i class="fa-solid fa-house"></i> Dashboard
            </a>

            <a href="addEmployee.jsp">
                <i class="fa-solid fa-user-plus"></i> Add Employee
            </a>

            <a href="viewEmployee.jsp">
                <i class="fa-solid fa-users"></i> View Employee
            </a>

            <a href="index.html">
                <i class="fa-solid fa-right-from-bracket"></i> Logout
            </a>

        </div>

        <div class="main">

            <div class="topbar">

                <h4 class="text-success">
                    Welcome,
                    <%= session.getAttribute("username")%>
                </h4>

            </div>

            <div class="row">

                <div class="col-md-4">
                    <div class="card text-center p-4 bg-primary text-white">
                        <h3><%= totalEmployee%></h3>
                        <h5>Total Employees</h5>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card text-center p-4 bg-success text-white">
                        <h3><%= totalDepartment%></h3>
                        <h5>Departments</h5>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card text-center p-4 bg-danger text-white">
                        <h3>Rs. <%= String.format("%,.0f", totalSalary)%></h3>
                        <h5>Total Salary</h5>
                    </div>
                </div>

            </div>

            <br>

            <div class="card shadow border-0 mt-4">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">
                        <i class="fa-solid fa-users"></i> Employee Management System
                    </h4>
                </div>

                <div class="card-body">

                    <p class="text-muted">
                        Welcome to the Employee Management System. You can manage all employee records using the options below.
                    </p>

                    <div class="list-group">

                        <a href="addEmployee.jsp" class="list-group-item list-group-item-action">
                            <i class="fa-solid fa-user-plus text-success"></i>
                            Add Employee
                        </a>

                        <a href="viewEmployee.jsp" class="list-group-item list-group-item-action">
                            <i class="fa-solid fa-users text-primary"></i>
                            View Employees
                        </a>



                        <a href="searchEmployee.jsp" class="list-group-item list-group-item-action">
                            <i class="fa-solid fa-magnifying-glass text-info"></i>
                            Search Employee
                        </a>

                    </div>

                </div>
            </div>

        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>

