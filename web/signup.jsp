<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<html>
    <head>
        <title>Sign Up Page &raquo;</title>
        <link rel="stylesheet" type="text/css" href="graphics/main.css"/> 
    </head>
    <body onload="displayResults()">
        <div id="hd">
        <h1>Sign Up for TOFKA</h1>
        </div>
        <div id="bd">
            <h2 class="flash">${flash}</h2>
            
            <%!
            public class Signup {
                String URL = "jdbc:derby://localhost:1527/tofka";
                String USERNAME = "javauser";
                String PASSWORD = "javauser";
                
                Connection connection = null;
                PreparedStatement insertSignups = null;
                ResultSet resultSet = null;
                
                public Signup() {
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
                    
                        insertSignups = connection.prepareStatement(
                        "INSERT INTO signups (firstname, lastname, phonenumber, emailaddress, medicalhistory, joindate)"
                                + " VALUES (?, ?, ?, ?, ?, ?)");
                                
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                
                public int setSignups (String firstname, String lastname, String phonenumber, String emailaddress, String medicalhistory, Timestamp joindate) {
                
                    int result = 0;
                    
                    try {
                        insertSignups.setString(1, firstname);
                        insertSignups.setString(2, lastname);
                        insertSignups.setString(3, phonenumber);
                        insertSignups.setString(4, emailaddress);
                        insertSignups.setString(5, medicalhistory);
                        insertSignups.setTimestamp(6, joindate);
                    
                        result = insertSignups.executeUpdate();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;
                }
            }
            %>
            <%
            int result = 0;
            
            if (request.getParameter("submit") != null) {
            
            String firstname = new String();
            String lastname = new String();
            String phonenumber = new String();
            String emailaddress = new String();
            String medicalhistory = new String();
            String id = new String();
            
            if (request.getParameter("firstname") != null) {
                firstname = request.getParameter("firstname");
            }
            
            if (request.getParameter("lasttname") != null) {
                lastname = request.getParameter("lastname");
            }
            
            if (request.getParameter("phonenumber") != null) {
                phonenumber = request.getParameter("phonenumber");
            }
            
            if (request.getParameter("emailaddress") != null) {
                emailaddress = request.getParameter("emailaddress");
            }
            
            if (request.getParameter("medicalhistory") != null) {
                medicalhistory = request.getParameter("medicalhistory");
            }
            
            Date date = new Date();
            Timestamp joindate = new Timestamp(date.getTime());
            
            Signup signup = new Signup();
            result = signup.setSignups(firstname, lastname, phonenumber, emailaddress, medicalhistory, joindate);
            }
            %>
            
            <form name="myForm" action="signup.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>First Name: </td>
                            <td><input type="text" name="firstname" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Last Name: </td>
                            <td><input type="text" name="lastname" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Phone Number: </td>
                            <td><input type="text" name="phonenumber" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>eMail Address: </td>
                            <td><input type="text" name="emailaddress" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Medical History: </td>
                            <td><input type="text" name="medicalhistory" value="" size="50" /></td>
                        </tr>
                    </tbody>
                </table>
                <input type="hidden" name="hidden" value="<%= result %>" />
                <input type="reset" value="Clear" name="clear" />
                <input type="submit" value="Submit" name="submit" />
                </form>
                <br>
                <a href="/TOFKA/welcome.jsp?action=welcome">Take Me Back The Welcome Page</a>
                <br>
        </div>
        <div id="ft">
            <h2>TOFKA -- The Mature Place To Live</h2>
        </div>        
    </body>
</html>
