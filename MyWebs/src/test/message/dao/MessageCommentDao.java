package test.message.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.message.dto.MessageCommentDto;
import test.util.DbcpBean;

public class MessageCommentDao {
	private static MessageCommentDao dao;
	private MessageCommentDao() {}
	static {
		dao=new MessageCommentDao();
	}
	public static MessageCommentDao getInstance() {
		return dao;
	}
	//글번호로 댓글 개수를 가져오는 메소드
	public int getCount(int ref_group) {
		int count=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "SELECT NVL(MAX(ROWNUM),0) AS count"
					+ " FROM board_cafe_comment"
					+ " WHERE ref_group=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, ref_group);
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if (rs.next()) {
				count=rs.getInt("count");	
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
		}return count;
	}	
	
	//댓글 수정 
	public boolean update(MessageCommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "UPDATE board_cafe_comment"
					+ " SET content=?"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getContent());
			pstmt.setInt(2, dto.getNum());
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
	
	//댓글 삭제  : deleted를 yes로 수정
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "UPDATE board_cafe_comment"
					+ " SET deleted='yes'"
					+ " WHERE num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, num);
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
	
	//댓글 목록을 리턴해주는 메소드 : board_cafe_comment + users(profile) + 페이징처리(rnum)
	public List<MessageCommentDto> getList(MessageCommentDto dto){
		List<MessageCommentDto> list=new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "SELECT *" + 
					"FROM" + 
					"   (SELECT result1.*, ROWNUM AS rnum" + 
					"   FROM" + 
					"      (SELECT num, writer, content, target_id, ref_group," + 
					"      comment_group, deleted, board_cafe_comment.regdate, profile" + 
					"      FROM board_cafe_comment" + 
					"      INNER JOIN users " + 
					"      ON board_cafe_comment.writer = users.id" + 
					"      WHERE ref_group=?" + 
					"      ORDER BY comment_group DESC, num ASC) result1)" + 
					"WHERE rnum BETWEEN ? AND ?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, dto.getRef_group());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while (rs.next()) {
				MessageCommentDto dto2=new MessageCommentDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setContent(rs.getString("content"));
				dto2.setTarget_id(rs.getString("target_id"));
				dto2.setRef_group(rs.getInt("ref_group"));
				dto2.setComment_group(rs.getInt("comment_group"));
				dto2.setDeleted(rs.getString("deleted"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setProfile(rs.getString("profile"));
				list.add(dto2);
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
		}return list;
	}
	
	//댓글의 시퀀스 값을 리턴
	public int getSequence() {
		int seq=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "SELECT board_cafe_comment_seq.NEXTVAL AS seq"
					+ " FROM DUAL";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩

			//select 문 수행 결과를 ResultSet으로 받아오기
			rs = pstmt.executeQuery();
			// ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if (rs.next()) {
				seq=rs.getInt("seq");
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
		}return seq;
	}
	
	//댓글 추가
	public boolean insert(MessageCommentDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "INSERT INTO board_cafe_comment"
					+ " (num, writer, content, target_id, ref_group, comment_group, regdate)"
					+ " values(?, ?, ?, ?, ?, ?, SYSDATE)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, dto.getNum());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3,dto.getContent());
			pstmt.setString(4, dto.getTarget_id());
			pstmt.setInt(5, dto.getRef_group());
			pstmt.setInt(6, dto.getComment_group());
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
