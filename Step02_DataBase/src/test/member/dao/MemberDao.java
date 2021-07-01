package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	private static MemberDao dao;
	//외부에서 객체 생성하지 못하도록
	private MemberDao() {}
	//자신의 참조값을 리턴해주는 공개 메소드
	public static MemberDao getInstance() {
		if(dao==null) {
			dao=new MemberDao();
		}return dao;
	}
	//회원 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		//회원목록을 담을 객체 생성
		List<MemberDto> list=new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//conn=new DBConnect().getConn();
			//실행할 sql문 작성
			String sql="select num,name,addr"
					+" from member"
					+" order by num asc";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while(rs.next()) {
				//현재 커서가 위치한 곳의 num, name, addr 칼럼에 있는 데이터를 읽어와서 담기
				MemberDto dto=new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//회원 한명의 정보가 담긴 MemberDto 객체의 참조값을 list에 누적시키기
				list.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close(); //Close() 하면 자동으로 Connection Pool 에 반납된다. 
			}catch(Exception e) {
				
			}
		}		
		return list;
	}
	//회원 정보를 db에 저장하는 메소드
	public boolean insert(MemberDto dto) { //작업의 성공/실패여부를 boolean으로 알려준다.
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="insert into member"
					+" (num, name, addr)"
					+" values(member_seq.nextval,?,?)";
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			//1번째 ?에 dto에 있는 회원의 이름을 읽어와서 바인딩
			pstmt.setString(1, dto.getName());
			//2번째 ?에 dto에 있는 회원의 주소를 읽어와서 바인딩
			pstmt.setString(2, dto.getAddr());
			//insert or update or delete 문 수행하고 변화된 row의 개수 리턴받기
			flag=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();  
			}catch(Exception e) {				
			}
		}
		if(flag>0) { //변화된 row 개수가 1이상이면 성공
			return true;
		}else { //변화된 row 개수가 0이하면 실패
			return false;
		}
	}
	//회원 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "delete from member"
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
	//회원정보 수정
	public boolean update(MemberDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "update member"
					+" set name=?, addr=?"
					+" where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
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
	//회원 한명의 정보를 리턴하는 메소드
	public MemberDto getData(int num) {
		//리턴해줄 객체의 참조값을 담을 지역변수 만들기
		MemberDto dto=null;		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select name, addr"
					+" from member"
					+" where num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, num);
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//만일 select된 row가 있다면 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				dto = new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
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
	   //원하는 페이지의 회원 목록을 리턴하는 메소드
	   public List<MemberDto> getList(MemberDto dto){
	      //회원목록을 담을 객체 생성
	      List<MemberDto> list=new ArrayList<>();
	      
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         //Connection 객체의 참조값 얻어오기 
	         conn = new DbcpBean().getConn();
	         //실행할 sql 문 작성
	         String sql = "SELECT *" + 
	               " FROM" + 
	               "   (SELECT result1.*, ROWNUM AS rnum" + 
	               "   FROM" + 
	               "      (SELECT num,name,addr" + 
	               "      FROM member" + 
	               "      ORDER BY num desc) result1)" + 
	               " WHERE rnum >= ? AND rnum <= ?";
	         //PreparedStatement 객체의 참조값 얻어오기
	         pstmt = conn.prepareStatement(sql);
	         //? 에 바인딩할 내용이 있으면 여기서 바인딩
	         pstmt.setInt(1, dto.getStartRowNum());
	         pstmt.setInt(2, dto.getEndRowNum());
	         //select 문 수행하고 결과를 ResultSet 으로 받아오기
	         rs = pstmt.executeQuery();
	         //반복문 돌면서 ResultSet 객체에 있는 내용을 추출해서 원하는 Data type 으로 포장하기
	         while (rs.next()) {
	            //MemberDto 객체를 생성해서 
	            MemberDto tmp=new MemberDto();
	            //현재 커서가 위치한 곳의  num 칼럼, name 칼럼, addr 칼럼에 있는 데이터를 읽어와서 담기
	            tmp.setNum(rs.getInt("num"));
	            tmp.setName(rs.getString("name"));
	            tmp.setAddr(rs.getString("addr"));
	            //회원 한명의 정보가 담긴 MemberDto 객체의 참조값을 List 에 누적 시키기
	            list.add(tmp);
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
	               conn.close(); // close() 하면 자동으로 Connection Pool 에 반납된다.
	         } catch (Exception e) {
	         }
	      }
	      //회원 목록 리턴해주기 
	      return list;
	   }
	  //전체 row의 개수를 리턴해주는 메소드
	  public int getCount() {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select max(rownum) as num from member";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//만일 결과가 있으면 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
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
			}catch(Exception e) {}
		}return count;	
	} 
}



