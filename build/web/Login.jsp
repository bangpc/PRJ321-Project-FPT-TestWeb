<%-- 
    Document   : login
    Created on : Oct 19, 2019, 11:12:15 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="LoginController">
            <table>
                <tr><td>Username</td> <td><input type="text" name="username"/></td></tr>
                <tr><td>Password</td>  <td><input type="password" name="password" /></td></tr>        
            </table>
            <p><input type="submit" value="Login" name="submit" /></p>
        </form>
        If you do not have an account click <a href="register.jsp">here</a> to register
    </body>
</html>
