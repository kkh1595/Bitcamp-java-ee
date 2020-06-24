package member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.ZipcodeDTO;
import member.dao.MemberDAO;

public class CheckPostService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String zipcode = request.getParameter("zipcode");
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		
		//DB
		List<ZipcodeDTO> list = null;
		if(sido != null && roadname != null){
			MemberDAO memberDAO = MemberDAO.getInstance();
			Map<String, String> map = new HashMap<String, String>();
			map.put("zipcode", zipcode);
			map.put("sido", sido);
			map.put("sigungu", sigungu);
			map.put("roadname", roadname);
			list= memberDAO.getZipcodeList(map);
		}
		
		//응답
		request.setAttribute("list", list);
		return "/member/checkPost.jsp";
	}

}








