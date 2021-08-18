<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	//sample data
	request.setAttribute("msg", "abcde온유1004");
	request.setAttribute("str", "<div></div>는 문단을 나타내는 요소입니다.");
	request.setAttribute("content", "온유\n민호\n키\n태민");
	request.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test07.jsp</title>
</head>
<body>
	<h1>JSTL function (EL 코드 블럭 안에서 사용하는 함수) 활용</h1>
	<p>"온유"가 포함되어 있는지 여부 : <strong>${fn:contains(msg,'온유')}</strong></p>
	
	<c:if test="${fn:contains(msg,'온유')}">
		<p>메세지에 "온유"가 포함되어 있습니다.</p>
	</c:if>
	
	<hr />
	
	<p>${str}</p>
	<p>${fn:escapeXml(str)}</p>
	
	<hr />
	
	<p>${content}</p>
	<p>${fn:replace(content,newLine,'<br>')}</p>
</body>
</html>