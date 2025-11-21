package movie_ticket_booking;

import java.util.*;
import java.io.*;
public class UserMethod{
	static Scanner sc=new Scanner(System.in);
	public static void manageUser() {
	   System.out.println("YOUR CHOICE IS:'Manage User'");
	   System.out.println("SELECT YOUR OPERATION FOR USER:");
	   System.out.println("A.Add User");
       System.out.println("B.View User");
       System.out.println("C.Update User");
       System.out.println("D.Delete User");
       System.out.println("ENTER YOUR CHOICE(A/B/C/D):");
       String action=sc.nextLine().trim().toLowerCase();//trim will remove extra spaces if presented
       switch(action) {
       case "a":
    	   System.out.println("You Selected To Register");
    	   System.out.println("Enter Firstname: ");
    	   String fn=sc.nextLine();
    	   System.out.println("Enter Lastname: ");
    	   String ln=sc.nextLine();
    	   System.out.println("Enter PhoneNumber: ");
    	   String pn=sc.nextLine();
    	   System.out.println("Enter Password: ");
    	   String pd=sc.nextLine();
    	   System.out.println("DO YOU WANT TO SAVE(YES/NO)?");
    	   String save=sc.nextLine().toLowerCase();
		   String status;
		   if(save.equalsIgnoreCase("yes")) {
			   status="Active";
		   }
		   else {
			   status="Inactive";  
		   }
		   System.out.println("-->Your Status is: "+status);
    	   
    	   if(save.equalsIgnoreCase("yes")) {
    	   try {
    		   int id=1;
    		   File file=new File("userinfo.txt");
    		   if(file.exists()) {
    		   BufferedReader br=new BufferedReader(new FileReader(file));
    		   String line;
    		   int count=0;
    		   while((line=br.readLine())!=null) {
    			   if (!line.trim().isEmpty()) {
                       count++;
                   }
    		   }
    		   br.close();
               id = count + 1; // next id  
    		   }  
    		   System.out.println("-->YOUR ID IS: "+id);
    		   BufferedWriter bw=new BufferedWriter(new FileWriter("userinfo.txt",true));//FileWriter should be opened in append mode if you want to add multiple users
    		   bw.write(id + "," + fn + "," + ln + "," + pn + "," + pd + "," + status);
    		   bw.newLine();
    		   bw.close();
    		   System.out.println("User Saved Successfully!");
    	   }catch(Exception e){
			   System.out.println("CANNOT BE INSERTED!");
		   }
    	   }
    	   else {
    		   System.out.println("User Not Saved Successfully!");
    	   }
    	   break;
       case "b":System.out.println("You Selected To Review Your Data");
    	        System.out.println("Enter Your Id: ");
                int vid=sc.nextInt();
                try {
                	File file=new File("userinfo.txt");
                	BufferedReader br=new BufferedReader(new FileReader(file));
                	String line;
                	boolean found=false;
                	while((line=br.readLine())!=null) {
                		if(!line.trim().isEmpty()) {
                			String parts[]=line.split(",");
                			int id=Integer.parseInt(parts[0].trim());
                			if(id==vid) {
                		       System.out.println(line.trim());
                		       found=true;
                		       break;
                			}
                		}
                }
                br.close();
                if(!found) {
                	System.out.println("User Not Found With Id "+vid);
                }
                }catch(Exception e){
                	System.out.println("CANNOT BE VIEWED");
                }
                break;
       case "d":System.out.println("You Selected To Delete Your Data");
                System.out.println("Enter Your Id: ");
                int did=sc.nextInt();
                try {
                	File file=new File("userinfo.txt");
                	BufferedReader br=new BufferedReader(new FileReader(file));
                	String line;
                	while((line=br.readLine())!=null) {
                		if(!line.trim().isEmpty()) {
                			String parts[]=line.split(",");
                			int id=Integer.parseInt(parts[0].trim());
                			String stat=parts[5];
                			if(id==did) {
                				stat="Inactive";
                				BufferedWriter bw=new BufferedWriter(new FileWriter(file));
                				parts[5]=bw.write(stat);
                			}
                			
                		}
                	}
                }
       }
	 }	
}