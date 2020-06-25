package board.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

public class BoardSearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		//데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		String id=(String)session.getAttribute("memId");
		String keyword = request.getParameter("keyword");
		System.out.println("키워드!: "+keyword);
		String searchOption = request.getParameter("searchOption");
		System.out.println(searchOption+"잘오니");
		//db 1페이당 5개
		int endNum = pg*5;
		int startNum = endNum-4;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("searchOption", searchOption);
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> searchList = boardDAO.searchBoard(map);

		//응답
		request.setAttribute("pg", pg);
		request.setAttribute("id", id);
		request.setAttribute("searchOption", searchOption);
		request.setAttribute("keyword", keyword);
		request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		request.setAttribute("list", searchList);
		//페이징처리
		BoardPaging searchPaging = new BoardPaging(); 
		int totalB = boardDAO.getTotalB(keyword,searchOption);
		System.out.println("토랄B"+totalB);
		searchPaging.setCurrentPage(pg);
		searchPaging.setPageBlock(3);
		searchPaging.setPageSize(5);
		searchPaging.setTotalA(totalB);
		searchPaging.searchPagingHTML(totalB);
		request.setAttribute("boardPaging", searchPaging);
		request.setAttribute("display", "/board/boardList.jsp");
		return "/main/index.jsp";
	}
}
