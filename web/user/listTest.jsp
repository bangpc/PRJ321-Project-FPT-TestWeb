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
        <title>List Test</title>
    </head>
    <body>
        <jsp:include page="navigationBar.jsp"></jsp:include>
        <table>
            <tr>
                <th>Tetst Name</th>
            </tr>
            <c:forEach var="x" items="${testList}">
                <tr>
                    <td><a href="QuestionController?testID=${x.testID}">${x.testName}</a> </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
