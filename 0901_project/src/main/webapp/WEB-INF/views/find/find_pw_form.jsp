<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>

<title>비밀번호 찾기</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<form id="pwdfind" action="find_pw.do" method="post">
				<div class="w3-center w3-large w3-margin-top">
				<h3>비밀번호 찾기</h3>
			</div>
			<div>
				<p>
					<label>ID</label>
					<input class="w3-input" type="text" id="mid" name="mid" required>
					<label>EMAIL</label>
					<input class="w3-input" type="text" id="memail" name="memail" required>
				</p>
				
				<p class="w3-center">
					<button type="submit" id=findBtn class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">find</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
				</p>
			</div>
			</form>
		</div>
	</div>
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		$("#findBtn").click(function() {
		
		let form = new FormData( document.getElementById( "pwdfind" ) );
			
			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);
			
			$.ajax({
				type : "POST" 
				, encType : "multipart/form-data" 
				, url : "${pageContext.request.contextPath}/findPWD" 
				, data : form 
				, processData : false
				, contentType : false 
				, cache : false 
				, success : function(result) {
// 					alert("메일로 임시 비밀번호를 전송하였습니다. 임시 비밀번호로 로그인 해주세요.");
					location.href = "${pageContext.request.contextPath}/login_form";
				}, 
				error : function(xhr) {
					alert("잠시 후 다시 시도해주세요.");
				}
			});
			
		});//click
	});//ready
	
	
	
	
	
	
// 	$(document).ready(function() {
// 		$("#findBtn").click(function() {

			

// 			$.ajax(
// 					"${pageContext.request.contextPath}/findPWD"
// 					, { mid : $("#mid").val() }
// 					, { memail : $("#memail").val() }
// 					, function(data, status) {
// 						if(data == 0){
							
// 						} else if(data >= 1){
// 							$.get(
// 									"${pageContext.request.contextPath}/updatePWD"
// 									, { mid : $("#mid").val() }
// 									, { memail : $("#memail").val() }
// 									, function(data, status) {
// 										if(data == 0){
// 											console.log(data);
// 										} else if(data >= 1){
											
// 										} else {
// 											alert("잠시 후 다시 시도해 주세요.");
// 										}
// 									}//call back function
// 							);//getation.href = "${pageContext.request.contextPath}/updatePWD?memail=$("#memail").val()";
							
							
							
							
							
// 						} else {
// 							alert("잠시 후 다시 시도해 주세요.");
// 						}
// 					}//call back function
// 			);//get
			
// 		});//click
// 	});//ready
	</script>
	
</body>
</html>