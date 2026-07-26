
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    PreparedStatement ps = con.prepareStatement("SELECT * FROM employee WHERE emp_id=?");
    ps.setInt(1, id);

    ResultSet rs = ps.executeQuery();

    if (rs.next()) {
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Edit Employee</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

    </head>

    <body class="bg-light">

        <div class="container mt-5">

            <div class="card shadow">

                <div class="card-header bg-warning text-dark">

                    <h3>
                        <i class="fa-solid fa-user-pen"></i>
                        Update Employee
                    </h3>

                </div>

                <div class="card-body">

                    <form action="updateEmployee.jsp" method="post">

                        <input type="hidden" name="id"
                               value="<%=rs.getInt("emp_id")%>">

                        <div class="row">

                            <div class="col-md-6 mb-3">
                                <label>Name</label>
                                <input type="text" name="name"
                                       class="form-control"
                                       value="<%=rs.getString("emp_name")%>" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Email</label>
                                <input type="email" name="email"
                                       class="form-control"
                                       value="<%=rs.getString("emp_email")%>" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Phone</label>
                                <input type="text" name="phone"
                                       class="form-control"
                                       value="<%=rs.getString("emp_phone")%>" required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Gender</label>
                                <select name="gender" class="form-select">
                                    <option <%=rs.getString("gender").equals("Male") ? "selected" : ""%>>Male</option>
                                    <option <%=rs.getString("gender").equals("Female") ? "selected" : ""%>>Female</option>
                                    <option <%=rs.getString("gender").equals("Other") ? "selected" : ""%>>Other</option>
                                </select>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Department</label>
                                <input type="text" name="department"
                                       class="form-control"
                                       value="<%=rs.getString("department")%>">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Designation</label>
                                <input type="text" name="designation"
                                       class="form-control"
                                       value="<%=rs.getString("designation")%>">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Salary</label>
                                <input type="number" name="salary"
                                       class="form-control"
                                       value="<%=rs.getDouble("salary")%>">
                            </div>

                            <div class="col-md-6 mb-3">
                                <label>Joining Date</label>
                                <input type="date" name="joining_date"
                                       class="form-control"
                                       value="<%=rs.getString("joining_date")%>">
                            </div>

                            <div class="col-12 mb-3">
                                <label>Address</label>
                                <textarea name="address"
                                          class="form-control"
                                          rows="3"><%=rs.getString("address")%></textarea>
                            </div>

                            <div class="text-center">

                                <button type="submit" class="btn btn-primary">
                                    <i class="fa-solid fa-floppy-disk"></i>
                                    Update
                                </button>

                                <a href="viewEmployee.jsp" class="btn btn-secondary">
                                    Back
                                </a>

                            </div>

                    </form>

                </div>

            </div>

        </div>

    </body>
</html>

<%
    }

    rs.close();
    ps.close();
    con.close();
%>

