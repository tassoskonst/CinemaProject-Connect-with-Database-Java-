package userspackage;
import java.util.Scanner;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class ContentAdmins extends Users { 
	
	public ContentAdmins() {
		
	}
	
	public ContentAdmins(String n,String u,String p,String p1) 
	{
		super(n,u,p,p1);
	}
	
	public String getProperty()
	{
		return "contentadmin";
	}
	
	public void login() {
		String line="";
		
		boolean find=false;
					
		BufferedReader br=null;
		try {
			br=new BufferedReader(new FileReader("ContAdmin.txt"));
				 
				
				
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
	
	public void ContUsers()
	{ 
		try { 	
		    FileWriter contentad = new FileWriter("ContAdmin.txt");
		      
		    contentad.write("name username 123 movie\n");
		    contentad.write("nn uu 123 m\n");
		    contentad.write("a aa 143 mv\n");
		      
		    contentad.close();
		      
		    System.out.println("Successfully wrote to the file.");
		} 
		catch (IOException e) {
		    System.out.println("An error occurred.");
		    e.printStackTrace();
		}  
		 
	}

	public void ContentAdminsMenu(){
		
		System.out.println("\n What you want to do :1) Insert Film 2) Delete Film 3) Assign a Film to Cinema ");

		Scanner input = new Scanner(System.in);
		int choice = input.nextInt();
	
		if (choice>4) {

			throw new IllegalArgumentException("Choice must be >= 0");
		}
			
		else {				
			switch(choice){        
	 	        case 1:  insertFilm();
	 	        	break;
	 	        case 2: deleteFilm();
	 	         	break;
	 	        case 3: assignFilmToCinema();
	 	         	break;
	 	         
	 	   }
		}
	}
		
	
	
	
	public void insertFilm() 
	{
		System.out.println("Insert new film");
		Scanner input = new Scanner(System.in);
		String newFilm = input.nextLine();
		
		try {
			FileWriter ContadmnText = new FileWriter("ContAdminText.txt");//1
			ContadmnText.write(newFilm);
		    System.out.println("Successfully wrote to the file.");
		    ContadmnText.close();
		    
		}
		catch (IOException e) {
		    System.out.println("An error occurred.");
		    e.printStackTrace();
		} 
		

	}
	
	public void deleteFilm() 
	{
		System.out.println("Here you can delete a film");

	}
	
	public void assignFilmToCinema() 
	{
		System.out.println("Here you can assign a Film To Cinema you want  ");
	}

}
