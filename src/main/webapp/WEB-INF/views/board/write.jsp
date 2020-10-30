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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<title>BMS Write Board</title>
</head>
<body>
	<header>Header</header>
	<hr />
	${sessionScope}
	<nav class="navbar navbar-expand bg-light">
		<a class='navbar-brand' href='${pageContext.request.contextPath}/home'>BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">글 쓰기</li>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class='container-md'>
				<form role='form' method='post' action='${pageContext.request.contextPath}/board/write'>
					<div class="form-group">
						<label for="brd_title">제목</label>
						<input class='form-control input-md' type='text' id='brd_title' name='brd_title' placeholder="글 제목을 입력하세요." />
					</div>
					<div class="form-group">
						<label for="brd_content">내용</label>
						<textarea class="form-control" id="brd_content" name='brd_content' rows="3" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="form-group">
						<label for="reg_userid">작성자</label>
						<input class='form-control input-md' type='text' id='reg_userid' name='reg_userid' value='${sessionScope.USERID_SESSION}' readonly />
					</div>
					<div class="form-group">
						<label for="img">파일첨부</label>
						<input type="file" class="form-control-file" id="img" name='brd_img'>
					</div>
					<!-- 					<div class="form-group"> -->
					<!-- 						<label for="reg_date">작성일</label> -->
					<!-- 						<input class='form-control input-md' type='reg_date' name='reg_date' /> -->
					<!-- 					</div> -->
					<div class='form-group'>
						<button type='submit' class='btn btn-primary'>글쓰기</button>
						<a class='btn btn-warning' href='${pageContext.request.contextPath}/board/list'>취소</a>
					</div>
				</form>
			</div>
		</article>
	</section>
	<hr />
	<footer>Footer</footer>
</body>
</html>
