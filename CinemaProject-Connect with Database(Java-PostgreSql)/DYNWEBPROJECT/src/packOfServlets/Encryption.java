package packOfServlets;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

/**
 * May 3, 2014, 4:25:00 AM
 *
 * @author syggouroglou@gmail.com
 */
public class Encryption {

    /**
     * Computes the hash of the given string. Return the hash uppercase.
     *
     * @param unhashed
     * @return Return the hash of the given string uppercase.
     */
    public static String getHashMD5(String unhashed) {
        return getHashMD5(unhashed, "");
    }

    /**
     * Computes the hash of the given string salted. Return the hash uppercase.
     * @param unhashed the string to hash
     * @param salt the salt to use
     * @return the hash of the given string salted and uppercase.
     * @throws NoSuchAlgorithmException
     */
    public static String getHashMD5(String unhashed, String salt) {
        // Hash the password.
        final String toHash = salt + unhashed + salt;
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("MD5");
        } catch (NoSuchAlgorithmException ex) {
            return "00000000000000000000000000000000";
        }
        messageDigest.update(toHash.getBytes(), 0, toHash.length());
        String hashed = new BigInteger(1, messageDigest.digest()).toString(16);
        if (hashed.length() < 32) {
            hashed = "0" + hashed;
        }
        return hashed.toUpperCase();
        
        
    }
    
    
    public static void main (String[] args) { 
    	
        try { 
            String url = "jdbc:postgresql://localhost:5432/CinameProject"; 
            Connection conn = DriverManager.getConnection(url,"postgres","123456"); 
            Statement st = conn.createStatement(); 
            st.executeUpdate("insert into Users(userid,name,username,password,usertype)values('14','asdasdas','ads',hashed,'Admin')"); 
            System.out.println("Data is successfully inserted!");

            conn.close(); 
        } catch (Exception e) { 
            System.err.println("Got an exception! "); 
            System.err.println(e.getMessage()); 
        } 
  
    }

}