package user.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import user.bean.UserDTO;

public class UserDAO {
	private static UserDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static UserDAO getInstance() {
		if(instance == null) {
			synchronized (UserDAO.class) {
				instance = new UserDAO();
			}
		}
		return instance;
	}
	
	public UserDAO() {
//		IO스트림
//		1.byte 단위= InputStream , OutStream
//		2.문자 단위 = Reader, Writer
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); //build 환경설정
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public int write(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); 
		int su = sqlSession.insert("userSQL.write",userDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	public List<UserDTO> getUserList(){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.getUserList");
		//List<> list = new ArrayList<E>(); 를 안해줘도 됨: 
		//.selectList() 가 자동으로 생성 후 리턴 값을 resultType 에 담음
		sqlSession.close();
		return list;
	}
	public UserDTO checkId(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO =sqlSession.selectOne("userSQL.checkId",id );
		sqlSession.close();
		return userDTO;
	}
	public int update(UserDTO userDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession(); 
		int su = sqlSession.update("userSQL.update",userDTO);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	public int delete(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int su = sqlSession.delete("userSQL.delete", id);
		sqlSession.commit();
		sqlSession.close();
		return su;
	}
	public List<UserDTO> search(Map<String,String> map){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserDTO> list = sqlSession.selectList("userSQL.search",map);
		sqlSession.close();
		
		return list;
	}
	
}
