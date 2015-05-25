<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>TOFKA LTC &raquo;</title>
        <link rel="stylesheet" type="text/css" href="graphics/main.css"/>
    </head>
    <body>
        <div id="bd">
            <h1>Welcome to TOFKA Long Term Care!</h1>
            <h2 class="flash">${flash}</h2>
            <p>${sessionScope.userid}
                <c:choose>
                    <c:when test="${sessionScope.user.username != null}">
                        <a class="nav" href="database.jsp">Hey, ${sessionScope.user.username}</a>
                        <a class="nav" href="logout.jsp">Logout of TOFKA</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav" href="login.jsp">Login</a>
                        <a class="nav" href="signup.jsp">Sign Up</a>
                    </c:otherwise>
                </c:choose>
            </p>
            <h2>Welcome to TOFKA</h2>
            <c:forEach var="signup" items="${signups}">
                <div class="signup">
                    <span class="signDate">(Signed up on ${signup.joindate})</span>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
