package board.bean;

import lombok.Data;

@Data
public class BoardSearchDTO {
	private String keyword;
	private int startNum, endNum;
}
