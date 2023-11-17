<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
   
    
    <a href="EmprunteurManager" class="btn btn-success">gestion des Emprunteur</a>
    <a href="OuvrageManager" class="btn btn-success">gestion des Ouvrages</a>
    <a href="EmpruntManager" class="btn btn-success">gestion des Emprunt</a>
    <a href="ProlongeManager" class="btn btn-success">gestion des Prolanger</a>
    <a href="SanctionManager" class="btn btn-success">gestion des Sanction</a>
    
    
    
</div>
</body>
</html>
