<%
    session.removeAttribute("user");
    session.invalidate();
    response.sendRedirect("welcome.jsp");
%>

