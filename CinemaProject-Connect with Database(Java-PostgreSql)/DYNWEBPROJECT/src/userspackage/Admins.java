package userspackage;
import java.util.Scanner;
import java.util.HashSet;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;


public class Admins extends Users 
{
	public Admins() {}
	
	public Admins(String n,String u,String p,String p1) 
	{
		super(n,u,p,p1);
	}
	
	
	public void AdminUser()
	{

 	   
	}

	public void login() {
		String line="";
		
		boolean find=false;
			
			BufferedReader br=null;
			try {
				br=new BufferedReader(new FileReader("AdminText.txt"));
				 
				
				
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
	

	public void createUser(String n,String u,String p) 
	{
		super.UserInput(n,u,p);
	}

	public void updateUser() 
	{
		System.out.println("Here you can update users!");
	}
	
	public void deleteUser() 
	{
		System.out.println("Here you can delete users!");
	}

	public String getProperty()
	{
		return "admin";
	}
	
   public void searchUser(Users us)
   {
	    System.out.println("Here you can search users!");
	   
		String name = us.getName();
		String username =us.getUsername();
		String password =us.getPass();
		String property= us.getProperty();
		String line="";
		int count =0;
		  
		if (property=="admin")
		{
			BufferedReader b = null;
			try {
				b= new BufferedReader(new FileReader("AdminText.txt"));
				  
				while((line=b.readLine())!=null){
					  if(!line.isEmpty())
						  count++;
						  if (line.equals(name+ " "+username+" "+" "+password))
							  System.out.println("Found user" +name+ "in line"+count+1);
				}
			    b.close();
			}
			catch(IOException e){
				System.out.println(e);
			}  
		}

		else if (property=="contentadmin") {
			  
			BufferedReader b = null;
			try {
				b= new BufferedReader(new FileReader("ContAdmin.txt"));
				  
				while((line=b.readLine())!=null)
				{
					if(!line.isEmpty()) 
						count++;
						if (line.equals(name+ " "+username+" "+" "+password))
							System.out.println("Found user" +name+ "in line"+count+1);
				}
			    b.close();
			}
			catch(IOException e){
				System.out.println(e);  
			  }  
		}
		  
		else if (property=="customer") {
			BufferedReader b = null;
		    try {
			b= new BufferedReader(new FileReader("Customers.txt"));
			  
			while((line=b.readLine())!=null){
				if(!line.isEmpty()) 
					count++;
					if (line.equals(name+ " "+username+" "+" "+password))
						System.out.println("Found user" +name+ "in line"+count+1);
			}
			b.close();
		}
		catch(IOException e){
			System.out.println(e);  
		}
	}
		  
	}
   
   
  // Users us = new Admins();
   public void viewAllUsers() 
   {
	   System.out.println("Here you can view all users!");
   }
   
   public void registerAdmin() 
   {
	    System.out.println("Here you can register!");
	    try {
		    System.out.println("\n What you want to do :1)Create User 2)Update User 3) Delete User 4)Search User 5) View Users ");
			Scanner input = new Scanner(System.in);
			int choice = input.nextInt();
			Users us = new Users();
			
			
			switch(choice)
			{        
			    case 1: createUser(getName(),getUsername(),getPass()); 
			        break;
			    case 2: updateUser();
			        break;
			    case 3: deleteUser();
			        break;
			    case 4: searchUser(us);
			        break;
			    case 5: viewAllUsers();
			        break;
			}
		        	   
	    }
   
	    catch(ArithmeticException e) {
			System.out.println("Arithmetic Exception!");
	    }
	
	    finally {
			System.out.println("ok");
		}
	

	   
   }

}
