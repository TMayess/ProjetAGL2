package servlets;

import jakarta.servlet.ServletException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import dao.EmprunteurDao;
import dao.OuvrageDao;
import models.Emprunteur;
import models.Ouvrage;


public class AddEmprunt extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AddEmprunt() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String IdEmprunteur = request.getParameter("IdEmprunteur");
        List<Ouvrage> ouvrages = OuvrageDao.getAllOuvrage();   
        Emprunteur emprunteur = new Emprunteur();
      
		emprunteur = EmprunteurDao.getEmprunteurById(IdEmprunteur);

        
        request.setAttribute("ouvrages", ouvrages);
        request.setAttribute("emprunteur", emprunteur);

        RequestDispatcher dispatcher = request.getRequestDispatcher("empruntOuvrage.jsp");
        dispatcher.forward(request, response);
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        List<Ouvrage> ouvrageSelectedList = (List<Ouvrage>) session.getAttribute("ouvrageSelectedList");

        if (ouvrageSelectedList == null) {
            ouvrageSelectedList = new ArrayList<>();
        }

        String IdEmprunteur = request.getParameter("IdEmprunteur");

        Emprunteur emprunteur = EmprunteurDao.getEmprunteurById(IdEmprunteur);

        List<Ouvrage> ouvrages = OuvrageDao.getAllOuvrage();

        String selectedOuvrageISBN = request.getParameter("selectedBookISBN");
        
        if (selectedOuvrageISBN != null && ouvrageSelectedList.size() < 3) {
            Ouvrage ouvrageSelected = OuvrageDao.getOuvrageById(selectedOuvrageISBN);

            
            boolean ouvrageExisteDeja = false;
            for (Ouvrage existingOuvrage : ouvrageSelectedList) {
                if (existingOuvrage.getISBN().equals(ouvrageSelected.getISBN())) {
                    ouvrageExisteDeja = true;
                    break;
                }
            }
            
            if (!ouvrageExisteDeja) {
                ouvrageSelectedList.add(ouvrageSelected);
                
                session.setAttribute("ouvrageSelectedList", ouvrageSelectedList);
            }
        }
        
        String isbnToRemove = request.getParameter("isbnToRemove");

	    if (ouvrageSelectedList != null && isbnToRemove != null) {

	        Ouvrage ouvrageToRemove = null;
	        for (Ouvrage existingOuvrage : ouvrageSelectedList) {
	            if (existingOuvrage.getISBN().equals(isbnToRemove)) {
	                ouvrageToRemove = existingOuvrage;
	                break;
	            }
	        }

	        
	        if (ouvrageToRemove != null) {
	            ouvrageSelectedList.remove(ouvrageToRemove);
	            session.setAttribute("ouvrageSelectedList", ouvrageSelectedList);
	        }
	    }
        
            
        request.setAttribute("ouvrages", ouvrages);
        request.setAttribute("emprunteur", emprunteur);

     
        RequestDispatcher dispatcher = request.getRequestDispatcher("empruntOuvrage.jsp");
        dispatcher.forward(request, response);
    }

}

