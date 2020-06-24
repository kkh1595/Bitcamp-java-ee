package member.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		Map<String, String> map = new HashMap<String, String>();
		map.put("id",id);
		map.put("pwd",pwd);
		MemberDTO memberDTO = memberDAO.login(map);
		
		//응답
		if(memberDTO==null) {
			return "/member/loginFail.jsp";
		}else {
			//세션
			HttpSession session = request.getSession(); //세션 생성
			session.setAttribute("memName", memberDTO.getName());
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			request.setAttribute("display", "/top/body.jsp");
			
		}
		
		return "/main/index.jsp";
			
	}

}










