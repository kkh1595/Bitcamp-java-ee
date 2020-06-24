package board.bean;

import board.dao.BoardDAO;
import lombok.Data;
@Data
public class BoardPaging {
	private int currentPage,pageBlock,pageSize,totalA;
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		BoardDAO dao = BoardDAO.getInstance();
		totalA = dao.getTotalA();
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage>totalP) endPage = totalP;
		
		if(startPage > pageBlock) 
			pagingHTML.append("[<a href='boardList.jsp?pg="+(startPage-1)+"'>이전</a>]");
		for (int i = startPage; i <=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<a id='currentPage' href='boardList.jsp?pg="+i+"'>"+i+"]");
			}else pagingHTML.append("[<a id='endPage' href='boardList.jsp?pg="+i+"'>"+i+"]");
		}
		if(endPage < totalP) {
			pagingHTML.append("[<a href='boardList.jsp?pg="+(endPage+1)+"'>다음</a>]");
			for (int i = startPage; i <=endPage ; i++) {
				
			}
		}
	}

}
