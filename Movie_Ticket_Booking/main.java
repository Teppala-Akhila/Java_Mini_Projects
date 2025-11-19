package movie_ticket_booking;

import java.util.*;
public class main {
	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		System.out.println("*WELCOME TO THE APPLICATION*");
		System.out.println("SELECT YOUR CHOICE:");
		System.out.println("1.Manage User");
		System.out.println("2.Manage Movies");
		System.out.println("3.Manage Theatres");
		System.out.println("ENTER YOUR CHOICE HERE(1/2/3/4):");
		int choice = sc.nextInt(); 
		 switch (choice) {
         case 1:
             UserMethod.manageUser();
             break;
//         case 2:
//             methods.manageMovies();
//             break;
//         case 3:
//             methods.manageTheaters();
//             break;
         case 4:
             System.out.println("EXIT...");
             return;
         default:
             System.out.println("Invalid option!");
     }
	}
}
