<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//get방식 파라미터로 전달되는 삭제할 파일의 번호를 읽어온다
	int num=Integer.parseInt(request.getParameter("num"));
	//삭제할 파일 정보를 읽어온다.
	FileDto dto=FileDao.getInstance().getData(num);
	//session 영역에 저장된 id를 읽어온다.
	String id=(String)session.getAttribute("id");
	//로그인된 아이디와 파일의 업로더가다르면
	if(!id.equals(dto.getWriter())){
		//금지된 요청이라고 응답한다.
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "you cannot remove other user's file.");
		return;
	}
	//1. 파일 시스템에서 실제 파일을 삭제
	//new File ("삭제할 파일의 절대경로(파일시스템에서의 경로)") 이므로
	//=> 삭제할 파일의 파일시스템 상에서의 절대경로 얻어오기
	String path=request.getServletContext().getRealPath("/upload")+
			File.separator+dto.getSaveFileName();
	File file=new File(path);
	file.delete();
	//2. DB에서 파일 정보 삭제
	FileDao.getInstance().delete(num);
	//3. 응답
	String cPath=request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");
%>
