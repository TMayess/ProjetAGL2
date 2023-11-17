<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Ouvrage</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
	
<%
    String errorMessage = (String) request.getAttribute("errorMessage");
%>

<%
    if (errorMessage != null && !errorMessage.isEmpty()) {
%>
        <div class="alert alert-danger" role="alert">
            <%= errorMessage %>
        </div>
<%
    }
%>
    
    <h1 class="mt-4">Ajouter un Ouvrage</h1>

    <form method="POST" action="AjouterOuvrage">
        <table class="table table-bordered">
            <tr>
                <td>ISBN</td>
                <td><input type="text" name="ISBN" class="form-control" required></td>
            </tr>
            <tr>
                <td>Titre</td>
                <td><input type="text" name="Titre" class="form-control" required></td>
            </tr>
            <tr>
                <td>Année</td>
                <td><input type="text" name="Année" class="form-control" required></td>
            </tr>
            <tr>
                <td>Type</td>
                <td><input type="text" name="Type" class="form-control" required></td>
            </tr>
            <tr>
                <td>Editeur	</td>
                <td><input type="text" name="Editeur" class="form-control" required></td>
            </tr>
            <tr>
                <td>Auteur</td>
                <td><input type="text" name="Auteur" class="form-control" required></td>
            </tr>
             <tr>
                <td>nombre d'exemplaire</td>
                <td><input type="text" name="nbExemplaire" class="form-control" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Ajouter" class="btn btn-success">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
