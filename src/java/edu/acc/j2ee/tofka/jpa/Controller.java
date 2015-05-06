package edu.acc.j2ee.tofka.jpa;

import java.io.IOException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Controller extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "welcome";
/*        String destination;
        switch (action) {
            default:
            case "signup":
                destination = signup(request);
                break;
            case "database":
                destination = database(request);
                break;
            case "login":
                destination = login(request);
                break;
            case "error":
                destination = exception(request);
                break;
        }
        request.getRequestDispatcher(destination +".jsp").forward(request, response);
*/    }
    
    private String welcome(HttpServletRequest request) throws ServletException {
        EntityManager em = getEM();
        try {
            List<User> users = em.createNamedQuery("User.findAll").getResultList();
            request.setAttribute("users", users);
        } catch (Exception e) {
            request.setAttribute("flash", e.getMessage());
        }
        return "welcome";
    }
    
    private String logout(HttpServletRequest request) throws ServletException {
        request.getSession().removeAttribute("user");
        return welcome(request);
    }
    
    private EntityManager getEM() {
        EntityManagerFactory emf = (EntityManagerFactory)getServletContext().getAttribute("emf");
        return emf.createEntityManager();
    }
}
