package board.bean;

import lombok.Data;
@Data
public class BoardPaging {
	private int currentPage,pageBlock,pageSize,totalA;
	private StringBuffer pagingHTML;
	
	public void makePagingHTML(int totalA) {
		pagingHTML = new StringBuffer();
		int totalP = (totalA+pageSize-1)/pageSize;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage>totalP) endPage = totalP;
		
		if(startPage > pageBlock) 
			pagingHTML.append("[<span id='paging' onclick='boardPaging("+(startPage-1)+")'>이전]</span>]");
		for (int i = startPage; i <=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id='currentPage' onclick='boardPaging("+i+")'>"+i+"</span>]");
			}else pagingHTML.append("[<span id='endPage' onclick='boardPaging("+i+")'>"+i+"</span>]");
		}
		if(endPage < totalP) {
			pagingHTML.append("[<span id='nextPage' onclick='boardPaging("+(endPage+1)+")'>다음</span>]");
			for (int i = startPage; i <=endPage ; i++) {
			}
		}
	}
	public void searchPagingHTML(int totalB) {
		pagingHTML = new StringBuffer();
		int totalP = (totalB+pageSize-1)/pageSize;
		
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage>totalP) endPage = totalP;
		
		if(startPage > pageBlock) 
			pagingHTML.append("[<span id='paging' onclick='searchPaging("+(startPage-1)+")'>이전]</span>]");
		for (int i = startPage; i <=endPage; i++) {
			if(i==currentPage) {
				pagingHTML.append("[<span id='currentPage' onclick='searchPaging("+i+")'>"+i+"</span>]");
			}else pagingHTML.append("[<span id='endPage' onclick='searchPaging("+i+")'>"+i+"</span>]");
		}
		if(endPage < totalP) {
			pagingHTML.append("[<span id='nextPage' onclick='searchPaging("+(endPage+1)+")'>다음</span>]");
			for (int i = startPage; i <=endPage ; i++) {
			}
		}
	}

}
