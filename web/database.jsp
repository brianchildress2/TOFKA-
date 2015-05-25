<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<html>
    <head>
        <title>Database Page &raquo;</title>
        <link rel="stylesheet" type="text/css" href="graphics/main.css"/>
    </head>
    <body>
        <h1>Database Page</h1>
            <sql:query var="result" dataSource="jdbc/tofka">
                SELECT * FROM signups
            </sql:query>
        <table border="1">
            <!-- column headers -->
            <tr>
                <c:forEach var="columnName" items="${result.columnNames}">
                    <th><c:out value="${columnName}"/></th>
                </c:forEach>
            </tr>
            <!-- column data -->
            <c:forEach var="row" items="${result.rowsByIndex}">
                <tr>
                    <c:forEach var="column" items="${row}">
                        <td><c:out value="${column}"/></td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
        <br>
        <a class="nav" href="welcome?action=welcome">Take Me Back To The Welcome Page</a>
        <br>
        <a class="nav" href="welcome?action=logout">Log Me Out Of TOFKA</a>
    </body>
</html>
