package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		 HttpSession session = request.getSession();
		 int seq = Integer.parseInt(request.getParameter("seq"));
		 int pg = Integer.parseInt(request.getParameter("pg"));
		 String id = (String)session.getAttribute("memId");
		 BoardDAO dao = BoardDAO.getInstance();
		 BoardDTO boardDTO = dao.getBoard(seq); 
		 String boardId = boardDTO.getId();
		 System.out.println(boardId);
		 
		 
		 request.setAttribute("id", id);
		 request.setAttribute("seq", seq);
		 request.setAttribute("pg", pg);
		 request.setAttribute("boardId", boardId);
		 request.setAttribute("boardDTO", boardDTO);
		 request.setAttribute("display", "/board/boardView.jsp");
		return "/main/index.jsp";
	}

}
