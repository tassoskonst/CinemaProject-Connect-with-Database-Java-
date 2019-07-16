<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*,java.util.*"%>

<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>


<h2 > <p >This is ContentAdmin page for ${username} who is ContentAdmin</p> </h2>


<form method="post">
<br> <br>


<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>
</form>


<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/InsertfilmArxiko.jsp">BACK</a>
<br><br>
<%
String filmid=request.getParameter("filmid");
String filmtitle=request.getParameter("filmtitle");
String filmcategory=request.getParameter("filmcategory");
String filmdescription=request.getParameter("filmdescription");

try
{
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CinameProject", "postgres", "123456");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into films(filmid,filmtitle,filmcategory,filmdescription)values('"+filmid+"','"+filmtitle+"','"+filmcategory+"','"+filmdescription+"')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>