<%@ page language="java"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter un Étudiant</title>
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
    
    <h1 class="mt-4">Ajouter un Emprunteur</h1>

    <form method="POST" action="AddEmprunteur">
        <table class="table table-bordered">
            <tr>
                <td>IdEmprunteur</td>
                <td><input type="text" name="IdEmprunteur" class="form-control" required></td>
            </tr>
            <tr>
                <td>Nom</td>
                <td><input type="text" name="Nom" class="form-control" required></td>
            </tr>
            <tr>
                <td>Prenom</td>
                <td><input type="text" name="Prenom" class="form-control" required></td>
            </tr>
            <tr>
                <td>Date Naissance</td>
                <td><input type="date" name="DateNaissance" class="form-control" required></td>
            </tr>
            <tr>
                <td>Adresse</td>
                <td><input type="text" name="Adresse" class="form-control" required></td>
            </tr>
            <tr>
                <td>Mobile</td>
                <td><input type="tel" name="Mobile" class="form-control" required></td>
            </tr>
             <tr>
                <td>Email</td>
                <td><input type="email" name="Email" class="form-control" required></td>
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
