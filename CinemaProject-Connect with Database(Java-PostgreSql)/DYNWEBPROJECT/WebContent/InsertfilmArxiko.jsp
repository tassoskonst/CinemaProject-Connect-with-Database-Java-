<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>

<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>


<h2 > <p >This is ContentAdmin page for ${username} who is ContentAdmin</p> </h2>

<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/ContentAdmin.jsp">BACK</a>
<br><br>
<form method="post" action="Insertfilms.jsp">
filmid(Bigger than 25):<br>
<input type="text" name="filmid">
<br>
filmtitle:<br>
<input type="text" name="filmtitle">
<br>
filmcategory:<br>
<input type="text" name="filmcategory">
<br>
filmdescription:<br>
<input type="text" name="filmdescription">
<br><br>
<input type="submit" value="submit">
<br> <br> <br> 
<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>
</form>
</body>
</html>