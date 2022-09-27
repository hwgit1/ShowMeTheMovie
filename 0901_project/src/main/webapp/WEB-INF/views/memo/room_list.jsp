<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>  
<html>
	<head>
		<meta charset="UTF-8">
		<title> Q&A </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#QnA {
			margin-left: 250px;	
			margin-right: 250px;	
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div id="QnA">
		<hr>
		<h3> Q&A </h3>
		<hr>

			<table class="table table-hover table-borderless table-bordered">
				<c:forEach var="dto" items="${room_list}">
					<tr>
						<td>
							<h3 class="text-center">
								<a href="${pageContext.request.contextPath}/memo/open_room?room_no=${dto.room_no}"
									style="text-decoration:none;" class="text-dark">
									${dto.mid_from}님의 문의사항
								</a>
							</h3>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<c:if test="${login_info.authority == 0}">
			<button id="QnA-btn" class="btn btn-primary"> 문의 하기 </button>
			</c:if>
			
			<script type="text/javascript">
				$(document).ready(function() {
			
					$("#QnA-btn").click( function(){
			
						$.get(
								"${pageContext.request.contextPath}/memo/start"
								, function(data, status) {
									if(data == 0){
										alert("잠시 후 다시 시도해 주세요.");
									} else {
										window.location.href="${pageContext.request.contextPath}/memo/open_room?room_no="+data;
									}
								}//call back functiion
						);//get
			
					});//click
			
				});//ready
				</script>
				</div>
	</body>
</html>












