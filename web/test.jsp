<%-- 
    Document   : Test
    Created on : Oct 18, 2019, 8:33:39 PM
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
        <table>
            <tr>
                <th>Test Name</th>
            </tr>
            <c:forEach var="x" items="${testList}">
                <td><a href="Question?testID=${x.testID}">${x.testName}</td>
            </c:forEach>
        </table>
    </body>
</html>
