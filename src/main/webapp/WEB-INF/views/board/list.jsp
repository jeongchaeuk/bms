<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="../include/header.jsp" %>
<h1 class='display-4' style='font-size:2rem'>게시판<span class="badge badge-info ml-1">${count}</span></h1>
<hr />
	<section>
		<article>
			<div class='container'>
				<form class='form-inline' role='form' method='get' action='${pageContext.request.contextPath}/board/list'>
					<input class='form-control form-control-sm mb-1' type='text' name='search' placeholder="검색어를 입력하세요." />
					<input class='btn btn-sm btn-primary ml-2 mb-1' type='submit' value='검색' />				
				</form>
				<div id='board-main'>
					<table class='table table-sm table-hover'>
						<thead class="thead-dark">
							<tr>
								<th>#</th>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${list}" varStatus="st">
								<tr>
									<th>${st.count}</th>
									<td>${board.brd_id}</td>
									<td><a href='${pageContext.request.contextPath}/board/content?id=${board.brd_id}'>${board.brd_title}</a></td>
									<td>${board.brd_content}</td>
									<td>${board.reg_userid}</td>
									<td>${board.brd_hit}</td>
									<td>${board.reg_date}</td>
									<td>${board.mod_date}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot></tfoot>
					</table>
					<div id='pagination'>pagination</div>
					<div id='write-button' class='text-right'>
						<a type='button' class='btn btn-primary' href='${pageContext.request.contextPath}/board/write'>글쓰기</a>
					</div>
				</div>
			</div>
		</article>
	</section>
<div class='mt-2'>
<%@ include file="../include/footer.jsp"%>
</div>
