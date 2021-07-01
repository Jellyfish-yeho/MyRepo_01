package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	private static UsersDao dao;
	private UsersDao() {}
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}return dao;
	}
	//id에 대한 부대원 정보를 리턴하는 메소드
	public UsersDto getData(String id) {
		UsersDto dto=null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "select pwd, profile, regdate"
					+ " from users"
					+ " where id=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, id);
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if (rs.next()) {
				dto=new UsersDto();
				dto.setId(id);
				dto.setPwd(rs.getString("pwd"));
				dto.setProfile(rs.getString("profile"));
				dto.setRegdate(rs.getString("regdate"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}return dto;
	}
	
	//인자로 전달한 dto가 기존 정보와 일치하는지 여부를 리턴하는 메소드
	//id, pwd가 모두 일치해야 한다. 
	public boolean isValid(UsersDto dto) {
		boolean isValid=false;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select id"
					+ " from users"
					+ " where id=? and pwd=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				isValid=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return isValid;
	}
	
	//부대원을 db에 추가하는 메소드
	public boolean insert(UsersDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "insert into users"
					+ " (id, pwd, regdate)"
					+ " values(?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			//insert or update or delete 문 수행하고 변화된 row의 개수 리턴받기
			flag = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		if (flag > 0) { //변화된 row 개수가 1이상이면 성공
			return true;
		} else { //변화된 row 개수가 0이하면 실패
			return false;
		}
	}
	
}
