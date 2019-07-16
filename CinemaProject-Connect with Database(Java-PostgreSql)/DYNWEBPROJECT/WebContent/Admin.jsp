<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style2.css">
<meta charset="UTF-8">
<title>Admim page</title>
</head>
<body>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>
<br> <br> 
<div id="banner"><h1>This is Admin page for ${username} who is Admin</h1></div>



<br> <br> <br> 
<a href="http://localhost:8080/DYNWEBPROJECT/index.html">BACK</a>

<br><br>
<h2 class="mycolor"> <p id="films"> Create Content Admin </p> </h2>
<p class="p" > </p> 
<form action="createContAdmnin.jsp" method="post">
<input type="submit"  value="Create Content Admin"><br><br>

<h2 class="mycolor"> <p id="films"> Delete Content Admin </p> </h2>
<p class="p" > </p> 

<input type="submit" formaction="deleteContAdmin.jsp"  value="Delete Content Admin"><br><br>
<br> <br> <br> 
<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>
</body>
</html>