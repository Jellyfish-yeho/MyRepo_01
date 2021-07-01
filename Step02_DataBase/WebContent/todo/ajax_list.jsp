<%@page import="org.json.JSONObject"%>
<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>    
<%
//한 페이지에 몇개의 row를 표시할 것인지
final int PAGE_ROW_COUNT = 5;
//페이지 개수를 몇 개 표시할 것인지
final int PAGE_DISPLAY_COUNT = 5;
//페이지 번호 초기값 지정
int pageNum=1;
//페이지 번호를 파라미터로 가져오기
String strPageNum = request.getParameter("pageNum");
//파라미터 값이 null이 아닐 때 페이지 번호를 이 값으로 지정
if(strPageNum!=null){
	pageNum=Integer.parseInt(strPageNum);
}
//페이지 시작과 끝 값을 일반식으로 작성하여 dto에 넣는다
int startRowNum = 1+(pageNum-1)*PAGE_ROW_COUNT;
int endRowNum = pageNum*PAGE_ROW_COUNT;
TodoDto dto=new TodoDto();
dto.setStartRowNum(startRowNum);
dto.setEndRowNum(endRowNum);

//할일 목록을 출력해 줘야 한다. 
//dao의 참조값을 가지고 와서 목록으로 출력한다. 
TodoDao dao=TodoDao.getInstance();
List<TodoDto> list=dao.getList(dto); //설정한 start/end row number를 dto에 넣어서 list에 전달

String result=JSONObject.valueToString(list);
%>
<%=result %>


