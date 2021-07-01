package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.cafe.dto.CafeDto;
import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	private FileDao() {};
	public static FileDao getInstance() {
		if(dao==null) {
			dao=new FileDao();
		}return dao;
	}
	
	//*업로드된 파일의 정보를 db에 저장하는 메소드
	public boolean insert(FileDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "insert into board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " values(board_file_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
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
	//*원하는 페이지의 글 목록을 리턴하는 메소드
	public List<FileDto> getList(FileDto dto){
		//글목록을 담을 arrayList 객체 생성
		List<FileDto> list=new ArrayList<>();
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
					+ " (select num,writer,title,orgFileName,fileSize,regdate"
					+ " from board_file"
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
				FileDto tmp=new FileDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
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
	
	//*전체 글의 개수를 리턴하는 메소드
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
					+ " from board_file";
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
	
	//*제목 검색했을 때 전체 row의 개수 리턴
	public int getCountT(FileDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select nvl(max(rownum),0) as num "
					+ " from board_file"
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
	
	//*작성자 검색했을 때 전체 row의 개수 리턴
	public int getCountW(FileDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select nvl(max(rownum),0) as num "
					+ " from board_file"
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
	
	//*제목,파일명(orgFilename) 검색했을 때 전체 row의 개수 리턴
	public int getCountTF(FileDto dto) {
		int count=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="select nvl(max(rownum),0) as num "
					+ " from board_file"
					+ " where title like '%'||?||'%' "
					+ " or orgFileName like '%'||?||'%'";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getOrgFileName());
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
	
	/* *Title 검색일 때 실행할 메소드
	 * FileDto의 title이라는 필드에 검색 키워드가 들어 있다.
	 */
	public List<FileDto> getListT(FileDto dto){
		//글목록을 담을 arrayList 객체 생성
		List<FileDto> list=new ArrayList<>();
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
					+ " (select num,writer,title,orgFileName,fileSize,regdate"
					+ " from board_file"
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
				FileDto tmp=new FileDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
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
	
	/* *Writer 검색일 때 실행할 메소드
	 * FileDto의 writer이라는 필드에 검색 키워드가 들어 있다.
	 */
	public List<FileDto> getListW(FileDto dto){
		//글목록을 담을 arrayList 객체 생성
				List<FileDto> list=new ArrayList<>();
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
							+ " (select num,writer,title,orgFileName,fileSize,regdate"
							+ " from board_file"
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
						FileDto tmp=new FileDto();
						tmp.setNum(rs.getInt("num"));
						tmp.setWriter(rs.getString("writer"));
						tmp.setTitle(rs.getString("title"));
						tmp.setOrgFileName(rs.getString("orgFileName"));
						tmp.setFileSize(rs.getLong("fileSize"));
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
	
	/* *Title, orgFileName 검색일 때 실행할 메소드
	 * FileDto의 title, orgFileName 이라는 필드에 검색 키워드가 들어 있다.
	 */	
	public List<FileDto> getListTF(FileDto dto){
		//글목록을 담을 arrayList 객체 생성
		List<FileDto> list=new ArrayList<>();
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
					+ " (select num,writer,title,orgFileName,fileSize,regdate"
					+ " from board_file"
					+ " where title like '%'||?||'%' "
					+ " or orgFileName like '%'||?||'%'"
					+ " order by num desc) result1)"
					+ " where rnum between ? and ?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getOrgFileName());
			pstmt.setInt(3, dto.getStartRowNum());
			pstmt.setInt(4, dto.getEndRowNum());
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			//반복문 돌면서 ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			while(rs.next()) {
				FileDto tmp=new FileDto();
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
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
	
	//*글 하나의 정보를 삭제하는 메소드
	public boolean delete(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int flag = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql = "delete from board_file"
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

	
	//*글 번호로 글 하나의 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		FileDto dto=null;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			//Connection 객체의 참조값 얻어오기
			conn=new DbcpBean().getConn();
			//실행할 sql문 작성
			String sql="SELECT num,title,writer,orgFileName,saveFileName,"
					+ "fileSize,regdate" + 
					" FROM board_file" + 
					" WHERE num=?";
			//PreparedStatement 객체의 참조값 얻어오기
			pstmt=conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 바인딩
			pstmt.setInt(1,num);
			//select 문 수행 결과를 ResultSet으로 받아오기
			rs=pstmt.executeQuery();
			// ResultSet객체에 있는 내용을 추출해서 원하는 Data Type으로 포장하기
			if(rs.next()) {
				dto=new FileDto();
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
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

}
