package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardModifyFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터받기
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO boardDTO = dao.getBoard(seq);
		
		request.setAttribute("seq", seq);
		request.setAttribute("pg", pg);
		request.setAttribute("boardDTO", boardDTO);
		
		request.setAttribute("display", "/board/boardModifyForm.jsp");
		return "/main/index.jsp";
	}

}
