package user.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService{

	@Override
	public void execute() {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		UserDTO userDTO = new UserDTO();
		try {
			System.out.print("수정할 아이디 입력:");
			String id = br.readLine();
			
			UserDAO userDAO = UserDAO.getInstance();
			userDTO = userDAO.checkId(id);
			if(userDTO !=null) {
				System.out.println(userDTO.getName()+"\t"
									+userDTO.getId()+"\t"
									+userDTO.getPwd());
				System.out.println("---------------------");
				System.out.print("수정할 이름 입력:");
				String name = br.readLine();
				System.out.print("수정할 비밀번호 입력:");
				String pwd = br.readLine();
				
				userDTO.setId(id);
				userDTO.setName(name);
				userDTO.setPwd(pwd);
				int su = userDAO.update(userDTO);
				System.out.println(su+"개 수정완료");
				System.out.println("---------------------");
			}else {
				System.out.println("그런 아이디 또  없습니다");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
