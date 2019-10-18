<%-- 
    Document   : index
    Created on : Oct 18, 2019, 1:13:51 PM
    Author     : dell
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
        <form action="home">
        <a href="#">Login</a> 
        <a href="#">Register</a>
        <a href="#">Response</a>
        <a href="https://daihoc.fpt.edu.vn/">FPT Home Page</a><p>
        <table>
            <tr ><input type="text" name="SearchSubject"/>&nbsp;<button>Search</button></tr><tr></tr>
            <c:forEach var="x" items="${listSubject}">
            <td><a href="SubjectToTest?subjectID=${x.getSubjectID()}">${x.getSubjectName()}</a></td>
            </c:forEach>
        </table>
        </form>
        <h1>${tester}</h1>
    </body>
</html>
