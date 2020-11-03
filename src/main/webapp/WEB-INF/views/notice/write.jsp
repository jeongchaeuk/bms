<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="../include/header.jsp" %>
<h1 class='display-4' style='font-size:2rem'>공지 작성하기</h1>
<hr />
	<section>
		<article>
			<div class='container text-left'>
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
					<input type="hidden" name='createdBy' value = '${sessionScope.USERID_SESSION}' />
					<div class="form-group">
						<label for="createdBy">작성자</label>
						<input class='form-control input-md' type='text' id='createdBy' value = '${sessionScope.USERID_SESSION}' readonly />
					</div>
					
<!--  					<div class="form-group">
						<label for="createdAt">작성일</label>
						<input class='form-control input-md' type='text' id='createdAt' readonly />
					</div>
					<div class="form-group">
						<label for="createdBy">작성자</label>
						<input class='form-control input-md' type='text' id='createdBy' name='createdBy' value = '${sessionScope.USERID_SESSION}' readonly />
					</div>
					<div class="form-group">
						<label for="modifiedAt">수정일</label>
						<input class='form-control input-md' type='text' id='modifiedAt' readonly />
					</div>
					<div class="form-group">
						<label for="modifiedBy">수정자</label>
						<input class='form-control input-md' type='text' id='modifiedBy' name='modifiedBy' value = '${sessionScope.USERID_SESSION}' readonly />
					</div> -->
					<div class='form-group mt-2'>
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
<%@ include file="../include/footer.jsp" %>
