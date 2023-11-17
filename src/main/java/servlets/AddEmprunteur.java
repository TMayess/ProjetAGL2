package servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import dao.DaoException;
import dao.EmprunteurDao;


public class AddEmprunteur extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") != null) {
            String IdEmprunteur = request.getParameter("IdEmprunteur");
            String Nom = request.getParameter("Nom");
            String Prenom = request.getParameter("Prenom");
            String DateNaissance = request.getParameter("DateNaissance");
            String Adresse = request.getParameter("Adresse");
            String Mobile = request.getParameter("Mobile");
            String Email = request.getParameter("Email");

            boolean successAdd;
			try {
				successAdd = EmprunteurDao.AddEmprunteur(IdEmprunteur, Nom, Prenom, DateNaissance, Adresse, Mobile, Email);
				if (successAdd) {
		            	response.sendRedirect("emprunteurManager");
		            } 
			} catch (DaoException e) {
				String errorMessage = e.getMessage();
                request.setAttribute("errorMessage", errorMessage);
                RequestDispatcher dispatcher = request.getRequestDispatcher("addEmprunteur.jsp");
                dispatcher.forward(request, response);
            
			}
            
           
            
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}