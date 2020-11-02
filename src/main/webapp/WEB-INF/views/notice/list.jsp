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
<title>BMS 공지사항</title>
</head>
<body>
	<header>Header</header>
	<hr />
	${sessionScope}
	<nav class="navbar navbar-expand bg-light">
		<a class='navbar-brand' href='${pageContext.request.contextPath}/home'>BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">공지사항<span class="badge badge-secondary ml-1">${count}</span></li>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class='container'>
				<form class='form-inline' role='form' method='get' action='${pageContext.request.contextPath}/notice/list'>
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
	<hr />
	<footer>Footer</footer>
</body>
</html>
