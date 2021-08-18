<%@page import="test.users.dao.UsersDao"%>
<%@page import="test.users.dto.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-light navbar-expand-sm" style="background-color: #79E5CB;">
	<div class="container">
		<a class="navbar-brand" href="${pageContext.request.contextPath}/"> 
			<img src="${pageContext.request.contextPath}/BerryBerry.png" alt="" width="45" height="40">
			Hello, world!
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav me-auto">
			<li class="nav-item">
				<a class="nav-link ${param.thisPage eq 'cafe' ? 'active' : '' }" 
				href="${pageContext.request.contextPath}/cafe/list.jsp">Post</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ${param.thisPage eq 'file' ? 'active' : '' }" href="${pageContext.request.contextPath}/file/list.jsp">Library</a>
			</li>
			<li class="nav-item">
				<a class="nav-link ${param.thisPage eq 'gallery' ? 'active' : '' }" href="${pageContext.request.contextPath}/gallery/list.jsp">Gallery</a>
			</li>
		</ul>
		<c:choose>
			<c:when test="${empty id}">
				<a class="btn btn-info btn-sm me-2" href="${pageContext.request.contextPath}/users/signup_form.jsp">sign-up</a>
				<a class="btn btn-success btn-sm me-2" href="${pageContext.request.contextPath}/users/loginform.jsp">log-in</a>
			</c:when>
			<c:otherwise>
				<c:when test="${empty dto.profile}">
					<svg id="profileImage" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle me-2" viewBox="0 0 16 16">
						<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
						<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				</c:when>
				<c:otherwise>
						<img class="me-2" id="profileImage" src="${pageContext.request.contextPath}${dto.profile}" width="50" height="50" />
				</c:otherwise>
					<span class="navbar-text me-2">
						<a href="${pageContext.request.contextPath}/users/private/info.jsp">${id}</a> is logged in.
					</span>
					<a class="btn btn-danger btn-sm me-2" href="${pageContext.request.contextPath}/users/logout.jsp">Log-out</a>
			</c:otherwise>
		</c:choose>
		
		</div>
     </div>
  </nav>
