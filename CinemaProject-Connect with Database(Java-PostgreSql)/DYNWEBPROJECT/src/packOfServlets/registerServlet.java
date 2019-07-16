package packOfServlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.security.SecureRandom;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String user = request.getParameter("NameField");
		
		 SecureRandom random = new SecureRandom();
		byte bytes[]= new byte[20];
		 random.nextBytes(bytes);
		
		out.println("<html>" +
				"<head><title> Hello World Example with Post</title></head>" +
				"<h1> Hello " + Encryption.getHashMD5(user,random.toString()) + " coming from " + request.getRemoteHost() + ":" + request.getRemotePort() + "</h1>"
				//"<h1> Hello " + user + " coming from " + request.getRemoteHost() + ":" + request.getRemotePort() + "</h1>"
				+"</html>");
				
	}

}
