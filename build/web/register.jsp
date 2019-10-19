<%-- 
    Document   : Register
    Created on : Oct 19, 2019, 7:23:12 AM
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
        <form action="RegisterFPT">
            <c:if test="${not empty errorRegister}">
                <p style="color: red">${errorRegister}</p>
            </c:if>
                
        <table >
            <tr>
                <th></th><th></th>
            </tr>
            
            <tr><td>User Name</td><td><input type="text" name="username"/></td></tr>
            <tr><td>Password</td><td><input type="password" name="password"/></td></tr>
                
        </table>
            <p><input type="submit" name="register">
            <p>If you have an account click <a href="#">here</a> to login
        </form>
    </body>
</html>
