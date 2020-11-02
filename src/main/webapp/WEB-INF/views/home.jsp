<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<!-- jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<title>BMS HOME</title>
</head>
<body>
	<header>Header</header>
	<hr />
	${sessionScope}
	<nav class="navbar navbar-expand bg-light">
		<a class='navbar-brand' href='${pageContext.request.contextPath}/home'>BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<c:if test="${sessionScope.USERID_SESSION eq nll}">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/join">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.USERID_SESSION ne nll}">
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/member/logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/board/list">게시판</a></li>
				</c:if>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class='container'>
				<div class='row'>
					<div class='col-sm'>Hello, World.</div>
					<div class='col-sm'>Hello, World.</div>
					<div class='col-sm'>Hello, World.</div>
				</div>
			</div>
		</article>
	</section>
	<hr />
	<footer>Footer</footer>
</body>
</html>
