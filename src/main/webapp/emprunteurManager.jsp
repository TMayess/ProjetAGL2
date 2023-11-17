<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="models.Emprunteur" %>
  <%@ page import="java.util.List" %>
   <%@ page import="java.sql.*"%>
   
    


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
 
    
    <h1 class="mt-4">Liste des Emprunteurs</h1>
   
    
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
				<td><%= emprunteur.getIdEmprunteur()%></td>
	            <td><%= emprunteur.getNom() %></td>
	            <td><%= emprunteur.getPrenom() %></td>
	            <td><%= emprunteur.getDateNaissance() %></td>
	            <td><%= emprunteur.getAdresse() %></td>
	            <td><%= emprunteur.getMobile() %></td>
	            <td><%= emprunteur.getEmail() %></td>
	          	<td><a href="DeleteEmprunteur?IdEmprunteur=<%=emprunteur.getIdEmprunteur() %>" class="btn btn-danger">Supprimer</a></td>
	        </tr>
	    <%
	        }
	    %>
	</table>
    
    <a href="addEmprunteur.jsp" class="btn btn-success">Ajouter un Emprunteur</a>
    
    
    
</div>
</body>
</html>
