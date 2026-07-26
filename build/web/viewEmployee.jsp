
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">

        <title>View Employees</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    </head>

    <body class="bg-light">

        <div class="container mt-5">

            <div class="card shadow">

                <div class="card-header bg-primary text-white">

                    <h3>
                        <i class="fa-solid fa-users"></i>
                        Employee List
                    </h3>

                </div>

                <div class="card-body">

                    <a href="addEmployee.jsp" class="btn btn-success mb-3">
                        <i class="fa-solid fa-user-plus"></i>
                        Add Employee
                    </a>

                    <table class="table table-bordered table-hover">

                        <thead class="table-dark">

                            <tr>

                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Gender</th>
                                <th>Department</th>
                                <th>Designation</th>
                                <th>Salary</th>
                                <th>Joining Date</th>
                                <th>Address</th>
                                <th>Action</th>

                            </tr>

                        </thead>

                        <tbody>

                            <%                                try {

                                    Statement st = con.createStatement();

                                    ResultSet rs = st.executeQuery("SELECT * FROM employee");

                                    while (rs.next()) {

                            %>

                            <tr>

                                <td><%=rs.getInt("emp_id")%></td>

                                <td><%=rs.getString("emp_name")%></td>

                                <td><%=rs.getString("emp_email")%></td>

                                <td><%=rs.getString("emp_phone")%></td>

                                <td><%=rs.getString("gender")%></td>

                                <td><%=rs.getString("department")%></td>

                                <td><%=rs.getString("designation")%></td>

                                <td><%=rs.getDouble("salary")%></td>

                                <td><%=rs.getString("joining_date")%></td>

                                <td><%=rs.getString("address")%></td>

                                <td>

                                    <a href="editEmployee.jsp?id=<%=rs.getInt("emp_id")%>"
                                       class="btn btn-warning btn-sm">

                                        <i class="fa-solid fa-pen"></i>

                                    </a>

                                    <a href="deleteEmployee.jsp?id=<%=rs.getInt("emp_id")%>"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Are you sure you want to delete this employee?');">
                                        <i class="fa-solid fa-trash"></i>
                                    </a>

                                </td>

                            </tr>

                            <%
                                    }

                                    rs.close();
                                    st.close();
                                    con.close();

                                } catch (Exception e) {

                                    out.println(e);

                                }

                            %>

                        </tbody>

                    </table>

                    <a href="dashboard.jsp" class="btn btn-secondary">
                        <i class="fa-solid fa-arrow-left"></i>
                        Back
                    </a>

                </div>

            </div>

        </div>

    </body>
</html>

