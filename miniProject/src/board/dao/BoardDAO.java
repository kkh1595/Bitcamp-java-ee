package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.BoardDTO;
import board.bean.BoardSearchDTO;
import member.dao.MemberDAO;

public class BoardDAO {
	private  static BoardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
    public static BoardDAO getInstance() {
    	if(instance == null) { //null인 경우는 한 번 밖에 없다.
    		synchronized (MemberDAO.class) {
    			instance = new BoardDAO(); //메모리에는 1번 생성된다.
    		}
    	}
    	return instance;
    }
	public BoardDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); //build 환경설정
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
    public void makeBoard(Map<String,String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("boardSQL.makeBoard", map);
		sqlSession.commit();
		sqlSession.close();
    }
    public List<BoardDTO> boardList(Map<String, Integer> map) {
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList", map);
    	sqlSession.close();
    	//ㅇㅇ
    	return list;
    }
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA= sqlSession.selectOne("boardSQL.getTotalA");
		sqlSession.close();
		return totalA;
	}
	public BoardDTO getBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		BoardDTO boardDTO = sqlSession.selectOne("boardSQL.getBoard", seq);
		sqlSession.close();
		return boardDTO;
	}
	public void modifyBoard(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.selectOne("boardSQL.modifyBoard", map);
		sqlSession.close();
	}
	public List<BoardDTO> searchBoard(Map<String, Object> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.searchBoard",map);
		sqlSession.close();
		return list;
	}
	public int getTotalB(String keyword,String searchOption) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		map.put("searchOption", searchOption);
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalB= sqlSession.selectOne("boardSQL.getTotalB",map);
		return totalB;
	}
	public void hitUpdate(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("boardSQL.hitUpdate", seq);
		sqlSession.commit();
		sqlSession.close();
	}
	public void boardReply(Map<String, String> map) {
		BoardDTO pDTO = this.getBoard(Integer.parseInt(map.get("pseq")));
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		//step 글순서 업데이트
		sqlSession.update("boardSQL.boardReply1",pDTO);
		//insert 답글 작성
		map.put("ref", pDTO.getRef()+"");
		map.put("lev", pDTO.getLev()+1+"");
		map.put("step", pDTO.getStep()+1+"");
		sqlSession.insert("boardSQL.boardReply2", map);
		//답글수 update
		sqlSession.update("boardSQL.boardReply3", pDTO.getSeq());
		
		sqlSession.commit();
		sqlSession.close();
	}
	public void deleteBoard(int seq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();		
		//답글수 -1
		sqlSession.update("boardSQL.boardDelete1", seq);
		//삭제된 원글 답글 제목을 원글이 삭제되었습니다~~~ 라 붙이기
		sqlSession.update("boardSQL.boardDelete2", seq);
		//삭제
		sqlSession.update("boardSQL.boardDelete3", seq);
		sqlSession.commit();
		sqlSession.close();
	}
}
