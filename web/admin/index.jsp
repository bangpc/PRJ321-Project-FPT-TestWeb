<%-- 
    Document   : index
    Created on : Oct 19, 2019, 10:35:07 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Subject</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"/>
        <form action="SearchController">
            <input type="text" name="searchText"/>&nbsp;<button>Search</button>
        </form>
        <table>
            <c:forEach var="x" items="${listSubject}">
                <tr>
                    <td>
                        <a href="ClassController?subjectID=${x.getSubjectID()}">${x.getSubjectName()}</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
