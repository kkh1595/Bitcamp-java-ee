package imageboard.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dao.BoardDAO;
import imageboard.bean.ImageboardDTO;
import member.dao.MemberDAO;

public class ImageboardDAO {
	private  static ImageboardDAO instance;
	private SqlSessionFactory sqlSessionFactory;
    public static ImageboardDAO getInstance() {
    	if(instance == null) { //null인 경우는 한 번 밖에 없다.
    		synchronized (MemberDAO.class) {
    			instance = new ImageboardDAO(); //메모리에는 1번 생성된다.
    		}
    	}
    	return instance;
    }
	public ImageboardDAO(){
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader); //build 환경설정
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	public void writeImageboard(ImageboardDTO imageboardDTO) {
		SqlSession session = sqlSessionFactory.openSession();
		session.insert("imageboardSQL.writeImageboard", imageboardDTO);
		session.commit();
		session.close();		
	}
	public List<ImageboardDTO> getImageboardList(Map<String, Integer> map) {
		SqlSession session = sqlSessionFactory.openSession();
		List<ImageboardDTO> list = session.selectList("imageboardSQL.getImageboardList", map);
		session.close();
		return list;
	}

	public int getImageboardTotArticle() {
		SqlSession session = sqlSessionFactory.openSession();
		int totalArticle = session.selectOne("imageboardSQL.getImageboardTotArticle");
		session.close();
		return totalArticle;
	}
	public void deleteImageboard(String seq) {
		SqlSession session = sqlSessionFactory.openSession();
		session.delete("imageboardSQL.deleteImageboard",seq);
		session.commit();
		session.close();
	}
}
