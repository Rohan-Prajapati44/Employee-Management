
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
    try {

        int id = Integer.parseInt(request.getParameter("id"));

        String sql = "DELETE FROM employee WHERE emp_id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, id);

        int i = ps.executeUpdate();

        if (i > 0) {
%>

<script>
    alert("Employee Deleted Successfully");
    window.location = "viewEmployee.jsp";
</script>

<%
} else {
%>

<script>
    alert("Employee Delete Failed");
    window.location = "viewEmployee.jsp";
</script>

<%
        }

        ps.close();
        con.close();

    } catch (Exception e) {

        out.println("<h3>Error : " + e.getMessage() + "</h3>");

    }
%>

