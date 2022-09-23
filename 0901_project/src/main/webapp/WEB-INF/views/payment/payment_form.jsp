<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payment_form</title>
</head>
<body>

<button type="button" id="kakao_btn" class="btn btn-link btn-sm">카카오 페이 테스트</button>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<!-- # 카카오페이 -->
<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#kakao_btn").click(function() {
	    	kakaoPay();
	     });
	    })
	    function kakaoPay() {
	    	IMP.init('imp25256745');
	    	
		    IMP.request_pay({
		    pg: "kakaopay"
		    ,pay_method: "card"
	        ,merchant_uid:'merchant_'+new Date().getTime() //상점에서 관리하는 주문 번호
	        ,name: $("#md_name").val()			
	        ,amount: $("#span_sum_total_buy_amt").text()
	        ,buyer_name: '${login_info.member_name}'  			
	        ,buyer_tel:'${login_info.member_phone}' 		
	        ,buyer_email: '${login_info.member_email}'		
		    }
	        , function(rsp) { //callback
                let _delivery_id = $("#delivery_id").val();

	        	if (rsp.success) {
	               
					var msg = '결제가 완료 되었습니다.';
	                
					var couponValue = $("#couponList option:selected").val().split("#");
					var coupon_id = couponValue[1];
					
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
        						delivery_id : $("#delivery_id").val()
        						, order_md_cnt : $("#span_sum_md_class_qty").text()
        						, order_amt : $("#span_sum_buy_amt").text()
        						, discount_amt : $("#span_sum_discount_amt").text()
        						, coupon_dis : $("#onlyCoupon").text()
        						, pay_amt : rsp.paid_amount
        						, str_cart_id : str_cart_id
        						, buy_now_md_id : buy_now_md_id
        						, buy_now_qty : buy_now_qty
        						, coupon_id : coupon_id
        						
        					},
        					function(data, status) {
        						if(data >= 1){
        							alert("주문 등록을 성공 하였습니다.");
        							location.href="${pageContext.request.contextPath}/order/paySuccess";
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
</html>