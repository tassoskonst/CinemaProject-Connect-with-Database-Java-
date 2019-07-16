package companyOfFilms;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Main {

	public static void main(String[] args) {
        Connection c = null;
        PreparedStatement prepared_stmt= null;
        ResultSet rs = null;
        
        try {

            //Class.forName("org.postgresql.Driver");
            c = DriverManager
                    .getConnection("jdbc:postgresql://localhost:5432/CinameProject","postgres", "123456");

            System.out.println("Opened database successfully");
            //String data="Ramesh";

            String data="den me noiazei' OR 1=1 --";

            
            // String sql=" SELECT * FROM customers WHERE name='"+data+"'"; -> Wrong prepared statement usage!
		

            String sql="SELECT provolinor FROM provoles "; //use this

            prepared_stmt = c.prepareStatement(sql);

            //prepared_stmt.setString(1, data);
            
            //prepared_stmt.setFetchSize(2);
            //prepared_stmt.setFetchSize(0);
            
            rs = prepared_stmt.executeQuery();
            while ( rs.next() ) {
            	
            	Integer provolinor = rs.getInt("provolinor");
                
                
                
                System.out.println(provolinor);
                
                
                System.out.println();

            }
        } catch (SQLException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (prepared_stmt != null) {
                    prepared_stmt.close();
                }
                if (c != null) {
                    c.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
		
	}

}
