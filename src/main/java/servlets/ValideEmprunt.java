package servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Emprunteur;
import models.Ouvrage;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import dao.DaoException;
import dao.EmpruntDao;
import dao.OuvrageDao;

/**
 * Servlet implementation class ValideEmprunt
 */
public class ValideEmprunt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ValideEmprunt() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String idEmprunteur = request.getParameter("IdEmprunteur");
        System.out.println("IdEmprunteur: " + idEmprunteur);

        if (idEmprunteur != null && !idEmprunteur.isEmpty()) {
            try {
                int emprunteur = Integer.parseInt(idEmprunteur);

                List<Ouvrage> ouvrageList = (List<Ouvrage>) session.getAttribute("ouvrageSelectedList");

                LocalDate dateDebut = LocalDate.now();

                LocalDate dateFin = dateDebut.plusDays(14);


                Date dateDebutSql = Date.valueOf(dateDebut);
                Date dateFinSql = Date.valueOf(dateFin);

                for (Ouvrage ouvrage : ouvrageList) {
                    try {
                        EmpruntDao.AddEmprunt(emprunteur, ouvrage.getISBN(), dateDebutSql, dateFinSql);
                        OuvrageDao.decreaseNbExemplaire(ouvrage.getISBN());
                    } catch (DaoException e) {
                        e.printStackTrace();
                    }
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            session.removeAttribute("ouvrageSelectedList");
            response.sendRedirect("EmpruntManager");


        }
    }
}
