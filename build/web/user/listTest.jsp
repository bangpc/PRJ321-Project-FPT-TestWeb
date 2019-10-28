<%-- 
    Document   : listTest
    Created on : Oct 20, 2019, 4:12:19 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="navigationBar.jsp"/>
        <table>
            <tr>
                <th>Tetst Name</th>
            </tr>
            <c:forEach var="x" items="${testList}">
                <tr>
                    <td><a href="TestController?testID=${x.testID}&action=TestInfo">${x.testName}</a> </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
