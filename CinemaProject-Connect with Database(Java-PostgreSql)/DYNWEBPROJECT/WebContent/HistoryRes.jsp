<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>



<form method="post" action="LogoutServlet" >
<input type="submit"    value="Logout">
<br><br>
</form>

<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/Client.jsp">BACK</a>
<br><br>

<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
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
<br><br>
<h2 align="center"><font><strong>This is ContentAdmin page for ${username} who is ContentAdmin </strong></font></h2>
<br><br>
<h2 align="center"><font><strong>History of reservations</strong></font></h2>
<br><br>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>filmtitle</b></td>
<td><b>provoli start date</b></td>
<td><b>provoli end date</b></td>
<td><b>provoli Number of Reservations</b></td>
<td><b>cinema ID</b></td>
<td><b>cinema is 3D</b></td>

</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
Object username=session.getAttribute("username");//PAIRNO OS ANTIKEIMENO TO USERNAME
String s=username.toString();//KANO TO ANTIKEIMENO STRING
System.out.println(s);
String sqlo ="SELECT filmTitle,provoliStartDate,provoliEndDate,provoliNOR,cinemaId,cinemaIs3D FROM Users,Transactions,Provoles,Films,Cinema WHERE (Transactions.userId=Users.userId) AND (Transactions.provoliId=Provoles.provoliID) AND (provoles.provoliFilm=films.filmId) AND (provoles.provoliCinema=Cinema.cinemaId) AND (username='"+s+"');";

resultSet = statement.executeQuery(sqlo);
while(resultSet.next()){
	System.out.println("mpike");
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("filmTitle") %></td>
<td><%=resultSet.getDate("provoliStartDate") %></td>
<td><%=resultSet.getDate("provoliEndDate") %></td>
<td><%=resultSet.getInt("provoliNOR") %></td>
<td><%=resultSet.getInt("cinemaId") %></td>
<td><%=resultSet.getBoolean("cinemaIs3D") %></td>



</tr>

<% 
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
