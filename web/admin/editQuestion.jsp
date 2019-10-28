<%-- 
    Document   : editQuestion
    Created on : Oct 25, 2019, 5:42:20 PM
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
        <jsp:include page="navigationBar.jsp"/>
        <form action="QuestionController">
            <table>
                <tr><td>Question Content</td> <td><textarea name="questionContent" rows="4" cols="40" >${question.questionContent}</textarea></td></tr>
                <tr><td>Option 1</td> <td><input type="text" name="opt1" value="${question.opt1}" /></td></tr>
                <tr><td>Option 2</td> <td><input type="text" name="opt2" value="${question.opt2}" /></td></tr>
                <tr><td>Option 3</td> <td><input type="text" name="opt3" value="${question.opt3}" /></td></tr>
                <tr><td>Option 4</td> <td><input type="text" name="opt4" value="${question.opt4}" /></td></tr>
                <tr><td>Right Option</td> <td><input type="text" name="rightOption" value="${question.rightOption}" /></td></tr>
            </table>
            <p><input type="submit" value="Edit Test" name="action" /></p>
        </form>
    </body>
</html>
