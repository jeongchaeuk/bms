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
<title>BMS Board</title>
</head>
<body>
	<header>Header</header>
	<hr />
	${sessionScope}
	<nav class="navbar navbar-expand bg-light">
		<a class='navbar-brand' href='${pageContext.request.contextPath}/home'>BMS</a>
		<div class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">게시판 <span class="badge badge-secondary">${count}</span></li>
			</ul>
		</div>
	</nav>
	<section>
		<article>
			<div class='container'>
				<form class='form-inline' role='form' method='get' action='${pageContext.request.contextPath}/board/list'>
					<input class='form-control input-md' type='text' name='search' placeholder="검색어를 입력하세요." />
					<input class='btn btn-primary' type='submit' value='검색' />
				</form>
				<div id='board-main'>
					<table class='table table-sm table-hover'>
						<thead>
							<tr>
								<th></th>
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
	<hr />
	<footer>Footer</footer>
</body>
</html>
