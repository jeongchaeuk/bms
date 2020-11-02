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
<title>BMS 공지 쓰기</title>
</head>
<body>
	<header>Header</header>
	<hr />
	${sessionScope}
	<nav class="navbar navbar-expand bg-light">
		<a class='navbar-brand' href='${pageContext.request.contextPath}/home'>BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">공지 쓰기</li>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class='container-md'>
				<form name="form" role='form' method='post' action='${pageContext.request.contextPath}/notice/write'>
					<div class="form-group">
						<label for="title">제목</label>
						<input class='form-control input-md' type='text' id='title' name='title' placeholder="글 제목을 입력하세요." />
					</div>
					<div class="form-group">
						<label for="content">내용</label>
						<textarea class="form-control" id="content" name='content' rows="3" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="form-check">
					  <input type='hidden' name='yn' id='yn' value='n' />
					  <input class="form-check-input" type="checkbox" id="check-yn">
					  <label class="form-check-label" for="check-yn">공지여부</label>
					</div>					
					<div class="form-group">
						<label for="createdAt">작성일</label>
						<input class='form-control input-md' type='text' id='createdAt' name='createdAt' readonly />
					</div>
					<div class="form-group">
						<label for="createdBy">작성자</label>
						<input class='form-control input-md' type='text' id='createdBy' name='createdBy' value = '${sessionScope.USERID_SESSION}' readonly />
					</div>
					<div class="form-group">
						<label for="modifiedAt">수정일</label>
						<input class='form-control input-md' type='text' id='modifiedAt' name='modifiedAt' readonly />
					</div>
					<div class="form-group">
						<label for="modifiedBy">수정자</label>
						<input class='form-control input-md' type='text' id='modifiedBy' name='modifiedBy' value = '${sessionScope.USERID_SESSION}' readonly />
					</div>
					<div class='form-group'>
						<button type='submit' class='btn btn-primary'>글쓰기</button>
						<a class='btn btn-warning' href='${pageContext.request.contextPath}/notice/list'>취소</a>
					</div>
				</form>
			</div>
		</article>
	</section>
	<script>
	$(document).ready(function(){
		
		$('#check-yn').change(function(){
			if ($('#check-yn').is(':checked'))
				$('#yn').val('y');
			else
				$('#yn').val('n');
		});
		
	});
	</script>
	<hr />
	<footer>Footer</footer>
</body>
</html>
