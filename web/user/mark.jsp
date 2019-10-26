<%-- 
    Document   : mark
    Created on : Oct 26, 2019, 9:51:49 AM
    Author     : BangPC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${not empty sessionScope.mark}">
            Your mark is
            ${sessionScope.mark}
            <a href="TestController?classID=${sessionScope.classID}">Go to class</a>
        </c:if>
    </body>
</html>
