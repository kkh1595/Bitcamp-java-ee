package user.main;

import java.util.Scanner;

import user.service.UserDeleteService;
import user.service.UserInsertService;
import user.service.UserSearchService;
import user.service.UserSelectService;
import user.service.UserService;
import user.service.UserUpdateService;

public class UserMain {
	public void menu() {
		UserService userService = null;
		Scanner scan = new Scanner(System.in); 
		while(true) {
			System.out.println("1.입력");
			System.out.println("2.출력");
			System.out.println("3.수정");
			System.out.println("4.삭제");
			System.out.println("5.검색");
			System.out.println("6.종료");
			System.out.print("선택:");
			int choice = scan.nextInt();
			
			if(choice==6) {
				System.out.println("종료합니다");
				break;
			}
			if(choice==1) {
				userService = new UserInsertService();
			}else if(choice==2) {
				userService = new UserSelectService();
			}else if(choice==3) {
				userService = new UserUpdateService();
			}else if(choice==4) {
				userService = new UserDeleteService();
			}else if(choice==5) {
				userService = new UserSearchService();
			}
			userService.execute();
		}
		scan.close();
	}
	public static void main(String[] args) {
		UserMain userMain = new UserMain();
		userMain.menu();
	}

}
