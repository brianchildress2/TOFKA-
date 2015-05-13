# TOFKA-
Long Term Care Website

Tasks:

1) Create a program

2) Create a project structure and project plan (Github README.md Notes)

3) Create a homepage (welcome.jsp)

4) Create a 2 databases:

    Database 1 - SIGNUPS
    * First Name
    * Last Name
    * Phone Number
    * Email Address
    * Medical History
    * Health Issues
    * Join Date
    * ID (hidden)
    
    Database 2 - USERS
    * Username
    * Password
    * ID (hidden)
    
5) Create a java object for accessing the customer's data
   * Create a class that can add information to the database
   * Create a class that can delete information from the database
   * Create a class to update the database

6) Create a Signup page for new customers
   * Add a createCustomer method in a Customer object and write it to the database.
   * On submit, the method makes sure the Signup fields are valid and use createCustomer to create a new customer

7) Create a Login page for administrators
   * Create a login that prompts for a username and password.
   * If the username and password are valid, allow access to the Database page using HTTPSession
   * On the Database page display a Logout button to logout of the session.
   * Require the user to be logged in to access the Database page.
   * If the administrator is not logged in, display the Error page.

8) Create a Database page presenting data entered from the Signup page.
   * When an Administrator is logged in add a Delete button. The Delete button will invoke the deleteCustomer method and          delete the Customer file.
   * Also when Administrator is logged in add a Update button. The Update button will invoke the updateDatabase method and        update the database.

9) Choose a CSS to make program look presentable (Bootstrap)

10) Deploy application on the web (Digital Ocean)



