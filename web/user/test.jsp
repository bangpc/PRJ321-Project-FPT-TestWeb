<%-- 
    Document   : test
    Created on : Oct 19, 2019, 1:38:37 PM
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
            </tr>
            <c:forEach var="x" items="${listQuestion}">
                <tr>
                    <td>${x.questionContent}
                        <p>A. ${x.opt1}</p>
                        <p>B. ${x.opt2}</p>
                        <p>C. ${x.opt3}</p>
                        <p>D. ${x.opt4}</p>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
