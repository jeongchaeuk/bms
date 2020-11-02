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
<script>
	$(document).ready(function() {

	}); // ready
</script>
<title>BMS Log-in</title>
</head>
<body class="text-center">
	<header>Header</header>
	<hr />
	<nav class="navbar navbar-expand bg-light">
		<a class='navbar-brand' href='${pageContext.request.contextPath}/home'>BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">로그인</li>
			</ul>
		</div>
	</nav>
	<section>
		<article class='container'>
			<div class='row'>
				<div class='col-sm-4'>
					<form class="form-signin" role="form" method="post" action="${pageContext.request.contextPath}/member/login">
<!-- 						<img class="mb-4" src="/docs/4.5/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
						<h1 class="h3 mb-3 font-weight-normal">로그인</h1>
						<label for="userid" class="sr-only">아이디</label>
						<input type="text" id="userid" name='userid' class="form-control" placeholder="아이디를 입력하세요." required autofocus>
						<label for="userpw" class="sr-only">비밀번호</label>
						<input type="password" id="userpw" name='userpw' class="form-control" placeholder="비밀번호를 입력하세요." required>
<!-- 						<div class="checkbox mb-3">
							<label>
								<input type="checkbox" value="remember-me">
								Remember me
							</label>
						</div> -->
						<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
<!-- 						<p class="mt-5 mb-3 text-muted">&copy; 2017-2020</p> -->
					</form>
				</div>
			</div>
		</article>
	</section>
	<hr />
	<footer>Footer</footer>
</body>
</html>
