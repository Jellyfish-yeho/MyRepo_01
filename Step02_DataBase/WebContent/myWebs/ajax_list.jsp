<%@page import="myWebsDao.MyDao"%>
<%@page import="MyWebsDto.MyDto"%>
<%@page import="org.json.JSONObject"%>

<%@page import="java.util.List"%>
<%--
	json 문자열을 응답할 때는 contentType="application/json; charset=UTF-8"
	상단 공백을 제거하고 싶으면 trimDirectiveWhitespaces="true" 로 설정한다.
 --%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=10;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
	   //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
	   pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//MemberDto 객체에 startRowNum 과 endRowNum 을 담는다.
	MyDto dto=new MyDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//MemberDao 객체의 참조값 얻어와서 
	MyDao dao=MyDao.getInstance();
	//회원목록 얻어오기 
	List<MyDto> list=dao.getList(dto);
	//JSONObject의 static 메소드를 이용해서 List에 있는 내용을 JSON 문자열로 변환하기
	String result=JSONObject.valueToString(list);
%>    
<%=result %>









