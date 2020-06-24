package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardDTO;
import member.dao.MemberDAO;

public class BoardDAO {
	private  static BoardDAO instance;
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
	private DataSource ds;

	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
    public static BoardDAO getInstance() {
    	if(instance == null) { //null인 경우는 한 번 밖에 없다.
    		synchronized (MemberDAO.class) {
    			instance = new BoardDAO(); //메모리에는 1번 생성된다.
    		}
    	}
    	return instance;
    }

    public void makeBoard(Map<String,String> map) {
		String sql = "insert into board(seq,id,name,email,subject,content,ref,logtime) values(seq_board.nextval,?,?,?,?,?,seq_board.currval,sysdate)";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, map.get("id"));
			pstmt.setString(2, map.get("name"));
			pstmt.setString(3, map.get("email"));
			pstmt.setString(4, map.get("subject"));
			pstmt.setString(5, map.get("content"));
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            try {
                if(pstmt!=null)pstmt.close();
                if(conn!=null)conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
    public List<BoardDTO> boardList(int endNum, int startNum) {
    	List<BoardDTO> list = new ArrayList<BoardDTO>();
    	String sql = "select * from (select rownum rn,tt.*from (select seq,subject,name,to_char(logtime,'YYYY.MM.DD')as logtime,hit, "
    			+ "id, content, ref, lev, step, pseq, reply,email from board order by seq desc)tt) where rn>=? and rn<=?";
    	try {
    		conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO(); 
				dto.setSeq(rs.getInt("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setRef(rs.getInt("ref"));
				dto.setLev(rs.getInt("lev"));
				dto.setStep(rs.getInt("step"));
				dto.setPseq(rs.getInt("pseq"));
				dto.setReply(rs.getInt("reply"));
				dto.setHit(rs.getInt("hit"));
				dto.setLogtime(rs.getString("logtime"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
            	if(rs!=null)rs.close();
                if(pstmt!=null)pstmt.close();
                if(conn!=null)conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    	return list;
    }
	public int getTotalA() {
		int totalA=0;
		String sql="select count(*) from board";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			rs.next();
			totalA=rs.getInt("count(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            try {
            	if(rs!=null)rs.close();
                if(pstmt!=null)pstmt.close();
                if(conn!=null)conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		return totalA;
	}
	public BoardDTO getBoard(int seq) {
		BoardDTO dto =null;
		String sql = "select * from board where seq=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setId(rs.getString("id"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setHit(rs.getInt("hit"));
				dto.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
            	if(rs!=null)rs.close();
                if(pstmt!=null)pstmt.close();
                if(conn!=null)conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		return dto;
	}
	public void modifyBoard(BoardDTO dto,int seq) {
		String sql = "update board set subject=?,content=? where seq=?";
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, seq);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            try {
                if(pstmt!=null)pstmt.close();
                if(conn!=null)conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}
}
