
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%


try {

   
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String gender = request.getParameter("gender");
    String department = request.getParameter("department");
    String designation = request.getParameter("designation");
    String salary = request.getParameter("salary");
    String joiningDate = request.getParameter("joining_date");
    String address = request.getParameter("address");

    String sql = "INSERT INTO employee(emp_name,emp_email,emp_phone,gender,department,designation,salary,joining_date,address) VALUES(?,?,?,?,?,?,?,?,?)";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, phone);
    ps.setString(4, gender);
    ps.setString(5, department);
    ps.setString(6, designation);
    ps.setDouble(7, Double.parseDouble(salary));
    ps.setString(8, joiningDate);
    ps.setString(9, address);

    int i = ps.executeUpdate();

    if (i > 0) {
        response.sendRedirect("viewEmployee.jsp");
    } else {
        response.sendRedirect("addEmployee.jsp");
    }

    ps.close();
    con.close();

} catch (Exception e) {
    out.println("<h3>Error : " + e.getMessage() + "</h3>");
}
%>

