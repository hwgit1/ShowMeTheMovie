<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 회원 가입 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#info_agree_label, #mid_label, #mname_label, #mpwd_label, #rempwd_label, #mtel1_label, #memail_label, #maddr1_label {
			color : red;
		}
		.tip{
			color : black;
		}
		</style>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#addr_btn").click(function() {

			    new daum.Postcode({
			        oncomplete: function(data) {//data : 다음에서 주는 결과 값.
			        	$("#post_code").val(data.zonecode);
			        	$("#maddr1").val(data.address);
			        }//call back function
			    }).open();

			});//click
		});//ready
		</script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 회원 가입 </h3>
		<hr>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th> 아 이 디 </th>
					<td>
						<div class="input-group">
							<input type="text" id="mid" name="mid" maxlength="20" class="form-control">
							<div class="input-group-append">
								<button id="id_btn" class="btn btn-primary"> 아 이 디 중 복 체 크 </button>
							</div>
						</div>
						<label for="mid" id="mid_label"></label>
					</td>
				</tr>
				<tr>
					<th> 비 밀 번 호 </th>
					<td>
						<input type="password" id="mpwd" name="mpwd" maxlength="20" class="form-control">
						<label for="mpwd" id="mpwd_label"></label>
						<p class="tip">
						영문소문자, 숫자, 특수문자만 입력해주세요.
						</p>
					</td>
				</tr>
				<tr>
					<th> 비 밀 번 호 확 인 </th>
					<td>
						<input type="password" id="rempwd" name="rempwd" maxlength="20" class="form-control">
						<label for="rempwd" id="rempwd_label"></label>
					</td>
				</tr>
				
				<tr>
					<th> 이름 </th>
					<td>
						<input type="text" id="mname" name="mname" maxlength="20" class="form-control">
						<label for="mname" id="mname_label"></label>
						<p class="tip">
						한글만 입력해주세요.
						</p>
					</td>
				</tr>
				
				<tr class="email">
				<th>이메일</th>
				<td>
						<div class="input-group">
						<input id="memail" type="text" class="form-control" name="memail" title="이메일 주소를 입력해주세요." required/>
						<button id="emailChk" class="doubleChk btn btn-primary">인증번호 보내기</button><br/>
						</div>
						<div class="input-group">
						<input id="sm_email2" type="text" name="sm_email2" title="인증번호 입력" disabled required/>
						<button id="emailChk2" class="doubleChk btn btn-primary">이메일인증</button>
						</div>
						<span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
						<input type="hidden" id="emailDoubleChk"/>
					<label for="memail" id="memail_label"></label>
					<p class="tip">
						회원가입시 꼭 필요한 절차이므로, 정확하게 입력해 주십시오.
					</p>
				</td>
				</tr>
				
				<tr>
					<th> 주 소 </th>
					<td>
						<div class="input-group">
							<span class="input-group-text"> 우 편 번 호 </span>
							<input type="text" id="post_code" name="post_code" readonly="readonly"
									class="form-control">
							<button id="addr_btn" class="btn btn-primary"> 주 소 검 색 </button>
						</div>
						<div class="input-group">
							<span class="input-group-text"> 주 소 </span>
							<input type="text" id="maddr1" name="maddr1" readonly="readonly"
									class="form-control">
						</div>
						<div class="input-group">
							<span class="input-group-text"> 상 세 주 소 </span>
							<input type="text" id="maddr2" name="maddr2" class="form-control">
						</div>
						<label for="maddr1" id="maddr1_label"></label>
					</td>
				</tr>
				<tr>
					<th> 전 화 번 호 </th>
					<td>
						<div class="input-group">
							<input type="text" id="mtel1" name="mtel1" maxlength="3" class="form-control"
									placeholder="010">
							<input type="text" id="mtel2" name="mtel2" maxlength="4" class="form-control"
									placeholder="1234">
							<input type="text" id="mtel3" name="mtel3" maxlength="4" class="form-control"
									placeholder="5678">
						</div>
						<label for="mtel1" id="mtel1_label"></label>
						<p class="tip">
						숫자만 입력해주세요
						</p>
					</td>
				</tr>
				<tr>
					<th> 개 인 정 보 제 공 동 의 </th>
					<td>
						<div class="input-group mb-1">
							<div class="input-group-text">
								<input type="checkbox" id="info_agree" name="info_agree" class="mr-1"
										checked="checked"> 개인 정보 제공에 동의 합니다.
							</div>
						</div>
						<textarea class="form-control">1. 개인정보의 수집항목
여기서놀래는 홈페이지 회원 가입 시 회원 서비스 제공에 필요한 최소한의 정보를 수집하고 있으며 개인정보파일에 수집되는 항목은 다음과 같습니다.
회원가입
- 이름, 아이디, 연락처, 이메일

2. 개인정보 수집목적
(주)여기서놀래가 제공하는 맞춤화된 서비스 및 개발(사전조사 및 만족도 설문조사, 고객문의 등)을 위해 수집합니다. (주)여기서놀래는 원칙적으로 이용자의 개인정보를 수집 및 이용 목적범위 내에서 처리하며, 이용자의 사전 동의 없이는 본래의 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.

가. 회원관리
회원 맞춤 서비스 제공, 개인식별, 전체 서비스의 원활한 운영을 위한 관리, 회원탈퇴 의사 확인

나. 고유서비스 이용 및 신규 개발
예술경영지원센터에서 제공하는 컨설팅을 비롯한 각종 고유 서비스 제공의 필요 시, 신규 서비스 개발 시 의견수렴 및 안내

3. 개인정보의 보유기간
- 홈페이지 회원가입에 따라 수집된 개인정보 보유기간은 2년입니다.

4. 기타사항(거부할 권리 등)
- 회원가입에 따른 개인정보의 수집, 이용, 제공에 대해 귀하께서 동의하신 내용은 언제든지 철회 또는 거부하실 수 있습니다. 이의 경우 회원탈퇴로 처리되며 동의철회(거부)는 「회원탈퇴」를 클릭하거나 개인정보관리담당(책임자)에게 서면, 전화 이메일 등으로 연락하시면 즉시 개인정보의 삭제 및 파기 등 필요한 조치를 하겠습니다.

기타 개인정보에 관한 상담 및 문의가 필요한 경우에는 개인정보침해신고센터 등으로 문의하실 수 있습니다.

• 한국인터넷진흥원 개인정보침해신고센터 (www.1336.or.kr / 118)
• 정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)
• 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 182)</textarea>
						<label for="info_agree" id="info_agree_label"></label>
					</td>
				</tr>
				
			</tbody>
		</table>
		<div class="clearfix">
			<button id="join_btn" class="btn btn-primary float-right"> 회 원 가 입 </button>
		</div>
		<hr>
	<script type="text/javascript">
	let checkedID = "";
	let onlyNum = /^[0-9]+$/;
	let engLowerAndNum = /^[a-z0-9]+$/;
	let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
	let checkedEM = "";
	let onlyNM = /^[가-힣]+$/;
	let onlyEM = /^[a-zA-Z0-9@.]+$/;

	$(document).ready(function() {
		$("#join_btn").click(function() {

			if( $("#info_agree").prop("checked") == false ){
				$("#info_agree_label").text("필수 선택 사항 입니다.");
				return;
			} else { $("#info_agree_label").text(""); }

			if( checkedID == "" || checkedID != $("#mid").val() ){
				$("#mid_label").text("아이디 중복 체크를 해 주세요.");
				return;
			} else { $("#mid_label").text(""); }
			
			if( $.trim( $("#mpwd").val() ) == "" || $.trim( $("#mpwd").val() ).match(onlyPwd) == null ){
				$("#mpwd_label").text("비밀번호입력을 확인 후 다시 해주세요.");
				return;
			} else { $("#mpwd_label").text(""); }
			
			if( $("#mpwd").val() != $("#rempwd").val() ){
				$("#rempwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				return;
			} else { $("#rempwd_label").text(""); }
			
			if( $.trim( $("#mname").val() ) == "" || $.trim( $("#mname").val() ).match(onlyNM) == null ){
				$("#mname_label").text("이름입력을 확인 후 다시 해주세요.");
				return;
			} else { $("#mname_label").text(""); }
			
			if( $("#memail").val() == ""){
				$(".successEmailChk").text("이메일 인증을 해 주세요.");
				$(".successEmailChk").css("color", "red");
				return;
			} else { $(".successEmailChk").text(""); }
			
			if( $("#maddr1").val() == ""){
				$("#maddr1_label").text("주소입력을 해주세요.");
				return;
			} else { $("#maddr1_label").text(""); }
			
			if( $.trim( $("#maddr2").val() ) == ""){
				$("#maddr1_label").text("상세주소입력을 확인후 다시 해주세요.");
				return;
			} else { $("#maddr2_label").text(""); }

			if( $("#mtel1").val().match(onlyNum) == null ||
				$("#mtel2").val().match(onlyNum) == null	||
				$("#mtel3").val().match(onlyNum) == null){//허용되지 않은 글자는 null.
				$("#mtel1_label").text("전화번호를 입력해주세요");
				return;
			} else { $("#mtel1_label").text(""); }
			
			let tmpMtel1 = $.trim( $("#mtel1").val() );
			let tmpMtel2 = $.trim( $("#mtel2").val() );
			let tmpMtel3 = $.trim( $("#mtel3").val() );

			if( ( tmpMtel1 != "" && tmpMtel1.match(onlyNum) == null )
				|| ( tmpMtel2 != "" && tmpMtel2.match(onlyNum) == null )
				|| ( tmpMtel3 != "" && tmpMtel3.match(onlyNum) == null ) ){
				$("#mtel1_label").text("숫자만 허용 됩니다.");
				return;
			} else { $("#mtel1_label").text(""); }

			$.post(
					"${pageContext.request.contextPath}/join/"
					, {
						mid : $("#mid").val()
						, mpwd : $("#mpwd").val()
						, mtel1 : $("#mtel1").val()
						, mtel2 : $("#mtel2").val()
						, mtel3 : $("#mtel3").val()
						, memail : $("#memail").val()
						, mname : $("#mname").val()
						, maddr1 : $("#maddr1").val()
						, maddr2 : $("#maddr2").val()
						, post_code : $("#post_code").val()
						, infoch : $("#infoch").prop("checked")
					}
					, function(data, status) {
						if(data == 1){
							alert("회원 가입에 성공 하셨습니다. 로그인 해주세요.");
							location.href="${pageContext.request.contextPath}/login_form";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready

	$(document).ready(function() {
		$("#id_btn").click(function() {

			if( $.trim( $("#mid").val() ) == "" ){
				return;
			}
			if( $("#mid").val().match(engLowerAndNum) == null ){//허용되지 않은 글자는 null.
				$("#mid_label").text("영문 소문자와 숫자만 허용 됩니다.");
				return;
			} else { $("#mid_label").text(""); }

			$.get(
					"${pageContext.request.contextPath}/join/id_chk"
					, { mid : $("#mid").val() }
					, function(data, status) {
						if(data == 0){
							$("#mid_label").text("사용 가능한 아이디 입니다.");
							$("#mid_label").css("color", "blue");
							checkedID = $("#mid").val();
						} else if(data >= 1){
							$("#mid_label").text("이미 사용 중인 아이디 입니다.");
							$("#mid_label").css("color", "red");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get
			
		});//click
	});//ready
	
	//이메일 인증
	var code = "";
	
	$("#emailChk").click(function(){
		var memail = $("#memail").val();
		
		$.get(
				"${pageContext.request.contextPath}/join/email_validate"
				, { memail : $("#memail").val() }
				, function(data, status) {
					if(data == 0){
						$("#memail_label").text("사용 가능한 이메일 입니다.");
						$("#memail_label").css("color", "blue");
						checkedEM = $("#memail").val();
						$.ajax({
					        type:"GET",
					        url:"mailCheck?memail=" + memail,
					        cache : false,
					        success:function(data){
					        	if(data == "error"){
					        		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
									$("#memail").attr("autofocus",true);
									$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
									$(".successEmailChk").css("color","red");
					        	}else{
									alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
					        		$("#sm_email2").attr("disabled",false);
					        		$("#emailChk2").css("display","inline-block");
					        		$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
					        		$(".successEmailChk").css("color","green");
					        		code = data;
					        	}
					        }
					    });
						
					} else if(data >= 1){
						$("#memail_label").text("이미 사용 중인 이메일 입니다.");
						$("#memail_label").css("color", "red");
					} else {
						alert("잠시 후 다시 시도해 주세요.");
					}
				}//call back function
		);//get
		
	});//click
	
	//이메일 인증번호 대조
  		 $("#emailChk2").click(function(){
      
      if ($.trim($("#sm_email2").val()) == "") {
         $(".successEmailChk").text("이메일 인증을 해주십시오.");
         $(".successEmailChk").css("color","red");
         return;
      } else {
      if( $("#sm_email2").val() == code){
         $(".successEmailChk").text("인증번호가 일치합니다.");
         $(".successEmailChk").css("color","green");
         $("#emailDoubleChk").val("true");
         $("#sm_email2").attr("disabled",true);
         //$("#sm_email").attr("disabled",true);
      }else{
         $(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
         $(".successEmailChk").css("color","red");
         $("#emailDoubleChk").val("false");
         $("#sm_email2").attr("autofocus",true);
      }
      }
      
   });
	</script>
	</body>
</html>
