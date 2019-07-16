<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<br><br>
<h2 align="center"><font><strong>This is ContentAdmin page for ${username} who is ContentAdmin </strong></font></h2>
<br><br>
<h2 align="center"><font><strong>Films</strong></font></h2>
<br><br>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/ContentAdmin.jsp">BACK</a>
<br><br>
</tr>
<tr bgcolor="#A52A2A">
<td><b>filmid</b></td>
<td><b>filmtitle</b></td>
<td><b>filmcategory</b></td>
<td><b>filmdescription</b></td>
<td><b>provolistartdate</b></td>
<td><b>provolienddate</b></td>
<td><b>provoliisavailable</b></td>

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
<td><%=resultSet.getString("provolistartdate") %></td>
<td><%=resultSet.getString("provolienddate") %></td>
<td><%=resultSet.getBoolean("provoliisavailable") %></td>
<form method="post" >


</tr>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
<form>
<br> <br>


<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>
</form>