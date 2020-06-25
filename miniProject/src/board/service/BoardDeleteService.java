package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class BoardDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터 받기
		int seq = Integer.parseInt(request.getParameter("seq"));
		//db
		BoardDAO.getInstance().deleteBoard(seq);
		request.setAttribute("display", "/board/boardDelete.jsp");
		//응답
		return "/main/index.jsp";
	}

}
