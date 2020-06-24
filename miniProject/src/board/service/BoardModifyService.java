package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class BoardModifyService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int seq = Integer.parseInt(request.getParameter("seq"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		BoardDTO dto = new BoardDTO();
		dto.setSubject(subject);
		dto.setContent(content);
		BoardDAO dao = BoardDAO.getInstance();
		dao.modifyBoard(dto);
		request.setAttribute("pg", pg);
		request.setAttribute("display", "/board/boardModify.jsp");
		return "/main/index.jsp";
	}

}
