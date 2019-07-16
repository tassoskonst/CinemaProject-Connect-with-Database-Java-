<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content Admins </title>
<link rel="stylesheet" type="text/css" href="mystyle.css" >
</head>
<body  style="background-color:#99ccff;color:black;margin:  100px  150px  100px 80px;">


<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>


<br><br>
<h2 class="mycolor"> <p id="films">This is ContentAdmin page for ${username} who is ContentAdmin</p> </h2>
<br><br>
<h2 class="mycolor"> <p id="films"> Available Films </p> </h2>
<p class="p" > </p> 
<form action="Showfilms.jsp" method="post">
<input type="submit"  value="ViewFilms"><br><br>



<br> <br> <hr style="text-align: right;height:4px;width:500;"> </p> 
<h2 class="mycolor"><p id="insert"> Insert New Film </p> </h2>
<h3> <em> </em> </h3>
<input type="submit"  formaction="InsertfilmArxiko.jsp" value="InserFilms"><br><br><br><br>


<h2 class="mycolor"><p id="update"> upadte Films </p> </h2>
<h3> <em> </em> </h3>
<input type="submit"  formaction="updateFilms.jsp" value="updateFilms"><br><br><br><br>

			
			

<hr style="text-align: right;height:4px;width:500;"> <br> 
<h2 class="mycolor"> <p id="assign"> Assign Film And Date To Cinema </p> </h2>
<input type="submit"  formaction="ShowfilmsAndDateAndAithousa.jsp" value="View film title, film's date and film's room">
<br> <br> 
<br> <br> <br> 
<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>

</body>
</html>