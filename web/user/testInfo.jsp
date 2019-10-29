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
        <title>Test Info</title>
    </head>
    <style>
        .footer{
            position: absolute
        }
    </style>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <form action="QuestionController">
            <c:if test="${not empty TestInfo}">
                ${TestInfo.testID}
                ${TestInfo.testContent}
                <input type="submit" value="Show Question" name="action" />
            </c:if>
        </form>
        <div class="footer">
        <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
