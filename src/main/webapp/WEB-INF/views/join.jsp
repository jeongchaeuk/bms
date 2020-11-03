<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="include/header.jsp"%>
<h1 class='display-4' style='font-size:2rem'>회원 가입</h1>
<hr />
<script>
	$(document).ready(function() {

		$('#userid-dup').hide();
		$('#userid-uniq').hide();
		$('#userpw-ne').hide();
		$('#userpw-eq').hide();

	}); // ready
</script>
	<section>
		<div class='container col-sm-4 text-left'>
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
				<div class='form-group text-center'>
					<button type="submit" class="btn btn-primary" id='join-submit' disabled='disabled'>가입하기</button>
					<a type='button' class='btn btn-warning' href='${pageContext.request.contextPath}/home'>취소</a>
				</div>
			</form>
			<script>
				$(function() {

					$('input[name=userid]').keyup(function(){
						var userid = $(this).val();
						if (userid == "") {
							$('#userid-dup').hide();
							$('#userid-uniq').hide();
							$('#join-submit').attr('disabled', 'disabled');
						} else {
							$.post("/rest/checkUserId.json",
									{ userid : userid },
									function (data) {
										if (data.dup == 0) {
 											$('#userid-dup').hide();
 											$('#userid-uniq').show();
 											$('#join-submit').removeAttr('disabled');
										} else {
 											$('#userid-dup').show();
 											$('#userid-uniq').hide();
 											$('#join-submit').attr('disabled', 'disabled');
										}
									}, 
									'json');
						}
					});
					
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
	</section>
<div class='mt-2'>
<%@ include file="include/footer.jsp"%>
</div>
