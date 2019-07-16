<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "org.postgresql.Driver";%>
<%!String url = "jdbc:postgresql://localhost:5432/CinameProject";%>
<%!String user = "postgres";%>
<%!String psw = "123456";%>

<form  method="post" action="LogoutServlet">
<br> <br>


<input type="submit"  value="Logout">
<br><br>
</form>
<div id="banner"><h1>This is ContentAdmin page for ${username} who is ContentAdmin</h1></div>
<tr>
<br><br>
<a href="http://localhost:8080/DYNWEBPROJECT/updateFilms2.jsp">BACK</a>
<br><br>
</tr>
<%
String id = request.getParameter("filmid");
String filmtitle=request.getParameter("filmtitle");
String filmcategory=request.getParameter("filmcategory");
String filmdescription=request.getParameter("filmdescription");

if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update Films set filmId=?,filmTitle=?,filmCategory=?,filmdescription=? where filmId="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2, filmtitle);
ps.setString(3, filmcategory);
ps.setString(4, filmdescription);

int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully");
}
else
{
out.print("There is a problem in updating Record.");
} 
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>