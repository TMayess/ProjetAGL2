<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="models.Emprunt" %>
<%@ page import="models.Emprunteur" %>
<%@ page import="java.util.Map.Entry" %>
                     
<%@ page import="java.util.List" %>
           
    
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
   


<h2>Liste des Emprunts</h2>
<table class="table table-bordered">
    <thead>
        <tr>
            <th>IdEmprunt</th>
            <th>IdEmprunteur</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>ISBN</th>
            <th>IdBibliotecaire</th>
            <th>DateEmprunt</th>
            <th>DateRendre</th>
            <th>Rendu</th>
        </tr>
    </thead>
    <tbody>
        <% 
        List<Entry<Emprunt, Emprunteur>> empruntEmprunteurPairs = (List<Entry<Emprunt, Emprunteur>>) request.getAttribute("emprunts");

        for (Entry<Emprunt, Emprunteur> entry : empruntEmprunteurPairs) {
            Emprunt emprunt = entry.getKey();
            Emprunteur emprunteur = entry.getValue();
        %>
            <tr>
                <td><%= emprunt.getIdEmprunt() %></td>
                <td><%= emprunt.getIdEmprunteur() %></td>
                <td><%= emprunteur.getNom() %></td>
				<td><%= emprunteur.getPrenom() %></td>
                
                <td><%= emprunt.getISBN() %></td>
                <td><%= emprunt.getIdBibliotecaire() %></td>
                <td><%= emprunt.getDateEmprunt() %></td>
                <td><%= emprunt.getDateRendre() %></td>
                <td><%= emprunt.isRendu() %></td>
                <td>
                    <form method="post">
                        <input type="hidden" name="sanctionId" value="<%= emprunt.getIdEmprunteur() %>">
                        <button type="submit">Sanctionner</button>
                    </form>
                </td>
            </tr>
        <% } %>
    </tbody>
</table>
</div>
</body>
</html>