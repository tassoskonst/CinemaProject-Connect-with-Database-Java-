package userspackage;

import java.io.*;

import java.util.Scanner;
	
public class Users 
{
	private String name;
	private String username;
	private String password; 
	private String property;
	
	public Users() {}
	
	public Users(String n,String u, String p) {
		n=name;
		u=username;
		p=password;
	}
	
	public Users(String n,String u, String p, String p1) 
	{
		n=name;
		u=username;
		p=password;
		p1=property;
	}
	
	public void UserInput(String n,String u, String p){
		n=name;
		u=username;
		p=password;
		
		System.out.println("Give your name ! ");
		Scanner input = new Scanner(System.in);
		 n = input.nextLine();
		
		System.out.println("Give your username ! ");
		Scanner input2 = new Scanner(System.in);
		u = input2.nextLine();
		
		System.out.println("Give your password ! ");
		Scanner input3 = new Scanner(System.in);
		p = input3.nextLine();
		
		
		try {
			FileWriter admnText = new FileWriter("AdminText.txt");//1
			admnText.write(n + " "+u + " " + p);
		    System.out.println("Successfully wrote to the file.");
		    admnText.close();
	    
		 }
	    catch (IOException e) {
	        System.out.println("An error occurred.");
	        e.printStackTrace();
	          } 
		
		

		
	}
	
	public void  login()
	{

		System.out.println("Successfull login");
		 
		
	}
	public void  logout()
	{
	
		System.out.println("Syccessfull Logout");
	}

	
	
	public String getProperty()
	{
		return property;
	}
	//Getter name
	public String getName() 
	{
		return name;
	}

	//Setter
	public void setName(String newName) 
	{
		this.name = newName;
	}
	
	//Getter username
	public String getUsername() {
	    return username;
	}

	// Setter username
	public void setUsername(String newUsername) 
	{
	 	this.name = newUsername;
	}
	
	//Getter pass
	public String getPass() 
	{
		return password;
	}

	// Setter pss
	public void setPass(String newPass) 
	{
		this.name = newPass;
	}
}

		

