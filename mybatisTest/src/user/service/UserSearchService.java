package user.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		UserDAO userDAO = UserDAO.getInstance();
		List<UserDTO> list = null;
		String searchValue=null;
		String searchType = null;
		System.out.println("1.아이디 검색");
		System.out.println("2.이름 검색");
		System.out.print(">");
		try {
			String choice = br.readLine();
			if(choice.equals("1")) {
				System.out.print("검색할 아이디 입력:");
				searchValue = br.readLine();
				searchType = "id";
			}else if(choice.equals("2")) {
				System.out.println("검색할 이름 입력:");
				searchValue = br.readLine();
				searchType = "name";
			}
			Map<String,String> map = new HashMap<String, String>();
			map.put("searchType",searchType);
			map.put("searchValue",searchValue);
			list = userDAO.search(map);
			for (UserDTO dto : list) {
				System.out.println(dto.getName()+"\t"
						+dto.getId()+"\t"
						+dto.getPwd());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
