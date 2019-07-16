<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>
        
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
response.setHeader("Pragma","no-cache"); //HTTP 1.0 
response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>

<%@page import="java.sql.*,java.util.*"%>

<%
String filmtitle=request.getParameter("filmtitle");


%>
 <h1>Epelekses tin tainia : <%=filmtitle%></h1>
 
 
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
<div id="banner"><h1>This is Client page for ${username} who is Client</h1></div>


<form method="post">
<br> <br>


<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>
</form>



<h2 align="center"><font><strong>Dates</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/Kratisi.jsp">BACK</a>
<br><br>
</tr>
<tr bgcolor="#A52A2A">
<td><b>film title</b></td>
<td><b>provolistartdate</b></td>
<td>provolienddate<b></b></td>
<td>cinemaNumberOfSeats<b></b></td>
<td>cinemaId<b></b></td>
<td>Enter date:<b></b></td>

<td>Enter number of seats:<b></b></td>

<td>make reservation:<b></b></td>
               


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select filmtitle,provoliStartDate,provoliEndDate,cinemaNumberOfSeats,cinemaId from  Provoles,Films,Cinema where  (provoles.provoliFilm=films.filmId) AND (provoles.provoliCinema=Cinema.cinemaId) AND (filmtitle='"+filmtitle+"');";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">
 
 <td><%=resultSet.getString("filmtitle") %></td>
<td><%=resultSet.getDate("provolistartdate") %></td>
<td><%=resultSet.getDate("provolienddate") %></td>
<td><%=resultSet.getInt("cinemaNumberOfSeats") %></td>
<td><%=resultSet.getInt("cinemaId") %></td>

<td><input type="date" name="start"  max="<%=resultSet.getDate("provolienddate") %>" min="<%=resultSet.getDate("provolistartdate")  %>"></td>



<td><input type="number" name="quantity" min="1" max="<%=resultSet.getInt("cinemaNumberOfSeats") %>"></td>


<form method="post" action="DateServlet">
<td> <input name="filmtitle" type="submit" value="<%=resultSet.getString("filmtitle") %>"></td>

</form>


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