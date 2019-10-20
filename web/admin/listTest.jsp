<%-- 
    Document   : listTest
    Created on : Oct 20, 2019, 4:12:32 PM
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
            </tr>
            <c:forEach var="x" items="${testList}">
                <tr>
                    <td><a href="TestController?testID=${x.testID}">${x.testName}</a></td>
                    <td align="center">
                        <c:url var="delete" value="ClassController">
                            <c:param name="classID" value="${param.classID}"/>
                            <c:param name="testID" value="${x.testID}"/>
                            <c:param name="action" value="delete"/>
                        </c:url>
                        <a href="${delete}" onclick="return confirm('Ban co muon xoa?')">
                            <img src="media/delete.png"/> Delete
                        </a>
                    </td>
                    <td align="center">
                        <c:url var="edit" value="QuestionController">
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
