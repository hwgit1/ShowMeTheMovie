<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 공지사항 상세 보기 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 공지사항 상세 보기 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> 글 번 호 </th>	<td>${detail_dto.board_no}</td>
					<th> 제 목 </th>		<td>${detail_dto.title}</td>
				</tr>
				<tr>
					<th> 작 성 자 </th>	<td>${detail_dto.mid}</td>
					<th> 작 성 일 </th>	<td>${detail_dto.write_date}</td>
				</tr>
				<tr>
					<th> 내 용 </th>		<td colspan="3">${detail_dto.contents}</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<c:if test="${detail_dto.mno == login_info.mno}" >
			<button id="btn_delete" class="btn btn-danger"> 게시글 삭제 </button>
			<a href="${pageContext.request.contextPath}/board/update_form?board_no=${detail_dto.board_no}">
				<button class="btn btn-primary"> 게시글 수정하러 가기 </button>
			</a>
			<hr>
		</c:if>
	<script type="text/javascript">
	$(document).ready(function() {
		$("#btn_delete").click(function() {

			$.get(
					"${pageContext.request.contextPath}/board/delete"
					, {
						board_no : ${detail_dto.board_no}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("게시글이 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/board/list";
						} else if( data <= 0 ) {
							alert("게시글 삭제를 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>
	</body>
</html>














