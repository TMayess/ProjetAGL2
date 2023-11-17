<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
  <%@ page import="models.Emprunteur" %>
    <%@ page import="models.Emprunt" %>
  <%@ page import="java.util.List" %>
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
    
    <h2>Liste des Emprunts</h2>
	<table class="table table-bordered">
	    <thead>
	        <tr>
	            <th>IdEmprunt</th>
	            <th>IdEmprunteur</th>
	            <th>ISBN</th>
	            <th>IdBibliotecaire</th>
	            <th>DateEmprunt</th>
	            <th>DateRendre</th>
	            <th>Rendu</th>
	        </tr>
	    </thead>
	    <tbody>
	        <% 
	        List<Emprunt> emprunts = (List<Emprunt>) request.getAttribute("emprunts");
	
	        for (Emprunt emprunt : emprunts) { %>
	            <tr>
	                <td><%= emprunt.getIdEmprunt() %></td>
	                <td><%= emprunt.getIdEmprunteur() %></td>
	                <td><%= emprunt.getISBN() %></td>
	                <td><%= emprunt.getIdBibliotecaire() %></td>
	                <td><%= emprunt.getDateEmprunt() %></td>
	                <td><%= emprunt.getDateRendre() %></td>
	                <td><%= emprunt.isRendu() %></td>
	                <td>
	                <%
	                if ( !emprunt.isRendu())  {   
	                %>
	                
	                <form method="post" >
						<input type="hidden" class="rendreEmpruntId" name="rendreEmpruntId" value="<%= emprunt.getIdEmprunt() %>">
						<button type="submit">Rendre l'ouvrage</button>
					</form>
					<%
	                }
					%>
					</td>
	            </tr>
	        <% } %>
	    </tbody>
	</table>
    
    <h1>Liste emprunteur</h1>
    <form id="searchForm" method="post">
	    <input type="number" id="searchInput" name="searchInput" placeholder="Rechercher par ID..." >
	    <button type="submit">Rechercher</button>
	</form>
	<table class="table table-bordered">
	    <tr>
	    	<th>Id</th>
	        <th>Nom</th>
	        <th>Prénom</th>
	        <th>Date de Naissance</th>
	        <th>Adresse</th>
	        <th>Mobile</th>
	        <th>Email</th>
	    </tr>
	    <%
	        List<Emprunteur> emprunteurs = (List<Emprunteur>) request.getAttribute("emprunteurs");
	        for (Emprunteur emprunteur : emprunteurs) {
	    %>
	        <tr>
				<td><%= emprunteur.getIdEmprunteur() %></td>
	            <td><%= emprunteur.getNom() %></td>
	            <td><%= emprunteur.getPrenom() %></td>
	            <td><%= emprunteur.getDateNaissance() %></td>
	            <td><%= emprunteur.getAdresse() %></td>
	            <td><%= emprunteur.getMobile() %></td>
	            <td><%= emprunteur.getEmail() %></td>
	            <td><a href="AddEmprunt?IdEmprunteur=<%=emprunteur.getIdEmprunteur() %>" class="btn btn-primary">Emprunter</a></td>
	        </tr>
	    <%
	        }
	    %>
	</table>

    </div>
</body>
</html>