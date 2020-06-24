package user.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService{

	@Override
	public void execute() {
		//데이터 받기 
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		UserDTO userDTO = new UserDTO();
		try {
			System.out.println("이름 입력 :");
			String name = br.readLine();
			System.out.println("아이디 입력 :");
			String id = br.readLine();
			System.out.println("비밀번호 입력 :");
			String pwd = br.readLine();
			
			userDTO.setName(name);
			userDTO.setId(id);
			userDTO.setPwd(pwd);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		UserDAO userDAO = UserDAO.getInstance();
		int su = userDAO.write(userDTO);
		System.out.println(su+"개 저장완료");
		System.out.println("---------------------");
	}

}
