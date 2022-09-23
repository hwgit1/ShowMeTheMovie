<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 결제 </title>
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#kakaoimg {
       		width:950px;
        	margin:auto;
			padding: 100px 0px;
		}
		</style>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	
	<div id="kakaoimg">
	<h1 id="txtContact"> 카카오페이 결제 </h1>
	<button type="button" class="order-button" id="order-button">
						<img src="/resources/img/kakaopay.jfif">
	</button>
	</div>
	    
	    	<!-- # 카카오페이 -->
<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#order-button").click(function() {
	    	kakaoPay();
	     });
	    })
	    function kakaoPay() {
	    	IMP.init('imp25256745');
	    	
	    	IMP.request_pay({
			    pg: "kakaopay"
			    ,pay_method: "card" //결제시 카드결제만 해야함. 카카오포인트로 결제 불가.
		        ,merchant_uid: '${reserve.order_no}' +new Date().getTime() //상점에서 관리하는 주문 번호
		        ,name: '${reserve.title}' 			//'${dto.md_name}'
		        ,amount: '${reserve.pay}' //가격정보는 잘 뜸.
		        ,buyer_name: '${login_info.mid}'  			
		    	,buyer_tel:'${login_info.mtel}' 		
		    	,buyer_email: '${login_info.memail}' 
	    	}
	    	
	    	, function(rsp) { //callback
		    		alert(rsp);
	        	if (rsp.success) {
	                var msg = '결제가 완료 되었습니다.';
	             
					
                    msg += ' 고유ID : ' + rsp.imp_uid;
                    msg += ' 상점 거래ID : ' + rsp.merchant_uid;
                    msg += ' 결제 금액 : ' + rsp.paid_amount;
                    msg += ' 결제 수단 : ' + rsp.pay_method;
                    msg += ' 카드 승인번호 : ' + rsp.apply_num;
                    msg += ' 결제 승인 시간 : ' + rsp.paid_at;
                    msg += ' 구매자 이름 : ' + rsp.buyer_name;
                    msg += ' 구매자 전화번호 : ' + rsp.buyer_tel;
                    
                    $.post(
        					"${pageContext.request.contextPath}/order/insert"
        					, {
        						  detailorder_no : '${reserve.order_no}' +new Date().getTime()
        						, detailorder_id : '${login_info.mid}'
        						, detailorder_title : '${reserve.title}'
        						, detailorder_ticketNumber : '${reserve.ticketNumber}'
        						, detailorder_pay : '${reserve.pay}'
        					},
        					function(data, status) {
        						if(data >= 1){
        							alert("주문 등록을 성공 하였습니다.");
        							location.href="${pageContext.request.contextPath}/";
        						} else if(data <= 0){
        							alert("주문 등록을 실패 하였습니다.");
        						} else {
        							alert("잠시 후 다시 시도해 주세요.");
        						}
        					}//call back function
        			);//post
        			
                    
	            } else {
	            	var msg = '결제에 실패 하였습니다.';
                    msg += ' 에러내용 : ' + rsp.error_msg;
                    msg += ' 에러코드: ' + rsp.error_code;
	            }
	            alert(msg);
	    });
	    };
</script>
</body>
	</body>
</html>
