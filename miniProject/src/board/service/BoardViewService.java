package board.service;

import javax.servlet.http.Cookie;
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
		 //조회수
		 Cookie[] ar = request.getCookies();
		 if(ar!=null) {
			 for(int i=0; i<ar.length; i++) {
				 if(ar[i].getName().equals("memHit")) {
					 dao.hitUpdate(seq);
					 ar[i].setMaxAge(0);
					 response.addCookie(ar[i]);
				 }
			 }
		 }
		 
		 String boardId = boardDTO.getId();
		 
		 request.setAttribute("id", id);
		 request.setAttribute("seq", seq);
		 request.setAttribute("pg", pg);
		 request.setAttribute("boardId", boardId);
		 request.setAttribute("boardDTO", boardDTO);
		 request.setAttribute("display", "/board/boardView.jsp");
		return "/main/index.jsp";
	}

}
