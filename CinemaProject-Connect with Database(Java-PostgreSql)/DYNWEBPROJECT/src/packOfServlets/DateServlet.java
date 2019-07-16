package packOfServlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class DateServlet
 */
@WebServlet("/DateServlet")
public class DateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DateServlet() {
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
		response.setContentType("text.html");
		PrintWriter wr = response.getWriter();
		java.util.Date date01=null;
		try {
			date01 = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("start"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		String n1=request.getParameter("quantity");

		 //String startDate=date1.toString();
		int result=Integer.parseInt(n1);
		 
		 request.getSession().setAttribute("start",date01);
		 request.getSession().setAttribute("result",result);

		 System.out.println(date01);
		 System.out.println(result);
		 
		 request.getRequestDispatcher("Kratisi3.jsp").forward(request, response);
		 System.out.println(date01);
		 System.out.println(result);
		 
		 response.sendRedirect("Kratisi3.jsp");
	}

}
