<%@page import="test.message.dao.MessageCommentDao"%>
<%@page import="test.message.dto.MessageCommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//폼에서 전송되는 파라미터 추출
	int ref_group=Integer.parseInt(request.getParameter("ref_group"));
	String target_id=request.getParameter("target_id");
	String content=request.getParameter("content");
	
	//일반 댓글은 comment_group 번호가 null, 대댓글은 comment_group 번호가 있다. 
	String comment_group=request.getParameter("comment_group");
	
	//댓글 작성자 = 로그인 아이디
	String id = (String)session.getAttribute("id");
	//시퀀스 번호 = 댓글의 글 번호
	int seq=MessageCommentDao.getInstance().getSequence();
	//dto에 저장하기 
	MessageCommentDto dto=new MessageCommentDto();
	dto.setWriter(id);	
	dto.setNum(seq);
	dto.setRef_group(ref_group);
	dto.setTarget_id(target_id);
	dto.setContent(content);

	//일반 댓글
	if(comment_group==null){
		//댓글의 글 번호 = comment_group 번호
		dto.setComment_group(seq);
	}else{ //대댓글
		//전송된 comment_group번호를 숫자로 바꾸어 dto에 넣어준다. 
		dto.setComment_group(Integer.parseInt(comment_group));
	}
	//db에 댓글 정보 저장하기
	MessageCommentDao.getInstance().insert(dto);
	//redirect 응답 : 글 자세히보기 페이지로 새로고침 이동
	response.sendRedirect(request.getContextPath()+"/message/detail.jsp?num="+ref_group);

%>

