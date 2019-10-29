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
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"></jsp:include>
        
        <form action="LoginController">
            <table>
                <tr><td>Username</td> <td><input type="text" name="username"/></td></tr>
                <tr><td>Password</td>  <td><input type="password" name="password" /></td></tr>        
            </table>
            <p><input type="submit" value="Login" name="submit" /></p>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
