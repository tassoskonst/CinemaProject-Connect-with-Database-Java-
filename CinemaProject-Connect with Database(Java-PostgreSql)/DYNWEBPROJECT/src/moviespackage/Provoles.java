package moviespackage;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.Scanner;

import userspackage.Customers;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Provoles 
{
	public int provoliID, provoliNumberOfReservations;
	private Date provoliStartDate;
	private Date provoliEndDate;
	private boolean provoliIsAvailable; 
	private String  provoliFilm, provoliCinema;
	public String sCurrentLine2;

	public Provoles() 
	{
		
	}
	
	public Provoles(int p1, int p2,Date d1,Date d2,boolean p3,String p4,String p5)
	{
		p1=provoliID;
		p2=provoliNumberOfReservations;
		d1=provoliStartDate;
		d2=provoliEndDate;
		p3=provoliIsAvailable;
		p4=provoliFilm;
		p5=provoliCinema;
		
	}
	
	
	public void ProvolesMenu() {

	}
	
	
	// Getter
	  public int getProvoliId() {
	    return provoliID;
	  }

	  // Setter
	  public void setName(int newProvoliID) {
	    this.provoliID = newProvoliID;
	  }
	  
	// Getter
	  public int getprovoliNumberOfReservations() {
	    return provoliNumberOfReservations;
	  }

	  // Setter
	  public void setprovoliNumberOfReservations(int newprovoliNumberOfReservations) {
	    this.provoliNumberOfReservations = newprovoliNumberOfReservations;
	  }
	
}

