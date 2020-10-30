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
<script>
	$(document).ready(function() {

		$('#userid-dup').hide();
		$('#userid-uniq').hide();
		$('#userpw-ne').hide();
		$('#userpw-eq').hide();

	}); // ready
</script>
<title>BMS Join</title>
</head>
<body>
	<header>Header</header>
	<hr />
	<nav class="navbar navbar-expand bg-light">
		<a class='navbar-brand' href='${pageContext.request.contextPath}/home'>BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">회원가입</li>
			</ul>
		</div>
	</nav>
	<section>
		<article class='container'>
			<div class='row'>
				<div class='col-sm-6'>
					<form role='form' method="post" action="${pageContext.request.contextPath}/member/join">
						<div class='form-group'>
							<label for='userid'>아이디</label>
							<input class='form-control' type='text' id='userid' name='userid' placeholder="아이디를 입력하세요." />
						</div>
						<div class='alert alert-danger' id='userid-dup'>중복된 아이디 입니다.</div>
						<div class='alert alert-success' id='userid-uniq'>사용 가능한 아이디 입니다.</div>
						<div class='form-group'>
							<label for='userpw'>비밀번호</label>
							<input class='form-control' type='password' id='userpw' name='userpw' placeholder="비밀번호를 입력하세요." />
						</div>
						<div class='form-group'>
							<label for='userpw-check'>비밀번호 확인</label>
							<input class='form-control' type='password' id='userpw-check' placeholder="비밀번호를 입력하세요." />
						</div>
						<div class='alert alert-danger' id='userpw-ne'>비밀번호가 일치하지 않습니다.</div>
						<div class='alert alert-success' id='userpw-eq'>비밀번호가 일치합니다.</div>
						<div class='form-group'>
							<label for='username'>이름</label>
							<input class='form-control' type='text' id='username' name='username' placeholder="이름을 입력하세요." />
						</div>
						<div class='form-group'>
							<label for='userid'>전화번호</label>
							<input class='form-control' type="tel" id='userphone' name='userphone' placeholder="전화번호를 입력하세요." />
						</div>
						<!-- 						<div class='form-group'> -->
						<!-- 							<label for='create_at'>가입일</label> -->
						<!-- 							<input class='form-control' type='date' id='created_at' name='created_at' placeholder="가입일을 입력하세요." /> -->
						<!-- 						</div> -->
						<div class='form-group text-center'>
							<button type="submit" class="btn btn-primary" id='join-submit' disabled='disabled'>회원 가입</button>
							<a type='button' class='btn btn-warning' href='${pageContext.request.contextPath}/home'>가입 취소</a>
						</div>
					</form>
					<script>
						$(function() {

							$('input').keyup(function() {

								var pw1 = $('#userpw').val();
								var pw2 = $('#userpw-check').val();

								if (pw1 != '' && pw2 != '') {
									if (pw1 == pw2) {
										$('#userpw-eq').show();
										$('#userpw-ne').hide();
										$('#join-submit').removeAttr('disabled');
									} else {
										$('#userpw-eq').hide();
										$('#userpw-ne').show();
										$('#join-submit').attr('disabled', 'disabled');
									}
								}

							});

						});
					</script>
				</div>
			</div>
		</article>
	</section>
	<hr />
	<footer>Footer</footer>
</body>
</html>
