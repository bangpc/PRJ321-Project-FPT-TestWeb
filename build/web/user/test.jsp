<%-- 
    Document   : test
    Created on : Oct 19, 2019, 1:38:37 PM
    Author     : dell
--%>

<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <jsp:include page="navigationBar.jsp"></jsp:include>
        <c:if test="${not empty listQuestion}">
            <form action="DoTestController">
                <table border="1">
                    <tr>
                        <th>Question</th>
                    </tr>
                    <c:forEach var="x" items="${listQuestion}">

                        <tr>
                            <td>${x.questionContent}
                                <p><input type="radio" name="${x.questionID}" value="1">A. ${x.opt1}</p>
                                <p><input type="radio" name="${x.questionID}" value="2">B. ${x.opt2}</p>
                                <p><input type="radio" name="${x.questionID}" value="3">C. ${x.opt3}</p>
                                <p><input type="radio" name="${x.questionID}" value="4">D. ${x.opt4}</p>
                            </td>
                        </tr>
                    </c:forEach>

                </table>
                <input type="submit" value="Submit" name="submit" />
            </form>
        </c:if>
        
    </body>
</html>
