<%-- 
    Document   : index
    Created on : Dec 4, 2017, 10:43:37 PM
    Author     : Connor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="height:100%">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel ="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    
    <body style="height:100%">
        <header class="index-header">
            <img class="index-border-item" src="logo.png"></img>
        </header>
        <div id="login-box">
            <h1 style="text-align: center">Login to Attic</h1>

            <form name="login" action="loginAction.jsp" method="post">
                <div class="form-group login-field">
                  <label for="email">Email:</label>
                  <input type="text" class="form-control" required placeholder="Enter email" name="email">
                </div>
                <div class="form-group login-field">
                  <label for="pwd">Password:</label>
                  <input type="password" class="form-control" required placeholder="Enter password" name="pwd">
                </div>
                <div class="form-group login-field">
                    <input type="submit" id="button" class ="btn btn-block btn-default"></div>
                </div>
            </form>
        </div>
        <footer class="index-footer">
            <div class="index-border-item" style="text-align: center">A Project by Connor Botts</div>
        </footer>
    </body>
    
</html>
