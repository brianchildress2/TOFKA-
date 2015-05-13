<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Page</title>
    </head>
    <body>
        <div id="bd">
            <h1>Sign Up for TOFKA</h1>
            <h2 class="flash">${flash}</h2>
            <form method="SIGNUP" action="welcome.jsp">
                <input type="hidden" name="action" value="signup"/>
                <table>
                    <tr>
                        <td><label class="formElement" for="firstname">First Name:</label></td>
                        <td><input class="formElement" type="text" name="firstname"/></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="lastname">Last Name:</label></td>
                        <td><input class="formElement" type="text" name="lastname"/></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="phonenumber">Phone Number:</label></td>
                        <td><input class="formElement" type="text" name="phonenumber"/></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="emailaddress">eMail Address:</label></td>
                        <td><input class="formElement" type="text" name="emailaddress"/></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="medicalhistory">Medical History:</label></td>
                        <td><textarea name="medicalhistory" rows="3" cols="80"></textarea></td>
                    </tr>
                    <tr>
                        <td><label class="formElement" for="joindate">Join Date:</label></td>
                        <td><input class="formElement" type="text" name="joindate"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input class="formElement" type="submit" value="Sign Me Up"/></td>
                    </tr>          
                </table>         
            </form>
            <a href="welcome.jsp?action=welcome">Take me Back to the Welcome page</a>
        </div>
    </body>
</html>
