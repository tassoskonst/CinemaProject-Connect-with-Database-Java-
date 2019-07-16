<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<br> <br> 
<% 
 response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>
<br> <br> 


<div id="banner"><h1>This is Admin page for ${username} who is Admin</h1></div>




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
<h2 align="center"><font><strong>Delete Content Admin</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/Admin.jsp">BACK</a>
<br><br>
</tr>
<tr bgcolor="#A52A2A">
<td><b>userid</b></td>
<td>name<b></b></td>
<td><b>username</b></td>
<td><b>password</b></td>
<td><b>usertype</b></td>
<td><b>Delete</b></td>


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM users;";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getInt("userid") %></td>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("username") %></td>
<td><%=resultSet.getString("password") %></td>
<td><%=resultSet.getString("usertype") %></td>
<form method="post" action="deleteContAdmin2.jsp">
<td> <input name="userid" type="submit" value="<%=resultSet.getInt("userid") %>"></td>


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