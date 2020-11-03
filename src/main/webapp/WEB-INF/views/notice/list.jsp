<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true"%>
<%@ include file="../include/header.jsp" %>
	<h1 class='display-4' style='font-size:2rem'>공지사항<sub><span class="badge badge-secondary ml-1">${count}</span></sub></h1>
	<hr />
	<section>
		<article>
			<div class='container'>
				<form class='form-inline' role='form' method='post' action='${pageContext.request.contextPath}/notice/list'>
					<input class='form-control form-control-sm mb-1' type='text' name='search' placeholder="검색어를 입력하세요." />
					<input class='btn btn-sm btn-primary ml-2 mb-1' type='submit' value='검색' />
				</form>
				<div id='notice-main'>
					<table class='table table-sm table-hover'>
						<thead>
							<tr>
								<th></th>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>
								<th>공지</th>
								<th>작성일</th>
								<th>작성자</th>
								<th>수정일</th>
								<th>수정자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="notice" items="${list}" varStatus="st">
								<tr>
									<th>${st.count}</th>
									<td>${notice.id}</td>
									<td><a href='${pageContext.request.contextPath}/notice/content?id=${notice.id}'>${notice.title}</a></td>
									<td>${notice.content}</td>
									<td>${notice.yn}</td>
									<td>${notice.createdAt}</td>
									<td>${notice.createdBy}</td>
									<td>${notice.modifiedAt}</td>
									<td>${notice.modifiedBy}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot></tfoot>
					</table>
					<div id='pagination'>pagination</div>
					<div id='write-button' class='text-right'>
						<a type='button' class='btn btn-primary' href='${pageContext.request.contextPath}/notice/write'>글쓰기</a>
					</div>
				</div>
			</div>
		</article>
	</section>
<%@ include file="../include/footer.jsp" %>
