<%-- 
    Document   : Question
    Created on : Oct 18, 2019, 9:00:47 PM
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
                <th>Question</th>
            </tr>
        <c:forEach var="x" items="${listQuestion}">
            <td>${x.questionContent}
                <p>A. ${x.opt1}</p>
                <p>B. ${x.opt2}</p>
                <p>C. ${x.opt3}</p>
                <p>D. ${x.opt4}</p>
            </td>
        </c:forEach>
        </table>
    </body>
</html>
