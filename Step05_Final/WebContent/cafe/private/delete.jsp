<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. GET방식 파라미터로 전달되는 삭제할 글번호를 읽어와서
	int num=Integer.parseInt(request.getParameter("num"));	
	//2. 삭제할 글의 작성자와 로그인 아이디가 같은지 비교해서 
	CafeDto dto=new CafeDto();
	String writer=CafeDao.getInstance().getData(num).getWriter();
	String id=(String)session.getAttribute("id");
	if(!writer.equals(id)){
		//금지된 요청이라고 응답하고
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "어딜 감히!");		
		return; //여기서 메소드 종료
	}
	//3. 같으면 db에서 삭제하고 응답
	boolean isSuccess=CafeDao.getInstance().delete(num);
	//4. 다르면 금지된 요청 혹은 잘못된 요청이라고 응답해준다. 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/cafe/private/delete.jsp</title>
</head>
<body>	
	<%if(isSuccess){ %>
		<script>
			alert("your post is successfully deleted.");
			location.href="${pageContext.request.contextPath}/cafe/list.jsp";
		</script>
	<%}else{ %>
		<script>
			alert("failed to delete your post.");
			location.href="detail.jsp?num=<%=num%>";	
		</script>
	<%}%>
</body>
</html>