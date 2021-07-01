package test.todo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.todo.dto.TodoDto;
import test.util.DbcpBean;

public class TodoDao {
	private static TodoDao dao;
	private TodoDao() {}
	public static TodoDao getInstance() {
		if(dao==null) {
			dao=new TodoDao();
		}return dao;
	}
	//할일 1개 선택 : select - pk
	public TodoDto getData(int num){
		TodoDto dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select num, content, to_char(regdate, 'yyyy.mm.dd am hh:mi') as regdate"
					+" from todo"
					+" where num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, num);
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//
			if(rs.next()) {
				dto=new TodoDto();
				dto.setNum(num);
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return dto;
	}
	
	//할일 목록 리턴 : select 
	public List<TodoDto> getList(){
		//dto를 담을 list 객체 생성
		List<TodoDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select num, content, to_char(regdate,'yyyy.mm.dd am hh:mi') as regdate"
					+" from todo"
					+" order by num asc";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while(rs.next()) {
				//dto 객체를 생성해서 num,  content, regdate를 넣어준다
				TodoDto dto=new TodoDto();
				dto.setNum(rs.getInt("num"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				//dto를 list에 누적한다
				list.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return list;//list 를 리턴해 준다
	}
	
	//할일 추가 : insert
	public boolean insert(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "insert into todo"
					+" (num, content, regdate)"
					+" values(todo_seq.nextval, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getContent());
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
	
	//할일 수정 : update
	public boolean update(TodoDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "update todo"
					+" set content=?"
					+" where num=?";
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
	
	//할일 삭제 : delete + pk
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "delete from todo"
					+" where num=?";
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
	
	//원하는 페이지의 할일 목록을 리턴하는 메소드
	public List<TodoDto> getList(TodoDto dto){
		//dto를 담을 list 객체 생성
		List<TodoDto> list=new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select *"
					+ " from"
					+ " (select result1.*, rownum as rnum"
					+ " from"
					+ " (select num, content, regdate"
					+ " from todo"
					+ " order by num desc) result1)"
					+ " where rnum>=? and rnum<=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while(rs.next()) {
				//dto 객체를 생성해서 num, content, regdate를 넣어준다
				TodoDto tmp=new TodoDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setContent(rs.getString("content"));
				tmp.setRegdate(rs.getString("regdate"));
				//tmp를 list에 누적한다
				list.add(tmp);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return list;//list 를 리턴해 준다
	}
	//max(rownum)= 전체 row 개수를 얻는 메소드	
	public int getCount() {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select max(rownum) as num from todo";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//결과값이 있을 때 ResultSet객체에 있는 내용을 추출해서 count에 넣기
			if(rs.next()) {
				count=rs.getInt("num");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				
			}
		}return count;
	}
}
