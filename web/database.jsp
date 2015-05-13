<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database Page for ${sessionScope.user.username}</title>
    </head>
    <body>
         <div id="bd">
            <h1>TOFKA's Database for ${user.username}</h1>
            <h2 class="flash">${flash}</h2>
            <form method="SIGNUP" action="welcome.jsp">
                <input type="hidden" name="action" value="database"/>
                <table>
                    <tr>
                        <div class="firstname">${signup.firstname}</div>
                        <div class="lastname">${signup.lastname}</div>
                        <div class="phonenumber">${signup.phonenumber}</div>
                        <div class="emailaddress">${signup.emailaddress}</div>
                        <div class="medicalhistory">${signup.medicalhistory}</div>
                        <div class="joindate">${signup.joindate}</div>
                        <c:if test="${sessionScope.user.id == user.id}">
                            <td colspan="2"><input class="formElement" type="submit" value="Remove a File"/></td>
                            <td colspan="2"><input class="formElement" type="submit" value="Update Database"/></td>
                            <td colspan="2"><input class="formElement" type="submit" value="Logout"/></td>
                        </c:if>
                    </tr>          
                </table>         
            </form>
            <a href="welcome.jsp?action=welcome">Take me back to the welcome page</a>
        </div>
    </body>
</html>
