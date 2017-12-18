<%-- 
    Document   : action
    Created on : Oct 16, 2017, 9:19:01 PM
    Author     : Connor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    
        <%
      String first = request.getParameter("fname");
      String last = request.getParameter("lname");
      String email = request.getParameter("email1");
      String password = request.getParameter("password1");
      String user = request.getParameter("usertype");
      String gender = request.getParameter("gender");
      String notifications = (request.getParameter("notifications") != null) ? "yes" : "no"; 
      String sql = "insert into users (first, last, email, password, usertype, gender, notifications) "
        + "values ('" + first + "', '" + last + "', '" + email + "', '" + password + "', '"
        + user + "', '" +  gender + "', '" + notifications + "')";
      DBConnect dbConnect = new DBConnect();
    %>
    <%= dbConnect.insertData(sql)%>
    </botml>
