<%-- 
    Document   : changeInfo
    Created on : Nov 3, 2019, 9:33:14 AM
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
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <form action="changeInfoController">
            <h1>Change Account Info</h1>
            <c:if test="${not empty error}">
                <p style="color: red">${error}</p>
            </c:if>
            <c:if test="${not empty message}">
                <p>${message}</p>
            </c:if>
            <c:if test="${not empty login}">
            
                <table>
                    <tr>
                        <th></th><th></th>
                    </tr>
                    <tr>
                        <td>User ID </td><td><input type="text" name="userid" value="${login.getUserID()}" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td>Username </td><td><input type="text" name="username" value="${login.getUsername()}"  /></td>
                    </tr>    
                    <tr>    
                        <td>Password </td><td><input type="password" name="password" value=""  /></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td><td><input type="password" name="repassword" value=""  /></td>
                    </tr>
                    <tr>
                        <td>Email</td><td><input type="text" name="email" value="${login.getEmail()}" /></td>
                    </tr>
                    <tr>
                        <td>Type</td><td><input type="text" name="type" value="user" /></td>
                    </tr>
                </table>
                <input type="submit" name="change" value="Change"/>
            </c:if>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
