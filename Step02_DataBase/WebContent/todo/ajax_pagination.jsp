<%@page import="test.todo.dto.TodoDto"%>
<%@page import="java.util.List"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
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

//할일 목록을 출력해 줘야 한다. 
//dao의 참조값을 가지고 와서 목록으로 출력한다. 
TodoDao dao=TodoDao.getInstance();


int startPageNum=1+((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;

//전체 row 개수
int totalRow=dao.getCount();
//전체 page 개수
int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
//페이지의 끝번호가 전체 page 개수보다 크면 전체 페이지 개수를 페이지의 끝번호에 대입
if(totalPageCount < endPageNum){
	endPageNum = totalPageCount;
}

%>
<%if(startPageNum!=1){ %>
	<li class="page-item">
		<a class="page-link" href="javascript:movePage(<%=startPageNum-1%>)">&laquo;</a>
	</li>	
<%} %>				
	<%for(int i=startPageNum; i<=endPageNum; i++) {%>
			<%if(pageNum==i){ %>
			<li class="page-item active">
				<a class="page-link" href="javascript:movePage(<%=i%>)"><%=i%></a>
			</li>
			<%}else{ %>
			<li class="page-item">	
				<a class="page-link" href="javascript:movePage(<%=i%>)"><%=i%></a>
			</li>
			<%} %>		
	<%} %>
<% if(totalPageCount > endPageNum){ %>
	<li class="page-item">
		<a class="page-link" href="javascript:movePage(<%=endPageNum+1%>)">&raquo;</a>
	</li>
<%} %>
	



