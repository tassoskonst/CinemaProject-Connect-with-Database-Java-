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
<%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>


<%
String filmtitle2=request.getParameter("filmtitle");



Object strtDate = session.getAttribute("start");
String startDate=strtDate.toString();
		
		

SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy"); // New Pattern
java.util.Date date = sdf1.parse(startDate); // Returns a Date format object with the pattern
System.out.println(date); 
		
int nos = Integer.parseInt(request.getParameter("result"));

%>
 <h1>Epelekses tin tainia : <%=filmtitle2%></h1>
 
 
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>

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
Statement statement2 = null;
ResultSet resultSet = null;
ResultSet resultSet2 = null;
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
<a href="http://localhost:8080/DYNWEBPROJECT/Kratisi2.jsp">BACK</a>
<br><br>
</tr>
<tr bgcolor="#A52A2A">

               


</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();

//request.getParameter("idTermin");
//request.getParameter("idTermin2");
Object username=session.getAttribute("username");//PAIRNO OS ANTIKEIMENO TO USERNAME
String s=username.toString();//KANO TO ANTIKEIMENO STRING


//String date2 =request.getParameter("idTermin").toString();
//SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
//java.util.Date date = dt.parse(date2);
//java.sql.Date sqlDate_updated = new java.sql.Date(date.getTime());
//System.out.println(sqlDate_updated);


//String numSeats =request.getParameter("idTermin2").toString();
//int no = Integer.parseInt(request.getParameter("idTermin2"));

System.out.println(date);
System.out.println(nos);



String sql ="INSERT INTO Transactions(userId, provoliId) SELECT userId, provoliId FROM Users,Provoles WHERE username='"+s+"' AND (provoliFilm IN (SELECT filmId FROM Films WHERE filmTitle='"+filmtitle2+"'));  ";
String sql3 =" INSERT INTO Transactions(selecteddate) VALUES ('"+date+"');";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
	out.println("Data is successfully inserted! 1 ");
	resultSet = statement.executeQuery(sql3);
	out.println("Data is successfully inserted! 2 ");
	while(resultSet.next()){
	

		String sql2 ="UPDATE Provoles SET provoliNOR = (provoliNOR -'"+nos+"') WHERE (provoliFilm IN (SELECT filmId FROM Films WHERE filmTitle='"+filmtitle2+"'))";
		resultSet = statement.executeQuery(sql2);
		out.println("Data is successfully update! 3 ");
	
%>
<tr bgcolor="#DEB887">


<form method="post" >


</tr>

<% 
	}
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>



</body>
</html>