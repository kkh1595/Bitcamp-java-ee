package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public class MemberDAO {
	private static MemberDAO instance;
	// private MemberDAO() {} //외부에서의 인스턴스화를 막는다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;

	public MemberDAO() {
		try {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
		
	}
	public static MemberDAO getInstance() {
		if (instance == null) { // null인 경우는 한 번 밖에 없다.
			synchronized (MemberDAO.class) {
				instance = new MemberDAO(); // 메모리에는 1번 생성된다.
			}
		}
		return instance;
	}

	public boolean isExistId(String id) {
		boolean checkId = true;
		String sql = "select * from member where id=?";
		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				checkId = true;
			} else {
				checkId = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return checkId;
	}

	public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname) {
		List<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
		String sql = "select * from newzipcode where sido=? and nvl(sigungu,'0') like ? and roadname like ?";
		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sido);
			pstmt.setString(2, "%" + sigungu + "%");
			pstmt.setString(3, "%" + roadname + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ZipcodeDTO dto = new ZipcodeDTO();
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSido(rs.getString("sido"));
				dto.setSigungu(rs.getString("sigungu") == null ? "" : rs.getString("sigungu"));
				dto.setYubmyundong(rs.getString("yubmyundong") == null ? "" : rs.getString("yubmyundong"));
				dto.setRi(rs.getString("ri") == null ? "" : rs.getString("ri"));
				dto.setRoadname(rs.getString("roadname") == null ? "" : rs.getString("roadname"));
				dto.setBuildingname(rs.getString("buildingname") == null ? "" : rs.getString("buildingname"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public String getName(MemberDTO dto) {
		String name = null;
		String sql = "select name,id,pwd from member where id=? and pwd=?";
		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}

	public MemberDTO getEmail(MemberDTO dto) {
		String sql = "select * from member where id=? and pwd=?";
		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setName(rs.getString("name"));
//				System.out.println("dao이름찎히나?"+rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public MemberDTO getStatus(String id) {
		MemberDTO dto = null;
		String sql = "select * from member where id=?";
		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MemberDTO();
				dto.setName(rs.getString("name"));
//				System.out.println("dao이름찎히나?"+rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	public int modifyMember(MemberDTO dto) {
		int su = 0;
		String sql = "update member set name=?,pwd=?,gender=?,email1=?,email2=?,tel1=?,tel2=?,tel3=?,zipcode=?,addr1=?,addr2=?,"
				+ "logtime=sysdate where id=?";

		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getEmail1());
			pstmt.setString(5, dto.getEmail2());
			pstmt.setString(6, dto.getTel1());
			pstmt.setString(7, dto.getTel2());
			pstmt.setString(8, dto.getTel3());
			pstmt.setString(9, dto.getZipcode());
			pstmt.setString(10, dto.getAddr1());
			pstmt.setString(11, dto.getAddr2());
			pstmt.setString(12, dto.getId());
			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return su;
	}

	public void writeMember(MemberDTO dto) {
		int su = 0;
		String sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?,?,sysdate)";

		try {
			conn =  ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail1());
			pstmt.setString(6, dto.getEmail2());
			pstmt.setString(7, dto.getTel1());
			pstmt.setString(8, dto.getTel2());
			pstmt.setString(9, dto.getTel3());
			pstmt.setString(10, dto.getZipcode());
			pstmt.setString(11, dto.getAddr1());
			pstmt.setString(12, dto.getAddr2());

			su = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

}
