<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logging Out</title>
  </head>
  <body>
    <%
      session.setAttribute("logged", "index");
      response.sendRedirect("index.jsp");
    %>
  </body>
</html>
