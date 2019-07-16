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

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>


<%
String id = request.getParameter("filmid");
String driverName = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://localhost:5432/";
String dbName = "CinameProject";
String userId = "postgres";
String password = "123456";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<form method="post">
<br> <br>


<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>
</form>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/ContentAdmin.jsp">BACK</a>
<br><br>
<h2 class="mycolor"> <p id="films">This is ContentAdmin page for ${username} who is ContentAdmin</p> </h2>
<br><br>
<h2 align="center"><font><strong>Assign Film And Date To Cinema</strong></font></h2>



<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>provolicinema</b></td>
<td><b>provolistartdate</b></td>
<td><b>filmtitle</b></td>


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select provoliCInema,provoliStartDate,filmtitle from  Provoles,Films where  (provoles.provoliFilm=films.filmid);";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getInt("provolicinema") %></td>
<td><%=resultSet.getDate("provolistartdate") %></td>
<td><%=resultSet.getString("filmtitle") %></td>



</tr>


<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


</body>
</html>
