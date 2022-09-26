<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>HandFlea</title>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/mypage_style.css">
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
		<main>
			<div id="side">
				<div id="profile">
					<h3>My Page</h3>
					<p style="color: #F2EEA7;">${login_info.mname} 님</p>
					<p style="font-size: small; margin-bottom: 10px;">${login_info.memail}</p>
				</div>
				<div id="menu-box">
					<div id="menu-link">
						
						<h4>내 정보</h4>
						<a onclick="pwd_ch()">회원 정보 수정</a>
						
						<h4>나의 쇼핑</h4>
						<a href="${pageContext.request.contextPath}/">예매 내역</a>
						
					</div>
				</div>
			</div>
			<div id="main-content">
				<form id="user_info">
					<div class="info">
						<div class="info-title">
							<h2>회원 정보 수정</h2>
						</div>
						<div class="info-box">
						
							<div class="info-line">
								<div class="info-label">
									<p>아이디</p>
								</div>
								<div class="info-contents">
									${myinfo.mid}
								</div>
							</div>
							
							<div class="info-line">
								<div class="info-label">
									<label for="mpwd">비밀번호</label>
								</div>
								<div class="info-contents">
									<input type="password" id="mpwd" name="mpwd"  value="${myinfo.mpwd}">
									<input type="password" id="repwd" name="repwd"  value="${myinfo.mpwd}">
									<label for="mpwd" id="mpwd_label"></label>
								</div>
							</div>
							<div class="info-line">
								<div class="info-label">
									<p>이름</p>
								</div>
								<div class="info-contents">
									${myinfo.mname}
								</div>
							</div>
						
							<div class="info-line">
								<div class="info-label">
									<label for="mtel">연락처</label>
								</div>
								<div class="info-contents">
									<input type="text" id="mtel" name="mtel" value="${myinfo.mtel}">
									<label id="mtel_label" for="mtel"></label>
								</div>
							</div>
							<div class="info-line">
								<p id="info-guide">아이디와 이름은 수정이 불가능합니다.</p>
							</div>
						</div>
					</div>
				
			</form>
				<div id="info-button-box">
					<button type="button" id="quit_btn" name="quit_btn">회원 탈퇴</button>
					<button type="button" id="save_btn" name="save_btn">저장</button>
				</div>
			</div>
		</main>	
	
	<script type="text/javascript">

	$(document).ready(function() {
		let pwd = ${login_info.mpwd};
		let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
		let onlyNum = /^[0-9]+$/;
		$("#save_btn").click(function() {
			if ($("#mpwd").val() != "") {
				if( $("#mpwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
					$("#mpwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
					return;
				} else { $("#mpwd_label").text(""); }

				if( $("#mpwd").val() != $("#repwd").val() ){
					$("#mpwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
					return;
				} else { $("#mpwd_label").text(""); }
				pwd = $("#mpwd").val();
			} else { $("#mpwd_label").text(""); }
			
			let mtel = $.trim($("#mtel").val());
			
			if (mtel == "") {
				$("#mtel_label").text("전화번호를 입력해주세요.");
				return;
			} else { $("#mtel_label").text(""); }
			
			let form = new FormData( document.getElementById( "user_info" ) );
			
			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);
			
			$.ajax({
				type : "POST" 
				, encType : "multipart/form-data" 
				, url : "${pageContext.request.contextPath}/mypage/info_update" 
				, data : form 
				, processData : false
				, contentType : false 
				, cache : false 
				, success : function(result) {
					alert("회원 정보가 수정되었습니다. 다시 로그인 해주세요.");
					location.href = "${pageContext.request.contextPath}/logout";
				}, 
				error : function(xhr) {
					alert("잠시 후 다시 시도해주세요.");
				}
			});
			
		});//click
	});//ready
	
	$(document).ready(function() {
		$("#quit_btn").click(function() {
			
			$.get(
					"${pageContext.request.contextPath}/mypage/memdelete"
					, {
						mno : ${login_info.mno}
					}
					, function(data, status) {
						if( data >= 1 ){
							alert("회원탈퇴가 완료되었습니다.");
							location.href="${pageContext.request.contextPath}/logout";
						} else if( data <= 0 ) {
							alert("회원탈퇴를 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}
			)
			
		});//click
	});//ready
	
	</script>
	<script>
	function pwd_ch() {
		var userinput = prompt("비밀번호를 입력해주세요.");
		if ("${login_info.mpwd}" == userinput) {
			location.href="${pageContext.request.contextPath}/mypage/myinfo";
		} else {
			alert("비밀번호가 틀렸습니다.");
			location.href="${pageContext.request.contextPath}/mypage/";
		}
	}
	
	</script>
	</body>
</html>