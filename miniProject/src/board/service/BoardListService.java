package board.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		//데이터
		String id=(String)session.getAttribute("memId");
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("pg="+pg);
		
		//db
		int endNum = pg*5;
		int startNum = endNum-4;
		BoardDAO dao = BoardDAO.getInstance();
    	Map<String, Integer> map = new HashMap<String, Integer>();
    	map.put("startNum", startNum);
    	map.put("endNum", endNum);
		List<BoardDTO> list = dao.boardList(map);
		System.out.println("리스트"+list);
		//페이징처리
		BoardPaging boardPaging = new BoardPaging(); 
		int totalA = dao.getTotalA();
		boardPaging.setCurrentPage(pg);
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML(totalA);
		
		//조회수 증가방지
		if(session.getAttribute("memId")!=null) {
			Cookie cookie =new Cookie("memHit","ok");
			cookie.setMaxAge(30*60);
			response.addCookie(cookie);
		}
		//응답
		request.setAttribute("boardPaging", boardPaging);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("list", list);
		request.setAttribute("id", id);
		request.setAttribute("pg", pg);
//		request.setAttribute("id", id);
		request.setAttribute("display", "/board/boardList.jsp");
		return "/main/index.jsp";
	}

}
