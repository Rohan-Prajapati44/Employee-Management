
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search Employee</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    </head>
    <body class="bg-light">

        <div class="container mt-5">

            <div class="card shadow">

                <div class="card-header bg-primary text-white">
                    <h3><i class="fa-solid fa-magnifying-glass"></i> Search Employee</h3>
                </div>

                <div class="card-body">

                    <form method="get">

                        <div class="row">

                            <div class="col-md-10">
                                <input type="text" name="search"
                                       class="form-control"
                                       placeholder="Enter Employee Name"
                                       required>
                            </div>

                            <div class="col-md-2">
                                <button class="btn btn-primary w-100">
                                    <i class="fa-solid fa-search"></i> Search
                                </button>
                            </div>

                        </div>

                    </form>

                    <hr>

                    <table class="table table-bordered table-hover">

                        <thead class="table-dark">

                            <tr>

                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Department</th>
                                <th>Designation</th>
                                <th>Salary</th>
                                <th>Action</th>

                            </tr>

                        </thead>

                        
                        <%    String search = request.getParameter("search");

                            if (search != null && !search.trim().isEmpty()) {

                                PreparedStatement ps = con.prepareStatement(
                                        "SELECT * FROM employee WHERE LOWER(emp_name) LIKE ?"
                                );

                                ps.setString(1, "%" + search.toLowerCase() + "%");

                                ResultSet rs = ps.executeQuery();

                                boolean found = false;

                                while (rs.next()) {

                                    found = true;
                        %>

                        <tr>

                            <td><%=rs.getInt("emp_id")%></td>

                            <td><%=rs.getString("emp_name")%></td>

                            <td><%=rs.getString("emp_email")%></td>

                            <td><%=rs.getString("emp_phone")%></td>

                            <td><%=rs.getString("department")%></td>

                            <td><%=rs.getString("designation")%></td>

                            <td><%=rs.getDouble("salary")%></td>

                            <td>

                                <a href="editEmployee.jsp?id=<%=rs.getInt("emp_id")%>"
                                   class="btn btn-warning btn-sm">
                                    <i class="fa-solid fa-pen"></i>
                                </a>

                                <a href="deleteEmployee.jsp?id=<%=rs.getInt("emp_id")%>"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('Delete Employee?')">
                                    <i class="fa-solid fa-trash"></i>
                                </a>

                            </td>

                        </tr>

                        <%
                            }

                            if (!found) {
                        %>

                        <tr>
                            <td colspan="8" class="text-center text-danger fw-bold fs-5">
                                <i class="fa-solid fa-circle-exclamation"></i>
                                Employee Not Found
                            </td>
                        </tr>

                        <%
                                }

                                rs.close();
                                ps.close();
                            }
                        %>
                        


                    </table>

                    <a href="dashboard.jsp" class="btn btn-secondary">
                        <i class="fa-solid fa-arrow-left"></i> Back
                    </a>

                </div>

            </div>

        </div>

    </body>
</html>
