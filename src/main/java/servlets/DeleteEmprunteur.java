package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.EmprunteurDao;



public class DeleteEmprunteur extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            String IdEmprunteur = request.getParameter("IdEmprunteur");

            boolean successDelete = EmprunteurDao.deleteEmprunteur(IdEmprunteur);
            if (successDelete) {
            	 response.sendRedirect("emprunteurManager");
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            String IdEmprunteur = request.getParameter("IdEmprunteur");

            boolean successDelete = EmprunteurDao.deleteEmprunteur(IdEmprunteur);
            if (successDelete) {
	        	 response.sendRedirect("emprunteurManager");
            }
            
            
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}

