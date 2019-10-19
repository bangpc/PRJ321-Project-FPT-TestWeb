<%-- 
    Document   : register
    Created on : Oct 19, 2019, 11:35:04 AM
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
        <jsp:include page="navigationBar.jsp"></jsp:include>
        <form action="RegisterController">
            <c:if test="${not empty errorRegister}">
                <p style="color: red">${errorRegister}</p>
            </c:if>
            <table>
                <tr><td>Email</td><td><input type="text" name="email"/></td></tr>
                <tr><td>Username</td><td><input type="text" name="username"/></td></tr>
                <tr><td>Password</td><td><input type="password" name="password"/></td></tr>
            </table>
            <p><input type="submit" name="submit" value="Register"/></p>
            <p>If you have an account click <a href="login.jsp">here</a> to login
        </form>
    </body>
</html>
