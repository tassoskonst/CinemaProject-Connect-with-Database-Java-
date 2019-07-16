<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<%@page import="java.sql.*,java.util.*"%>
<%@page import= "java.security.SecureRandom"%>
<%@page import="java.util.Random"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import ="java.security.NoSuchAlgorithmException"%>
<%@page import ="java.security.MessageDigest"%>
<%@page import ="java.security.NoSuchAlgorithmException"%>


<br><br>
<div id="banner"><h1>This is Admin page for ${username} who is Admin</h1></div>
<br><br>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/createContAdmnin.jsp">BACK</a>
<br><br>
<% response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); //HTTP 1.1 
 response.setHeader("Pragma","no-cache"); //HTTP 1.0 
 response.setHeader("Expires", "0"); //prevents caching at the proxy server  
%>
<form method="post" action="LogoutServlet">
<br> <br> <br> 
<input type="submit"  formaction="LogoutServlet"  value="Logout">
<br><br>

<%
String userid=request.getParameter("userid");
String name=request.getParameter("name");
String username=request.getParameter("username");
String password=request.getParameter("password");

try
{
Class.forName("org.postgresql.Driver");
Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CinameProject", "postgres", "123456");
Statement st=conn.createStatement();




String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
StringBuffer salt = new StringBuffer();
java.util.Random rnd = new java.util.Random();
 
while (salt.length() < 9)
{
int index = (int) (rnd.nextFloat() * SALTCHARS.length());
salt.append(SALTCHARS.substring(index, index+1));
}
 password=salt.toString();
session.setAttribute("ran",password);









int i=st.executeUpdate("insert into users(userid,name,username,password,usertype)values('"+userid+"','"+name+"','"+username+"','"+password+"','ContentAdmin')");
out.println("Data is successfully inserted!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>


