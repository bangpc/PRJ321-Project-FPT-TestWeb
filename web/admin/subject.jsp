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
        <table border="1" cellspacing="0">
            <tr>
                <th>Test Name</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="x" items="${testList}">
                <tr>
                    <td>${x.testName}</td>
                    <td align="center">
                        <c:url var="delete" value="SubjectController">
                            <c:param name="id" value="${param.id}"/>
                            <c:param name="testID" value="${x.testID}"/>
                            <c:param name="action" value="delete"/>
                        </c:url>
                        <a href="${delete}" onclick="return confirm('Ban co muon xoa?')">
                            <img src="media/delete.png"/> Delete
                        </a>
                    </td>
                    <td align="center">
                        <c:url var="edit" value="TestController">
                            <c:param name="subjectID" value="${param.id}"/>
                            <c:param name="testID" value="${x.testID}"/>
                            <c:param name="action" value="edit"/>
                        </c:url>
                        <a href="${edit}" onclick="return confirm('Ban co muon sua?')">
                            <img src="media/edit.png"/> Edit
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
