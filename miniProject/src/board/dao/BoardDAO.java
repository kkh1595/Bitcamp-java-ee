package board.dao;

import java.io.IOException;
import java.io.Reader;
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
	public void modifyBoard(BoardDTO boardDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.selectOne("boardSQL.modifyBoard", boardDTO);
		sqlSession.close();
	}
	public List<BoardDTO> searchBoard(Map<String, String> map) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<BoardDTO> list = sqlSession.selectList("boardSQL.searchBoard",map);
		sqlSession.close();
		return list;
	}
	public int getTotalB(String keyword) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalB= sqlSession.selectOne("boardSQL.getTotalB",keyword);
		return totalB;
	}
}
