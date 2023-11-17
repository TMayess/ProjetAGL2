<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ page import="models.Ouvrage" %>
  <%@ page import="java.util.List" %>
   <%@ page import="java.sql.*"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Gestion des Ouvrages</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">

</head>
<body>
   <%@ include file="header.jsp" %>
<div class="container">
 
    <h1 class="mt-4">Liste des Ouvrages</h1>

    	  <form id="searchForm" method="post">
	    <input id="searchInput" name="searchInput" placeholder="Rechercher par ID...">
	    <button type="submit">Rechercher</button>
		</form>
		
		<form id="selectedBooksForm" method="post">
		    <table class="table table-bordered">
		        <tr>
		            <th>ID</th>
		            <th>Nom</th>
		            <th>Prénom</th>
		            <th>Date de Naissance</th>
		            <th>Adresse</th>
		            <th>Mobile</th>
		            <th>Email</th>
		            <th>Sélectionner</th>
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
		                <td><a href="DeleteOuvrage?ISBN=<%= ouvrage.getISBN() %>" class="btn btn-danger">Supprimer</a></td>
		            </tr>
		        <%
		            }
		        %>
		    </table>
    
    <a href="addOuvrage.jsp" class="btn btn-success">Ajouter un Ouvrage</a>
    </form>
    

    
    
    
</div>
</body>
</html>

</body>
</html>