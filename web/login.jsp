<%-- 
    Document   : Login
    Created on : Oct 18, 2019, 9:21:08 PM
    Author     : BangPC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Test FPT Website</h1>
        <c:if test="${not empty error}">
            <p style="color: red">${error}</p>
        </c:if>
        <form action="Login">
        <table>
            <tr>
                <th></th><th></th>
            </tr>
            <tr><td>User Name</td> <td><input type="text" name="userName" value="${userRegister}"/></td></tr>
            <tr><td>Password</td>  <td><input type="password" name="password" /></td></tr>        
        </table>
        <p><input type="submit" value="Login" name="Login" /></p>
        </form>
        If you do not have an account click <a href="#">here</a> to register
    </body>
</html>
