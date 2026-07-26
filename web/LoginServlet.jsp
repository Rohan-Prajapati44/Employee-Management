
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    try {

        
        String sql = "SELECT * FROM admin WHERE username=? AND password=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            session.setAttribute("username", username);

            response.sendRedirect("dashboard.jsp");

        } else {

%>

<script>
    alert("Invalid Username or Password");
    window.location = "login.jsp";
</script>

<%        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {

        out.println("<h3>" + e.getMessage() + "</h3>");

    }
%>

