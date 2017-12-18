<%-- 
    Document   : loginAction
    Created on : Dec 5, 2017, 12:38:56 AM
    Author     : Connor
--%>

<%@page import="myBeans.DBConnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
      String email = request.getParameter("email");
      String pwd = request.getParameter("pwd");
      String sql = "select email, password, usertype from users where email = ? and password = ?";
      DBConnect dbConnect = new DBConnect();
      String result = dbConnect.isPwdValid(sql, email, pwd);
      if (result.equals("Admin")) {
        session.setAttribute("logged", "admin");
        response.sendRedirect("adminsettings.jsp");
      } else if (result.startsWith("Error")) {
        session.setAttribute("logged", "index");
        response.sendRedirect("index.jsp");
      } else {
        session.setAttribute("logged", email);
        response.sendRedirect("properties.jsp");
      }
    %>
    </body>
</html>
