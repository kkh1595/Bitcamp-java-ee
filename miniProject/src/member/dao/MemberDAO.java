package member.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public class MemberDAO {
    private static MemberDAO instance; 
    private SqlSessionFactory sqlSessionFactory;

  
    public static MemberDAO getInstance() { 
    	if(instance == null) {
    		synchronized(MemberDAO.class) {
    			instance = new MemberDAO();
			}
    	}
        return instance;
    }
	public MemberDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); //build 환경설정
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
//=================회원가입==========================
	//가입시 입력한 정보 db저장
    public int insert(MemberDTO memberDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
    	int su = sqlSession.insert("memberSQL.insert", memberDTO);
    	sqlSession.commit();
    	sqlSession.close();
    	return su;
	}
    //id중복체크, 회원정보변경시 정보 매핑
    public MemberDTO getMember(String id) {
    	SqlSession sqlSession = sqlSessionFactory.openSession(); 
    	MemberDTO memberDTO = sqlSession.selectOne("memberSQL.getMember",id);
    	sqlSession.close();
    	return memberDTO;
    }
    //주소값
    public List<ZipcodeDTO> getZipcodeList(Map<String,String> map){
    	SqlSession sqlSession = sqlSessionFactory.openSession();
    	List<ZipcodeDTO> list = sqlSession.selectList("memberSQL.getZipcodeList", map);
    	sqlSession.close();
    	return list;
    }
//=================로그인===========================
    public MemberDTO login(Map<String,String> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MemberDTO memberDTO = sqlSession.selectOne("memberSQL.login", map);
		sqlSession.close();
		return memberDTO;
	}
//=================회원정보수정=====================    
    public int modify(MemberDTO memberDTO) {
    	SqlSession sqlSession = sqlSessionFactory.openSession(); 
		int su=sqlSession.insert("memberSQL.modify",memberDTO);
		sqlSession.commit();
		sqlSession.close();
    	return su;
    }   
}

