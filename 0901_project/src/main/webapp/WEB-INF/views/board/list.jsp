<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 공 지 사 항 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#board {
			margin-left: 250px;	
			margin-right: 250px;	
		}
		</style>
		
		
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<div id="board">
		<hr>
		<h3> 공 지 사 항 </h3>
		<hr>
		<form action="${pageContext.request.contextPath}/board/list" method="get">
			<div class="input-group">
				<div class="input-group-prepend">
					<select class="form-control" id="searchOption" name="searchOption">
						<option value="title"
							<c:if test="${search_dto.searchOption == 'title'}">selected="selected"</c:if>
						> 제 목 </option>
						<option value="writer"
							<c:if test="${search_dto.searchOption == 'writer'}">selected="selected"</c:if>
						> 작 성 자 </option>
					</select>
				</div>
				<input type="text" class="form-control" id="searchWord" name="searchWord"
						value="${search_dto.searchWord}">
				<div class="input-group-append">
					<button type="submit" class="btn btn-primary"> 검 색 </button>
				</div>
			</div>
		</form>
		<hr>
		<div class="clearfix">
		<c:if test="${login_info.authority == 1}">
			<a href="${pageContext.request.contextPath}/board/write_form">
				<button class="btn btn-primary float-right"> 글 쓰러 가기 </button>
			</a>
		</c:if>
		</div>
		<hr>
		<table class="table table-hover">
			<thead>
				<tr>
					<th> 글번호 </th>	<th> 제목 </th>	<th> 작성자 </th>	<th> 조회수 </th>	<th> 작성일 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.board_no}</td>
						<td>
							<a href="${pageContext.request.contextPath}/board/detail?board_no=${dto.board_no}">
								${dto.title}
							</a>
						</td>
						<td>${dto.mid}</td>
						<td>${dto.view_cnt}</td>
						<td>${dto.write_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<ul class="pagination">
			<c:if test="${startPageNum > 10}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/board/list?userWantPage=${startPageNum-1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Previous
					</a>
				</li>
			</c:if>
			<c:forEach var="page_no" begin="${startPageNum}" end="${endPageNum}">
				<c:choose>
					<c:when test="${page_no == userWantPage}">
						<li class="page-item active">
							<a class="page-link">${page_no}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link"
								href="${pageContext.request.contextPath}/board/list?userWantPage=${page_no}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
								${page_no}
							</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${lastPageNum > endPageNum}">
				<li class="page-item">
					<a class="page-link"
						href="${pageContext.request.contextPath}/board/list?userWantPage=${endPageNum+1}&searchOption=${search_dto.searchOption}&searchWord=${search_dto.searchWord}">
						Next
					</a>
				</li>
			</c:if>
		</ul>
		<hr>
		</div>
	</body>
</html>














