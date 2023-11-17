<%
String login = "";
 if(session.getAttribute("login")!=null){
	 login = session.getAttribute("login").toString();
 }else{
	 response.sendRedirect("home.jsp");
 }
%>

<div class="container text-right">
   <h1>Bonjour <%=login %></h1><br>
   <a href="home.jsp" class="btn btn-primary">Accueil</a>
   <a href="Logout" class="btn btn-danger">Déconnecter</a>
</div>