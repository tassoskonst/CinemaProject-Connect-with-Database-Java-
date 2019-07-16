<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>
<br><br>
<div id="banner"><h1>This is Admin page for ${username} who is Admin</h1></div>
<br><br>



<a href="http://localhost:8080/DYNWEBPROJECT/Admin.jsp">BACK</a>
<br><br>
<form method="post" action="createContAdmin2.jsp">
userid(Bigger than 18):<br>
<input type="text" name="userid">
<br>
name:<br>
<input type="text" name="name">
<br>
username:<br>
<input type="text" name="username">
<br>
password:<br>
<input type="password" name="password">
<br><br>
<input type="submit" value="submit">
<br> <br> <br> 
<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>
</body>
</html>