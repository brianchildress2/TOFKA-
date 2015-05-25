package edu.acc.j2ee.tofka.jpa;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.print("----------------------------------- CONTEXT INITIALIZED");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("TOFKAPU");
        sce.getServletContext().setAttribute("emf", emf);
    } 
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        EntityManagerFactory emf = (EntityManagerFactory)sce.getServletContext().getAttribute("emf");
        emf.close();
    }
}
