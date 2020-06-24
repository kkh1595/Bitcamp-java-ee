package user.service;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService{

	@Override
	public void execute() {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		UserDTO userDTO = new UserDTO();
		
		try {
			System.out.print("삭제할 아이디 입력:");
			String id = br.readLine();
			
			UserDAO userDAO = UserDAO.getInstance();
			userDTO = userDAO.checkId(id);
			if(userDTO!=null) {
				System.out.println(userDTO.getName()+"\t"
						+userDTO.getId()+"\t"
						+userDTO.getPwd());
				System.out.println("---------------------");
				System.out.println("정말 삭제하시겠습니까?(y/n)");
				System.out.print(">");
				String choice = br.readLine();
				if(choice.equals("y") || choice.equals("Y")) {
					int su =userDAO.delete(id);
					System.out.println(su+"개 삭제완료");
					System.out.println("---------------------");
				}else if(choice.equals("n") || choice.equals("N")){
					System.out.println("메뉴로 돌아갑니다");
					return;
				}
			}else {
				System.out.println("그런 아이디 없습니다");
				System.out.println("---------------------");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
