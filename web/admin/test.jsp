<%-- 
    Document   : test
    Created on : Oct 19, 2019, 10:36:38 PM
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
        <table border="1">
            <tr>
                <th>Question</th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="x" items="${listQuestion}">
                <tr>
                    <td>${x.questionContent}
                        <p>A. ${x.opt1}</p>
                        <p>B. ${x.opt2}</p>
                        <p>C. ${x.opt3}</p>
                        <p>D. ${x.opt4}</p>
                        <p>Correct Answer: ${x.rightOption}</p>
                    </td>
                    <td align="center">
                        <c:url var="delete" value="TestController">
                            <c:param name="id" value="${param.id}"/>
                            <c:param name="questionID" value="${x.questionID}"/>
                            <c:param name="action" value="delete"/>
                        </c:url>
                        <a href="${delete}" onclick="return confirm('Ban co muon xoa?')">
                            <img src="media/delete.png"/> Delete
                        </a>
                    </td>
                    <td align="center">
                        <c:url var="edit" value="QuestionController">
                            <c:param name="testID" value="${param.id}"/>
                            <c:param name="questionID" value="${x.questionID}"/>
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
