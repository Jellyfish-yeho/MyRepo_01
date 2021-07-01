<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파일을 업로드할 절대 경로를 메소드를 통해서 얻어오기 (WebContent 하위의 upload 폴더)
	String path=request.getServletContext().getRealPath("/upload");
	//경로 확인해 보기
	System.out.println(path);	
	//만일 폴더가 만들어져 있지 않다면 폴더를 만든다
	File file=new File(path);
	if(!file.exists()){
		file.mkdir();
	}
	//cos.jar에서 제공해주는 MultipartRequest 객체 생성하기
	MultipartRequest mr=new MultipartRequest(request, //HttpServletRequest
			path, //파일을 저장할 경로
			1024*1024*100, //최대 업로드 사이즈 제한
			"utf-8", //한글 파일명 깨지지 않도록 인코딩 설정
			new DefaultFileRenamePolicy()); //동일한 파일명이 있으면 자동으로 파일명 바꿔서 저장하도록
	//MultipartRequest 객체가 성공적으로 실행되면 파일 업로드가 성공한 것이다. 
	//전송된 문자열과 파일 정보는 mr객체의 메소드를 통해서 얻어낼 수 있다. 
	
	//<input type="text" name="title"/>에 입력한 문자열 얻어오기
	String title=mr.getParameter("title");
	//<input type="file" name="myFile" />을 통해서 업로드된 파일을 access할 수 있는 File 객체
	// => 파일의 이름, 크기 등 정보도 알아낼 수 있고 삭제도 가능함
	File myFile=mr.getFile("myFile");	
	//파일의 크기 (byte)
	long fileSize=myFile.length();
	//원본 파일명
	String orgFileName=mr.getOriginalFileName("myFile");
	/*
		파일 시스템에 저장된 파일명
		- upload 폴더 안에 동일한 이름의 파일이 없으면 원본 파일명과 동일하게 저장된다.
		- upload 폴다 안에 동일한 이름의 파일이 있으며 파일명 뒤에 1, 2, 3... 숫자를 자동으로 부여해서 저장한다.
		ex) image.jpg imge.jpg,image2.jpg...
		=> 원본 파일명 : 파일 목록 출력 시 필요 / 저장된 파일명 : 파일 다운로드 시 필요
	*/
	String saveFileName=mr.getFilesystemName("myFile");
	// title, writer, fileSize, orgFileName, saveFilename을 db에 저장
	
	//업로더는 로그인된 아이디이다. 
	String writer=(String)session.getAttribute("id");
	//업로드된 파일의 정보를 FileDto 객체에 담고
	FileDto dto=new FileDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setOrgFileName(orgFileName);
	dto.setSaveFileName(saveFileName);
	dto.setFileSize(fileSize);
	//DB에 저장한다.
	boolean isSuccess=FileDao.getInstance().insert(dto);
	//응답한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/file/private/upload.jsp</title>
</head>
<body>
	<div class="container">
		<h1>Alert</h1>
		<%if(isSuccess){ %>
			<p>
				File is successfully uploaded. 
				<a href="../list.jsp">back to list</a>
			</p>
		<%}else{ %>
			<p>
				File upload failed.
				<a href="upload_form.jsp">try again</a>
			</p>
		<%} %>
	</div>
</body>
</html>





