<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="include/header.jsp"%>
<h1 class='display-4' style='font-size:2rem'>로그인</h1>
<hr />
<section>
	<div class='container col-sm-4'>
		<form class="form-signin" role="form" method="post" action="${pageContext.request.contextPath}/member/login">
<!-- 			<img class="mb-4" src="/docs/4.5/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72"> -->
<!-- 			<h1 class="h3 mb-3 font-weight-normal">로그인</h1> -->
			<label for="userid" class="sr-only">아이디</label>
			<input type="text" id="userid" name='userid' class="form-control" placeholder="아이디를 입력하세요." required autofocus>
			<label for="userpw" class="sr-only">비밀번호</label>
			<input type="password" id="userpw" name='userpw' class="form-control" placeholder="비밀번호를 입력하세요." required>
<!-- 			<div class="checkbox mb-3">
				<label>
					<input type="checkbox" value="remember-me">
					아이디 저장하기
				</label>
			</div> -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
		</form>
	</div>
</section>
<div class='mt-2'>
<%@ include file="include/footer.jsp"%>
</div>
