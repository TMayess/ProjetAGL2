<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="models.Ouvrage" %>
<%@ page import="models.Emprunteur" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gestion des Emprunteurs</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
    <%@ include file="header.jsp" %>
    <div class="container">
    
    <%
        Emprunteur emprunteur = (Emprunteur) request.getAttribute("emprunteur") ;
        List<Ouvrage> ouvrageSelectedList = (List<Ouvrage>) session.getAttribute("ouvrageSelectedList");
    %>
	<h1>Emprunteur c'est :</h1>
	<ul>
	    <li>ID : <%= emprunteur.getIdEmprunteur() %></li>
	    <li>Nom : <%= emprunteur.getNom() %></li>
	    <li>Prénom : <%= emprunteur.getPrenom() %></li>
	    <li>Date de naissance : <%= emprunteur.getDateNaissance() %></li>
	    <li>Adresse : <%= emprunteur.getAdresse() %></li>
	    <li>Mobile : <%= emprunteur.getMobile() %></li>
	    <li>Email : <%= emprunteur.getEmail() %></li>
	</ul>
	
	<h1>Listes d'ouvrages disponibles</h1>
  <form id="searchForm" method="post">
    <input id="searchInput" name="searchInput" placeholder="Rechercher par ID...">
    <button type="submit">Rechercher</button>
	</form>
	
	
	    <table class="table table-bordered">
	        <tr>
	            <th>ID</th>
	            <th>Nom</th>
	            <th>Prénom</th>
	            <th>Date de Naissance</th>
	            <th>Adresse</th>
	            <th>Mobile</th>
	            <th>Email</th>
	            <th>Action</th>
	        </tr>
	        <%
	            List<Ouvrage> ouvrages = (List<Ouvrage>) request.getAttribute("ouvrages");
	            for (Ouvrage ouvrage : ouvrages) {
	        %>
	            <tr>
	                <td><%= ouvrage.getISBN() %></td>
	                <td><%= ouvrage.getTitre() %></td>
	                <td><%= ouvrage.getAnnee() %></td>
	                <td><%= ouvrage.getType() %></td>
	                <td><%= ouvrage.getEditeur() %></td>
	                <td><%= ouvrage.getNbExemplaire() %></td>
	                <td><%= ouvrage.getAuteur() %></td>
	               <td>
	              <form method="post">
                    <input type="hidden" class="selectedBookISBN" name="selectedBookISBN" value="<%= ouvrage.getISBN() %>">
                    <button type="submit">Ajouter au panier</button>
                </form>
                </td>
	            </tr>
	        <%
	            }
	        %>
	    </table>
	    
	    
		<table class="table table-bordered">
		    <tr>
		        <th>ID</th>
		        <th>Nom</th>
		        <th>Prénom</th>
		        <th>Date de Naissance</th>
		        <th>Adresse</th>
		        <th>Mobile</th>
		        <th>Email</th>
		        <th>Action</th>
		    </tr>
		    <%
		        if (ouvrageSelectedList != null) {
		            for (Ouvrage ouvrage : ouvrageSelectedList) {
		    %>
		    <tr>
		        <td><%= ouvrage.getISBN() %></td>
		        <td><%= ouvrage.getTitre() %></td>
		        <td><%= ouvrage.getAnnee() %></td>
		        <td><%= ouvrage.getType() %></td>
		        <td><%= ouvrage.getEditeur() %></td>
		        <td><%= ouvrage.getNbExemplaire() %></td>
		        <td><%= ouvrage.getAuteur() %></td>
		        <td>
		            <form method="post">
		                <input type="hidden" name="isbnToRemove" value="<%= ouvrage.getISBN() %>">
		                <button type="submit" class="btn btn-danger">Supprimer</button>
		            </form>
		        </td>
		    </tr>
		    
		    <%
		            }
		        }
		    %>
		</table>
     <form method="post" action="ValideEmprunt">
		<input type="hidden" class="IdEmprunteur" name="IdEmprunteur" value="<%= emprunteur.getIdEmprunteur() %>">
		<button type="submit">Valider l'emprunt</button>
	</form>
     
    </div>
</body>
</html>