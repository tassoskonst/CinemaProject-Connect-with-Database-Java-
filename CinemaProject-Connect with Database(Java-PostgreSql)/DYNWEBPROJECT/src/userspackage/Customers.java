package userspackage;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

import moviespackage.Cinemas;
import moviespackage.Films;
import moviespackage.Provoles;

public class Customers extends Users {
	
	public Customers() {}
	
	public Customers(String n,String u,String p,String p1) 
	{
		super(n,u,p,p1);
	}
	
	public void CustUser()
	{
 
	}
	

	public String getProperty()
	{
		return "customer";
	}
	
	

	public void login() {
		String line="";		
		boolean find=false;		
	    BufferedReader br=null;
		
		try {
			br=new BufferedReader(new FileReader("Customers.txt"));
				 				
			while((line=br.readLine())!=null&&find==false) {	
					
				find=(line.equals(this.getUsername()+" "+this.getPass()));				
			}
			if(find==true) 
				System.out.println("successful login");
			else
				System.out.println("not find this user");
									
			br.close();
		}
		catch (IOException e) {
			e.printStackTrace();
				
		}		
	}

	public void showAvailableFilms() 
	{
		Films flm = new Films();
		System.out.println("");
	}
	
	
	public void makeReservation() throws IOException
	{
		BufferedReader f = new BufferedReader(new FileReader("Text1.txt")); 
		BufferedReader f2 = new BufferedReader(new FileReader("Text3.txt"));
		String line="";
		  
		while((line=f2.readLine())!=null)
		{
			String[] tmp=line.split(" ");
		    System.out.println("Yparxoun " + tmp[2]  + " theseis gia tin tainia " + f.readLine() );
	    }
    }
	
	public void viewReservation()
	{
		System.out.println("This is viewReservations method");
	}
	
}
