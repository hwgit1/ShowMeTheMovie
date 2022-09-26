<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 로그인 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<section class="vh-100 gradient-custom">
				  <div class="container py-5 h-100">
				    <div class="row d-flex justify-content-center align-items-center h-100">
				      <div class="col-12 col-md-8 col-lg-6 col-xl-5">
				        <div class="card bg-dark text-white" style="border-radius: 1rem;">
				          <div class="card-body p-5 text-center">
				            <div class="mb-md-5 mt-md-4 pb-5">
				              <h2 class="fw-bold mb-2 text-uppercase">로그인</h2>
				              <p class="text-white-50 mb-5">아이디와 패스워드를 입력하세요.</p>
				              <div class="form-outline form-white mb-4">
				                <input type="text" id="mid" name="mid" maxlength="20" class="form-control form-control-lg" />
				                <label class="form-label" for="typeEmailX"> I D </label>
				              </div>
				              <div class="form-outline form-white mb-4">
				                <input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control form-control-lg" />
				                <label class="form-label" for="typePasswordX"> Password </label>
				              </div>
				              <button id="login_btn" class="btn btn-outline-light btn-lg px-5" type="button">Login</button>
				              <div class="kakao">
								<a href="https://kauth.kakao.com/oauth/authorize?client_id=945e73f5f777795905223c979bc7a02f&redirect_uri=http://localhost/login/kakao_login&response_type=code">
								<img class="mt-2" style="width: 150px; height: 50px;" id="loginBtn" src=/resources/img/kakao_login.png /></a>
							  </div>
				              <div class="d-flex justify-content-center text-center mt-4 pt-1">
				                <a href="#!" class="text-white"><i class="fab fa-facebook-f fa-lg"></i></a>
				                <a href="#!" class="text-white"><i class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
				                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
				              </div>
				            </div>
				            <div>
				              <p class="mb-0">Don't have an account? <a href="/join/form" class="text-white-50 fw-bold">Sign Up</a></p>
				            </div>
				            <div>
				              <p class="mb-0">Forgot an ID? <a href="/find_id_form.do" class="text-white-50 fw-bold">Find ID</a></p>
				            </div>
				            <div>
				              <p class="mb-0">Forgot Password? <a href="/find_pw_form.do" class="text-white-50 fw-bold">Find Password</a></p>
				            </div>
				          </div>
				        </div>
				      </div>
				    </div>
				  </div>
				</section>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#find_pw_btn").click(function(){
					location.href='./find_pw_form.do';
				})
			})
		</script>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#find_id_btn").click(function(){
					location.href='./find_id_form.do';
				})
			})
		</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function() {
			
			$.post(
					"${pageContext.request.contextPath}/login"
					, {
						mid : $("#mid").val()
						, mpwd : $("#mpwd").val()
					}
					, function(data, status) {
						if(data == 0){
							alert("로그인에 실패했습니다.");
						} else if(data == 1){
							location.href = "${pageContext.request.contextPath}/";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$("#mpwd").keyup(function() {

			if(event.keyCode == 13) {
				$("#login_btn").click();
			}

		});//click
	});//ready
	</script>
	
	

	</body>
</html>