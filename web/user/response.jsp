<%-- 
    Document   : response
    Created on : Nov 3, 2019, 9:47:51 PM
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
        <form action="ResponseController">
            <table>
                <tr><td>Title</td> <td><input type="text" name="title" value="" /></td></tr>
                <tr><td>Response Content</td> <td><textarea name="responseContent" rows="4" cols="40" ></textarea></td></tr>
            </table>
            <p><input type="submit" value="Send Response" name="action" /></p>
        </form>
    </body>
</html>
