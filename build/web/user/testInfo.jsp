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
        <jsp:include page="navigationBar.jsp"></jsp:include>
        <form action="QuestionController">
            <c:if test="${not empty TestInfo}">
                ${sessionScope.TestInfo.testID}
                ${sessionScope.TestInfo.testContent}
                <input type="submit" value="Show Question" name="action" />
            </c:if>
        </form>
        
    </body>
</html>
