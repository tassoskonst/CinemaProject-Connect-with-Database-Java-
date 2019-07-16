package moviespackage;
import java.io.*;
import java.text.ParseException;
import java.util.Scanner;
import java.io.File;
import java.io.FileWriter;
import moviespackage.Films;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Cinemas {
	
	public int cinemaId, cinemaNumberOfSeats;
	public String Diastasi;
	private boolean cinemaIs3D;
	public String sCurrentLine;
	
	
	public Cinemas() {}
	
	public  Cinemas(int c1,int c2, boolean c3)
	{
		c1=cinemaId;
		c2=cinemaNumberOfSeats;
		c3=cinemaIs3D;
	}
	
	public void CinemasMenu() {
	
		
	}
	 
	public int getcinemaId() {
	    return cinemaId;
	  }

	// Setter
	public void setcinemaId(int newcinemaId) {
	    this.cinemaId = newcinemaId;
	    
	  }
	public int getcinemaNumberOfSeats() {
		return cinemaNumberOfSeats;
		  }

	// Setter
    public void setcinemaNumberOfSeats(int newcinemaNumberOfSeats) {
		this.cinemaNumberOfSeats = newcinemaNumberOfSeats;
		    
		  }
    public boolean getcinemaIs3D() {
	    return cinemaIs3D;
			  }

	// Setter
	public void setcinemaIs3D(boolean newcinemaIs3D) {
	    this.cinemaIs3D = newcinemaIs3D;
			    
			  }
      
        
		

}
	
	
	


