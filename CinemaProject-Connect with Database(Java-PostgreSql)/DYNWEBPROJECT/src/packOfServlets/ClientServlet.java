package packOfServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet(description = "thisIsClient", urlPatterns = { "/ClientServlet" })
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		
		response.setContentType("text.html");
		PrintWriter wr = response.getWriter();
		String username=request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username);
		
		
		Connection c = null;
        PreparedStatement prepared_stmt= null;
        
		try {
			 
			   // Provide database Driver according to your database
			   Class.forName("org.postgresql.Driver");
			   
			   // Provide URL, database and credentials according to your database 
			   Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/CinameProject", "postgres", "123456");
			   System.out.println("Connected!");
			   
			   Statement stmt = con.createStatement();
			   ResultSet rs=stmt.executeQuery("SELECT * FROM users");
	            
			   boolean found = false;
			   while(rs.next() && found == false ) {
				   
	            	
				   if(rs.getString(3).equals(username) && rs.getString(4).equals(password) && rs.getString(5).equals("Customer")) {
					   found=true;
					   System.out.println("Succesfull login.");
					   request.getSession().setAttribute("username", username);
					   
					   
					   request.getSession().setAttribute("username",username);//to session apothikeyte
						request.getRequestDispatcher("Client.jsp").forward(request, response);//to session paei
						request.getRequestDispatcher("Kratisi.jsp").forward(request, response);//to session paei
						request.getRequestDispatcher("Kratisi2.jsp").forward(request, response);//to session paei
						request.getRequestDispatcher("Kratisi3.jsp").forward(request, response);//to session paei
						request.getRequestDispatcher("HistoryRes.jsp").forward(request, response);//to session paei

					   
					   
					   response.sendRedirect("Client.jsp");
				   
				   
				   }
			   }
			  if(found==false) {
				  response.sendRedirect("index.html");  
			  }
		
		}catch(Exception ex) {
			System.out.println(ex.getMessage());
		}
		
	}

}
