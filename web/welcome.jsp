<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <title>TOFKA LTC &raquo;</title>
        <link rel="stylesheet" type="text/css" href="graphics/main.css"/>
    </head>
    <body>
        <div id="hd">
            <h1>Welcome to TOFKA Long Term Care!</h1>
        </div>
        <div id="bd">
            <img src="pics/TOFKA.jpg" alt="" />
            <br>
                <p> &nbsp; &nbsp; &nbsp; Our goal is to provide the best quality of life to your loved ones. We develop and individualize a plan that fits your loved ones needs. We
                provide 24 hour nursing to monitor our clients medical needs along with certified nursing assistance to help with bathing, dressing, and grooming.
                We provide meals, housekeeping, laundry, and transportation to local destinations for all of our residents onsite. Our mission and goal is to serve 
                your family members with the upmost dignity and respect. Please sign up using the Signup Link below.</p>
            <br>
                <c:choose>
                    <c:when test="${sessionScope.user.username != null}">
                        <a class="nav" href="database.jsp">Hey, ${sessionScope.user.username}</a>
                        <a class="nav" href="logout.jsp">Logout of TOFKA</a>
                    </c:when>
                    <c:otherwise>
                        <a class="nav" href="signup.jsp">Sign Up</a>
                        <a class="nav" href="login.jsp">Login</a>
                    </c:otherwise>
                </c:choose>
           </div>
            <div id="ft">
                <h2>TOFKA -- The Fun Place To Live</h2>
            </div>
    </body>
</html>
