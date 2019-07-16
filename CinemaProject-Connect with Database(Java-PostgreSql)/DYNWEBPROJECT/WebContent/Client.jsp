<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style2.css">
<meta charset="UTF-8">
<title>Client page</title>
</head>
<body>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>

<div id="banner"><h1>This is Client page for ${username} who is Client</h1></div>


<h2 class="mycolor"> <p id="films"> Available Films </p> </h2>
<p class="p" > </p> 
<form action="Kratisi.jsp" method="post">
<input type="submit"  value="ViewFilms and make reservation"><br><br>


<br><br> <br> 
<h2 class="mycolor"> <p> History of ${username}'s reservations </p> </h2>
<input type="submit"  formaction="HistoryRes.jsp"  value="see them">


<br> <br> <br> 
<input type="submit"  formaction="LogoutServlet"  value="Logout"><br><br><br><br>



</body>
</html>