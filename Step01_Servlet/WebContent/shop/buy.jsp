<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//여기는 서블릿의 service() 메소드 안쪽이라고 생각하면 된다. 

String num=request.getParameter("num");
// int num=Integer.parseInt(request.getParameter("num"));
String type=request.getParameter("type");
System.out.println("num : "+num+", type : "+type);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buy.jsp</title>
</head>
<body>
	<h1>구입 완료</h1>
	<p>구입한 상품 번호 : <strong><%=num %></strong>, 종류 : <strong><%=type %></strong> 입니다.</p>
	<script>
		alert("<%=num%>번 상품 구매에 성공하였습니다.");
	</script>
</body>
</html>