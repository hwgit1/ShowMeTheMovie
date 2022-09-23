<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> ChatRoom </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.1/basic/ckeditor.js"></script>
		<style type="text/css">
		#chatroom {
			margin-left: 250px;	
			margin-right: 250px;	
		}
		</style>
	</head>
	
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<div id="chatroom">
		<hr>
		<h3> ${room_dto.mid_from}님의 문의사항 </h3>
		<hr>
		
		<p>
		<c:if test="${login_info.authority == 1}">
		<button id="end-btn" type="button" class="btn btn-danger float-left"> Q&A 종료 </button>
		</c:if>
		<a href="javascript:history.back(-1)">
		<button id="back-btn" type="button" class="btn btn-primary float-right"> 뒤로가기 </button>
		</a>
		</p>
		<br>
		<br>
		<iframe src="${pageContext.request.contextPath}/memo/chat_list?room_no=${room_dto.room_no}"
				name="chatList" width="100%" height="470px" frameborder="0" scrolling="no" class="mb-1"></iframe>

		<div>
			<textarea id="cnts" name="cnts" class="form-control" style="height:100px;"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace('cnts');
			</script>
			<button id="chat_send_btn" class="btn btn-primary btn-block"> 글 전 송 </button>
		</div>

	<script type="text/javascript">
	$(document).ready(function() {

		$("#chat_send_btn").click(function() {

			let chat = CKEDITOR.instances.cnts.getData();

			if( chat == '' ){
				alert("내용을 입력해 주세요.");
				return;
			}

			$.post(
					"${pageContext.request.contextPath}/memo/insert"
					, {
						room_no : "${room_dto.room_no}"
						, mno_ins : "${room_dto.mno_from}"
						, mno_read : "${room_dto.mno_to}"
						, chat : chat
					}
					, function(data, status) {
						if(data >= 1){
							CKEDITOR.instances.cnts.setData("");
							chatList.pageReload();
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back functiion
			);//post

		});//click

	});//ready
	
	$(document).ready(function() {
		$("#end-btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/memo/Room_delete"
					, {
						room_no : "${room_dto.room_no}"
					}
					, function(data, status) {
						//alert(data);
						if(data >= 1){
							alert("Q&A가 삭제 되었습니다.");
							location.href="${pageContext.request.contextPath}/memo/my_room_list";
						} else if (data <= 0) {
							alert("Q&A 삭제를 실패하였습니다");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
	}); //ready	
	</script>
	</div>
	</body>
</html>












