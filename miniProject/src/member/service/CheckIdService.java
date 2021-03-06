package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class CheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String id = request.getParameter("id");
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO= memberDAO.getMember(id);
		
		//응답
		request.setAttribute("id", id);
		if(memberDTO!=null) //사용 불가능
			return "/member/checkIdFail.jsp";
		else
			return "/member/checkIdOk.jsp";
	}

}













