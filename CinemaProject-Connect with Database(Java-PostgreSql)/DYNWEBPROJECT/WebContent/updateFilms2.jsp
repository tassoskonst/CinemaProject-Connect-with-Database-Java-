<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<form  method="post" action="LogoutServlet">
<br> <br>


<input type="submit"  value="Logout">
<br><br>
</form>
<div id="banner"><h1>This is ContentAdmin page for ${username} who is ContentAdmin</h1></div>
<tr>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/updateFilms.jsp">BACK</a>
<br><br>
</tr>
<%
String filmid = request.getParameter("filmid");
String driver = "org.postgresql.Driver";
String connectionUrl = "jdbc:postgresql://localhost:5432/";
String database = "CinameProject";
String userid = "postgres";
String password = "123456";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Films where filmId="+filmid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
<body>
<h1>Update data from database in jsp</h1>
<form method="post" action="updateFilms3.jsp">
<input type="hidden" name="filmid" value="<%=resultSet.getString("filmid") %>">
<input type="text" name="filmid" value="<%=resultSet.getString("filmid") %>">
<br>
filmtitle:<br>
<input type="text" name="filmtitle" value="<%=resultSet.getString("filmtitle") %>">
<br>
filmcategory:<br>
<input type="text" name="filmcategory" value="<%=resultSet.getString("filmcategory") %>">
<br>
filmdescription:<br>
<input type="text" name="filmdescription" value="<%=resultSet.getString("filmdescription") %>">

<input type="submit" value="submit">
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>