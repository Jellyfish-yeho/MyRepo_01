<%@page import="test.member.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="test.member.dao.MemberDao"%>
<%@page import="test.util.DbcpBean"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=5;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
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
	
	//MemberDto 객체에 startRowNum, endRowNum을 담는다.
	MemberDto dto=new MemberDto();
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//테스트로 Connection 객체의 참조값 얻어와 보기
	//Connection conn=new DbcpBean().getConn();

	//회원 목록 얻어오기 (한번에)
	//List<MemberDto> list = MemberDao.getInstance().getList();
	
	//나눠서
	//MemberDao 객체의 참조값을 얻어와서
	MemberDao dao=MemberDao.getInstance();
	//회원목록 얻어오기
	List<MemberDto> list = dao.getList(dto);
	
   //하단 시작 페이지 번호 
   int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
   //하단 끝 페이지 번호
   int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
   
   //전체 row의 개수
   int totalRow=dao.getCount();
   //전체 페이지의 개수
   int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
   //끝 페이지 번호가 전체 페이지 갯수보다 크다면 잘못된 값이다. 
   if(endPageNum > totalPageCount){
	   endPageNum=totalPageCount; //보정해 준다. 
   }
   
   
 %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/member/list.jsp</title>
<jsp:include page="../include/resource.jsp"></jsp:include>
<style>
	.page-ui a{
		text-decoration: none;
		color: #000;
	}
	.page-ui a:hover{
		text-decoration: underline;
	}
	.page-ui a.active{
		color: red;
		font-weight: bold;
		text-decoration: underline;
	}
	.page-ui ul{
		list-style-type:none;
		padding:0;
	}
	.page-ui ul > li {
		float:left;
		padding:5px;
	}
</style>
</head>
<body>
<%--
	include 되는 jsp 페이지에 파라미터를 전달할 수 있다. 
	"thisPage" 라는 파라미터 명으로 "member"라는 문자열을 navbar.jsp에 요청 파라미터로 전달
	마치
	navbar.jsp?thisPage=member
	가 요청되는 효과와 비슷하다. 
	따라서 navbar.jsp 페이지에서는
	String thisPage=request.getParameter("thisPage"); 
	와 같은 코드로 "member" 문자열을 읽어낼 수 있다. 
 --%>
	<jsp:include page="../include/navbar.jsp">
		<jsp:param value="member" name="thisPage"/>
	</jsp:include>
	<div class="container mt-3 mb-5">
		<nav aria-label="breadcrumb">
		  <ol class="breadcrumb">
		    <li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index.jsp">Index</a></li>
		    <li class="breadcrumb-item active" aria-current="page">Member List</li>
		  </ol>
		</nav>
		<a href="insertform.jsp">
			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
			  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
			  <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
			</svg>
			<span class="visually-hidden">새 회원 추가</span>
		</a>
		<table class="table table-sm table-striped">
			<thead class="table-dark">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<%for(MemberDto tmp:list){ %>
					<tr>
						<td><%=tmp.getNum() %></td>
						<td><%=tmp.getName() %></td>
						<td><%=tmp.getAddr() %></td>	
						<td>
							<a href="updateform.jsp?num=<%=tmp.getNum()%>">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
									  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
								<span class="visually-hidden">회원 정보 수정</span>
							</a>
						</td>	
						<td>
							<a href="delete.jsp?num=<%=tmp.getNum()%>">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
							  		<path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
								</svg>
								<span class="visually-hidden">회원 정보 삭제</span>
							</a>
						</td>			
					</tr>
				<%} %>	
			</tbody>
		</table>
		<div class="page-ui clearfix">
			<ul>
				<%if(startPageNum!=1){ %>
					<li>
						<a href="list.jsp?pageNum=<%=startPageNum-1%>">Prev</a>
					</li>	
				<%} %>				
				<%for(int i=startPageNum;i<=endPageNum;i++){ %>
					<li>
					<%if(pageNum==i){ %>
						<a class="active" href="list.jsp?pageNum=<%=i%>"><%=i %></a>
					<%}else{ %>
						<a href="list.jsp?pageNum=<%=i%>"><%=i %></a>
					<%}%>
					</li>
				<%} %>						
				<%if(endPageNum < totalPageCount) {%>
					<li>
						<a href="list.jsp?pageNum=<%=endPageNum+1%>">Next</a>
					</li>
				<%} %>	
			</ul>		
		</div>
<!-- pagination -->
		<nav>
			<ul class="pagination pagination-sm">
				<%if(startPageNum!=1){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>" tabindex="-1">&laquo;</a>
					</li>
				<%}else{ %>	
					<li class="page-item disabled">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1%>" tabindex="-1">&laquo;</a>
					</li>
				<%} %>
				<%for(int i=startPageNum;i<=endPageNum;i++){ %>
					<%if(pageNum==i){ %>
						<li class="page-item active">					
							<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i%></a>
						</li>
					<%}else{ %>	
						<li class="page-item">
							<a class="page-link" href="list.jsp?pageNum=<%=i%>"><%=i%></a>
						</li>
					<%}%>
				<%}%>	
				<%if(endPageNum < totalPageCount) {%>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">&raquo;</a>
					</li>
				<%}else{ %>
					<li class="page-item disabled">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1%>">&raquo;</a>
					</li>
				<%}%>	
			</ul>
		</nav>		
	</div>
</body>
</html>




