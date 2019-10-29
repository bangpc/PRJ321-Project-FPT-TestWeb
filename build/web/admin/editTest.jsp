<%-- 
    Document   : editTest
    Created on : Oct 28, 2019, 3:22:58 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Test</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <form action="TestController">
            <table>
                <tr><td>Test name</td> <td><input type="text" name="testName" value="${TestInfo.testName}" /></td></tr>
                <tr><td>Question Content</td> <td><textarea name="testContent" rows="4" cols="40" >${TestInfo.testContent}</textarea></td></tr>
                <tr><td>Difficulty</td> <td><input type="text" name="difficulty" value="${TestInfo.difficulty}" /></td></tr>
            </table>
            <p><input type="submit" value="Save Info" name="action" /></p>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
