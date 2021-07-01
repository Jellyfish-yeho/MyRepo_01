<%@page import="java.io.File"%>
<%@page import="test.message.dao.MessageDao"%>
<%@page import="test.message.dto.MessageDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getServletContext().getRealPath("/upload");
	File file = new File(path);
	if(!file.exists()){
	   file.mkdir();
	}
	MultipartRequest mr = new MultipartRequest(request,   //HttpServletRequest
		path,   //파일을 저장할 경로
		1024*1024*10,   //최대 업로드 사이즈 제한
		"utf-8",   //한글 파일명 깨지지 않도록 인코딩 설정
		new DefaultFileRenamePolicy() //동일한 파일명이 있으면 자동으로 파일명 바궈서 저장하도록 한다.
	);
	File myFile = mr.getFile("image");
	String saveFileName = mr.getFilesystemName("image");
	String imagePath="/upload/"+saveFileName;
	
	
	//폼에서 제목, 카테고리, 내용 파라미터 값 읽어오기
	String title=request.getParameter("title");
	String category=request.getParameter("category");
	String content=request.getParameter("content");
	//session에서 id 가져오기 (id = 작성자)
	String writer=(String)session.getAttribute("id");
	//dto에 담아서 dao에 저장하기
	MessageDto dto=new MessageDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setCategory(category);
	dto.setContent(content);
	dto.setImage(imagePath);
	boolean isSuccess=MessageDao.getInstance().insert(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/message/private/insert.jsp</title>
</head>
<body>
	<div class="container">
		<h1>게시글 작성</h1>
			<%if(isSuccess){ %>
				<script>
					alert("게시글을 작성하였습니다.");
					location.href="${pageContext.request.contextPath}/message/list.jsp";
				</script>
			<%}else{ %>
				<script>
					alert("게시글 작성 실패하였습니다.");
					location.href="${pageContext.request.contextPath}/message/private/insert_form.jsp";
				</script>
			<%} %>
	</div>
</body>
</html>