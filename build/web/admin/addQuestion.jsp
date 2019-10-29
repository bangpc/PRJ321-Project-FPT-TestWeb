<%-- 
    Document   : addQuestion
    Created on : Oct 24, 2019, 11:06:09 PM
    Author     : dell
--%>

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
        <form action="QuestionController">
            <table>
                <tr><td>Question Content</td> <td><textarea name="questionContent" rows="4" cols="40"></textarea></td></tr>
                <tr><td>Option 1</td> <td><input type="text" name="opt1" value="" /></td></tr>
                <tr><td>Option 2</td> <td><input type="text" name="opt2" value="" /></td></tr>
                <tr><td>Option 3</td> <td><input type="text" name="opt3" value="" /></td></tr>
                <tr><td>Option 4</td> <td><input type="text" name="opt4" value="" /></td></tr>
                <tr><td>Right Option</td> <td><input type="text" name="rightOption" value="" /></td></tr>
            </table>
            <p><input type="submit" value="Add Question" name="action" /></p>
        </form>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
