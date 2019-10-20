<%-- 
    Document   : subject
    Created on : Oct 19, 2019, 1:22:53 PM
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
        <table>
            <tr>
                <th>Class Name</th>
            </tr>
            <c:forEach var="x" items="${classList}">
                <tr>
                    <td><a href="ClassController?classID=${x.classID}">${x.className}</a></td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
