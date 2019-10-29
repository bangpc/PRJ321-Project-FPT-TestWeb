<%-- 
    Document   : login
    Created on : Oct 19, 2019, 11:12:15 AM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%--    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
        </head>
        <style>
            .footer{
                position: absolute
            }
        </style>
        <body>
            <jsp:include page="header.jsp"/>
            <jsp:include page="navigationBar.jsp"></jsp:include>
            
            <form action="LoginController">
                <table>
                    <tr><td>Username</td> <td><input type="text" name="username"/></td></tr>
                    <tr><td>Password</td>  <td><input type="password" name="password" /></td></tr>        
                </table>
                <p><input type="submit" value="Login" name="submit" /></p>
            </form>
            <div class="footer">
            <jsp:include page="footer.jsp"/>
            </div>
        </body>--%>

    <head>
        <title>Login</title>
        <!-- Include CSS File Here -->
        <link rel="stylesheet" href="css/login.css"/>
    </head>
    <body>
        <style>
            .footer{
                position: absolute
            }
            .form{
                align-items: center
            }
            .button3 {
                width: 313px;
                height: 40px;
                font-size: 16px;
                border-radius: 3px;
            }
        </style>
        <jsp:include page="header.jsp"/>
        <jsp:include page="navigationBar.jsp"></jsp:include>
        <div class="form">
        <div class="container">
            <div style="width:300px; margin:0 auto;">
                <h2>FPT Test Website</h2>
                <form id="form_id" method="post" name="myform" action="LoginController">
                    <p><label>User Name :</label>
                    <input type="text" name="username"/>
                    <label>Password :</label>
                    <input type="password" name="password"/>
                    <p><input type="submit" class="button3" value="Login" name="submit"/>
                </form>
                
            </div>
        </div>
            
        </div>
        
                        
                    
        <div class="footer">
            <jsp:include page="footer.jsp"/>
        </div>
    </body>

</html>
