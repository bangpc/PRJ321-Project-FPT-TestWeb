<%-- 
    Document   : testInfo
    Created on : Oct 27, 2019, 3:07:24 PM
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
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>

        <c:if test="${not empty TestInfo}">
            <form action="TestController">
                <p>
                    Test name: ${TestInfo.testName}
                    <br>Test Content: ${TestInfo.testContent}
                    <br>Difficulty: ${TestInfo.difficulty}
                    <br><input type="submit" value="Edit Info" name="action"/>
                </p>
            </form>
            <form action="QuestionController">
                <p>
                    <input type="submit" value="Show Question" name="action" />
                </p>
            </form>
        </c:if>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
