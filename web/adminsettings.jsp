<%-- 
    Document   : adminsettings
    Created on : Oct 16, 2017, 9:14:11 PM
    Author     : Connor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp" %>
        <script  type="text/javascript" src="validate.js"></script>
    </head>
    <body>
        <%
            if (!logged.equals("admin")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <form name="register" action="createAccountAction.jsp" method="get" class="cover body-left">
            <h1>Create a New Account</h1>
            <div class="form-group">
              <label>First Name</label>
              <input type="text" name="fname" class="form-control" placeholder="John">
            </div>
            <div class="form-group">
              <label>Last Name</label>
              <input type="text" name="lname" class="form-control" placeholder="Doe">
            </div>
            <div class="form-group">
              <label>Email Address</label>
              <input type="email" name="email1" id="email1" class="form-control" placeholder="john@doe.com">
            </div>
            <div class="form-group">
              <label>Confirm Email</label>
              <input type="email" name="email2" id="email2" class="form-control" placeholder="john@doe.com" required onBlur="validateEmail()">
            </div>
            <div class="form-group">
              <label">Password</label>
              <input type="password" name="password1" id="password1" class="form-control">
            </div>
            <div class="form-group">
              <label>Confirm Password</label>
              <input type="password" name="password2" id="password2" class="form-control" required onBlur="validatePassword()">
            </div>
            <div class="form-group">
              <label">User Type</label>
              <select class="form-control" name="usertype">
                <option>Admin</option>
                <option>Landlord</option>
                <option>Property Manager</option>
                <option>Maintenance</option>
              </select>
            </div>
            <fieldset class="form-group">
              <label>Gender</label>
              <div class="form-check">
                <label class="form-check-label">
                  <input type="radio" class="form-check-input" name="gender" value="Man" checked>
                  Male
                </label>
              </div>
              <div class="form-check">
              <label class="form-check-label">
                  <input type="radio" class="form-check-input" name="gender" value="Woman">
                  Female
                </label>
              </div>
              <div class="form-check">
              <label class="form-check-label">
                  <input type="radio" class="form-check-input" name="gender" value="Other">
                  Other
                </label>
              </div>
            </fieldset>
            <div class="form-check">
              <label class="form-check-label">
                  <input type="checkbox" class="form-check-input " name="notifications">
                Email Notifications
              </label>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </body>
</html>
