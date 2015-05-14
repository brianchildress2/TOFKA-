package edu.acc.j2ee.tofka.jpa;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/welcome.jsp").forward(request, response);
        String action = request.getParameter("action");
        if (action == null) action = "welcome";
        String destination;
        switch (action) {
            default:
            case "welcome":
                destination = welcome(request);
                break;
            case "signup":
                destination = signup(request);
                break;
            case "database":
                destination = database(request);
                break;
            case "login":
                destination = login(request);
                break;
            case "logout":
                destination = logout(request);
                break;
        }
        request.getRequestDispatcher(destination +".jsp").forward(request, response);
    }
    
    private String welcome(HttpServletRequest request) throws ServletException {
        return "welcome";
    }
    
    private String signup(HttpServletRequest request) throws ServletException {
        Signup signup =(Signup)request.getSession().getAttribute("signup");
        if (request.getMethod().equals("GET")) return "database";
        String firstname = request.getParameter("firstname");
        if (firstname.length() < 1 || firstname.length() > 20) {
            request.setAttribute("flash", "Your first name must be between 1 and 20 characters.");
            return "signup";
        }
        String lastname = request.getParameter("lastname");
        if (lastname.length() < 1 || lastname.length() > 30) {
            request.setAttribute("flash", "Your last name must be between 1 and 30 characters.");
            return "signup";
        }
        String phonenumber = request.getParameter("phonenumber");
        if (phonenumber.length() == 10) {
            request.setAttribute("flash", "Your phone number must be only 10 numbers.");
            return "signup";
        }
        String emailaddress = request.getParameter("emailaddress");
        if (emailaddress.length() > 50) {
            request.setAttribute("flash", "Your email address must be less than 50 characters.");
            return "signup";
        }
        String medicalhistory = request.getParameter("medicalhistory");
        if (medicalhistory.length() > 1024) {
            request.setAttribute("flash", "Your medical history must be less than 1,024 characters.");
            return "signup";
        }
        String joindate = request.getParameter("joindate");
        if (joindate == null) {
            request.setAttribute("flash", "Please enter the date you joined TOFKA.");
            return "signup";
        }
        
//        Signup signup = new Signup(firstname, lastname, phonenumber, emailaddress, medicalhistory, joindate);
//        signup.setSignup(new Signup());
        
        EntityManager em = getEM();
        try {
            em.getTransaction().begin();
            em.persist(signup);
            em.merge(signup);
            em.getTransaction().commit();
            request.getSession().setAttribute("signup", signup);
            return welcome(request);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "signup";
        }
    }
    
    private String login(HttpServletRequest request) throws ServletException {
        User user =(User)request.getSession().getAttribute("user");
        if (user == null) {
            request.setAttribute("flash", "You are not logged in!");
            return "login";
        }
        if (request.getMethod().equals("GET")) return "login";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        EntityManager em = getEM();
        try {
            user = (User)em.createNamedQuery("User.findByUsername").setParameter("username", username).getSingleResult();
            if (!user.getPassword().equals(password)) throw new Exception("Access Denied");
            request.getSession().getAttribute("user");
            request.getSession().setAttribute("userid", user.getId());
            return welcome(request);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
            return "login";
        }
    }
    
    private String database(HttpServletRequest request) throws ServletException {
        User user = (User)request.getSession().getAttribute("user");
                if (user == null) {
                    request.setAttribute("flash", "You are not logged in!");
                    return "login";
                }
                if (request.getMethod().equals("GET")) return "database";
        Signup signup = (Signup)request.getSession().getAttribute("signup");
        EntityManager em = getEM();
        try {
            Query q = em.createQuery("SELECT s FROM Signup s WHERE s.id = :id ORDER BY s.joindate DESC");
            q.setParameter("id", signup.getId());
            List<Signup> signups = q.getResultList();
            request.setAttribute("signups", signups);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
        }
        return "database";
    }
    
    private String remove(HttpServletRequest request) throws ServletException {
        return "database";
    }
    
    private String update(HttpServletRequest request) throws ServletException {
        return "database";
    }
    
    private String logout(HttpServletRequest request) throws ServletException {
        request.getSession().removeAttribute("user");
        return welcome(request);
    }
    
    private EntityManager getEM() {
        EntityManagerFactory emf = (EntityManagerFactory)getServletContext().getAttribute("emf");
        return emf.createEntityManager();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
