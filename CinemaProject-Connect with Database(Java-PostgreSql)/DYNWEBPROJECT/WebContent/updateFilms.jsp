<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setHeader("Expires", "0"); //prevents caching at the proxy server   
%>

<%

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

<form  method="post" action="LogoutServlet">
<br> <br>


<input type="submit"  value="Logout">
<br><br>
</form>


<div id="banner"><h1>This is ContentAdmin page for ${username} who is ContentAdmin</h1></div>



<h2 align="center"><font><strong>Films</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/ContentAdmin.jsp">BACK</a>
<br><br>
</tr>
<tr bgcolor="#A52A2A">
<td><b>filmid</b></td>
<td>filmtitle<b></b></td>
<td><b>filmcategory</b></td>
<td><b>filmdescription</b></td>
<td><b>update</b></td>


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM films INNER JOIN Provoles ON films.filmId=Provoles.provolifilm;";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getInt("filmid") %></td>
<td><%=resultSet.getString("filmtitle") %></td>
<td><%=resultSet.getString("filmcategory") %></td>
<td><%=resultSet.getString("filmdescription") %></td>
<form method="post" action="updateFilms2.jsp">
<td> <input name="filmid" type="submit" value="<%=resultSet.getInt("filmid") %>"></td>


</tr>


<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
