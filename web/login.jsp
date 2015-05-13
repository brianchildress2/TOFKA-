<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TOFKA &raquo; Login</title>
    </head>
    <body>
        <div id="bd">
            <h1>Log In To Your TOFKA Account</h1>
            <h2 class="flash">${flash}</h2>
            <form method="SIGNUP" action="welcome.jsp">
                <input type="hidden" name="action" value="login"/>
                <table>
                    <tr>
                        <td><label class="formElement" for="username">User Name:</label></td>
                        <td><input class="formElement" type="text" name="username"/></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="password">Password:</label></td>
                        <td><input class="formElement" type="password" name="password"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input class="formElement" type="submit" value="Log Me In"/></td>
                    </tr>          
                </table>         
            </form>
            <a href="welcome.jsp?action=welcome">Take me Back to the Welcome page</a>
        </div>
    </body>
</html>
