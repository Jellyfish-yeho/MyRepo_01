package test.cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.util.DbcpBean;

public class CafeDao {
	private static CafeDao dao;
	private CafeDao() {}
	public static CafeDao getInstance() {
		if(dao==null) {
			dao=new CafeDao();
		}return dao;
	}
	//글 하나의 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "delete from board_cafe"
					+ "	where num=?";
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
	//조회수 증가시키는 메소드
	public boolean addViewCount(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "update board_cafe"
					+ "	set viewCount=viewCount+1"
					+ " where num=?";
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
	
	//글 하나의 정보를 수정하는 메소드
	public boolean update(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "update board_cafe"
					+ " set title=?, content=?"
					+ " where num=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
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
	//글 번호로 글 하나의 정보를 리턴하는 메소드
	public CafeDto getData(int num) {
		CafeDto dto2=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="SELECT num,writer,title,content,viewCount,regdate"
					+ " FROM board_cafe"
					+ " WHERE num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, num);
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			// ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				dto2=new CafeDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setContent(rs.getString("content"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return dto2;
	}
	
	//글 번호로 글 하나의 정보를 리턴하는 메소드
	public CafeDto getData(CafeDto dto) {
		CafeDto dto2=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="SELECT *" + 
					" FROM" + 
					"   (SELECT num,title,writer,content,viewCount,regdate," + 
					"   LAG(num, 1, 0) OVER(ORDER BY num DESC) AS prevNum," + 
					"   LEAD(num, 1, 0) OVER(ORDER BY num DESC) nextNum" + 
					"   FROM board_cafe" + 
					"   ORDER BY num DESC)" + 
					" WHERE num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, dto.getNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			// ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				dto2=new CafeDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setContent(rs.getString("content"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setPrevNum(rs.getInt("prevNum"));
				dto2.setNextNum(rs.getInt("nextNum"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return dto2;
	}
	//제목 검색
	public CafeDto getDataT(CafeDto dto) {
		CafeDto dto2=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="SELECT *" + 
					" FROM" + 
					"   (SELECT num,title,writer,content,viewCount,regdate," + 
					"   LAG(num, 1, 0) OVER(ORDER BY num DESC) AS prevNum," + 
					"   LEAD(num, 1, 0) OVER(ORDER BY num DESC) nextNum" + 
					"   FROM board_cafe" +
					"   where title like '%'||?||'%'" +
					"   ORDER BY num DESC)" + 
					" WHERE num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setInt(2, dto.getNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			// ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				dto2=new CafeDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setContent(rs.getString("content"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setPrevNum(rs.getInt("prevNum"));
				dto.setNextNum(rs.getInt("nextNum"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return dto2;
	}
	
	//작성자 검색
	public CafeDto getDataW(CafeDto dto) {
		CafeDto dto2=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="SELECT *" + 
					" FROM" + 
					"   (SELECT num,title,writer,content,viewCount,regdate," + 
					"   LAG(num, 1, 0) OVER(ORDER BY num DESC) AS prevNum," + 
					"   LEAD(num, 1, 0) OVER(ORDER BY num DESC) nextNum" + 
					"   FROM board_cafe" +
					"   where writer like '%'||?||'%'" +
					"   ORDER BY num DESC)" + 
					" WHERE num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setInt(2, dto.getNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			// ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				dto2=new CafeDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setContent(rs.getString("content"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setPrevNum(rs.getInt("prevNum"));
				dto.setNextNum(rs.getInt("nextNum"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return dto2;
	}
	
	//제목+내용 검색
	public CafeDto getDataTC(CafeDto dto) {
		CafeDto dto2=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="SELECT *" + 
					" FROM" + 
					"   (SELECT num,title,writer,content,viewCount,regdate," + 
					"   LAG(num, 1, 0) OVER(ORDER BY num DESC) AS prevNum," + 
					"   LEAD(num, 1, 0) OVER(ORDER BY num DESC) nextNum" + 
					"   FROM board_cafe" +
					"   where title like '%'||?||'%' or content like '%'||?||'%'" +
					"   ORDER BY num DESC)" + 
					" WHERE num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			// ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				dto2=new CafeDto();
				dto2.setNum(rs.getInt("num"));
				dto2.setWriter(rs.getString("writer"));
				dto2.setTitle(rs.getString("title"));
				dto2.setContent(rs.getString("content"));
				dto2.setViewCount(rs.getInt("viewCount"));
				dto2.setRegdate(rs.getString("regdate"));
				dto2.setPrevNum(rs.getInt("prevNum"));
				dto.setNextNum(rs.getInt("nextNum"));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {}
		}return dto2;
	}
	
	//새 글 저장하는 메소드
	public boolean insert(CafeDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "insert into board_cafe"
					+ " (num, writer, title, content, viewCount, regdate)"
					+ " values(board_cafe_seq.nextval, ?, ?, ?, 0, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
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
	
	//원하는 페이지의 글 목록을 리턴하는 메소드
	public List<CafeDto> getList(CafeDto dto){
		//글목록을 담을 arrayList 객체 생성
		List<CafeDto> list=new ArrayList<>();
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
					+ " (select num,writer,title,viewCount,regdate"
					+ " from board_cafe"
					+ " order by num desc) result1)"
					+ " where rnum between ? and ?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while(rs.next()) {
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
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
		}return list;
	}
	
	//전체 글의 개수를 리턴하는 메소드
	public int getCount() {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select nvl(max(rownum),0) as num "
					+ " from board_cafe";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
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
	
	//제목 검색했을 때 전체 row의 개수 리턴
	public int getCountT(CafeDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select nvl(max(rownum),0) as num "
					+ " from board_cafe"
					+ " where title like '%'||?||'%'";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
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
	
	//작성자 검색했을 때 전체 row의 개수 리턴
	public int getCountW(CafeDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select nvl(max(rownum),0) as num "
					+ " from board_cafe"
					+ " where writer like '%'||?||'%'";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getWriter());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
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
	
	//제목,내용 검색했을 때 전체 row의 개수 리턴
	public int getCountTC(CafeDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select nvl(max(rownum),0) as num "
					+ " from board_cafe"
					+ " where title like '%'||?||'%' or content like '%'||?||'%'";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
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
	
	/* Title 검색일 때 실행할 메소드
	 * CafeDto의 title이라는 필드에 검색 키워드가 들어 있다.
	 */
	public List<CafeDto> getListT(CafeDto dto){
		//글목록을 담을 arrayList 객체 생성
		List<CafeDto> list=new ArrayList<>();
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
					+ " (select num,writer,title,viewCount,regdate"
					+ " from board_cafe"
					+ " where title like '%'||?||'%'"
					+ " order by num desc) result1)"
					+ " where rnum between ? and ?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setInt(2, dto.getStartRowNum());
			pstmt.setInt(3, dto.getEndRowNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while(rs.next()) {
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
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
		}return list;
	}
	
	/* Writer 검색일 때 실행할 메소드
	 * CafeDto의 writer이라는 필드에 검색 키워드가 들어 있다.
	 */
	public List<CafeDto> getListW(CafeDto dto){
		//글목록을 담을 arrayList 객체 생성
				List<CafeDto> list=new ArrayList<>();
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
							+ " (select num,writer,title,viewCount,regdate"
							+ " from board_cafe"
							+ " where writer like '%'||?||'%'"
							+ " order by num desc) result1)"
							+ " where rnum between ? and ?";
					//PreparedStatement 객체의 참조값 얻어오기
					pstmt=conn.prepareStatement(sql);
					//? 에 바인딩할 내용이 있으면 여기서 바인딩
					pstmt.setString(1, dto.getWriter());
					pstmt.setInt(2, dto.getStartRowNum());
					pstmt.setInt(3, dto.getEndRowNum());
					//select 문 수행 결과를 ResultSet으로 받아오기
					rs=pstmt.executeQuery();
					//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
					while(rs.next()) {
						CafeDto tmp=new CafeDto();
						tmp.setNum(rs.getInt("num"));
						tmp.setWriter(rs.getString("writer"));
						tmp.setTitle(rs.getString("title"));
						tmp.setViewCount(rs.getInt("viewCount"));
						tmp.setRegdate(rs.getString("regdate"));
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
				}return list;
	}
	
	/* Title, Content 검색일 때 실행할 메소드
	 * CafeDto의 title, content 이라는 필드에 검색 키워드가 들어 있다.
	 */	
	public List<CafeDto> getListTC(CafeDto dto){
		//글목록을 담을 arrayList 객체 생성
		List<CafeDto> list=new ArrayList<>();
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
					+ " (select num,writer,title,viewCount,regdate"
					+ " from board_cafe"
					+ " where title like '%'||?||'%' or content like '%'||?||'%'"
					+ " order by num desc) result1)"
					+ " where rnum between ? and ?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getStartRowNum());
			pstmt.setInt(4, dto.getEndRowNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while(rs.next()) {
				CafeDto tmp=new CafeDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setRegdate(rs.getString("regdate"));
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
		}return list;
	}
}
