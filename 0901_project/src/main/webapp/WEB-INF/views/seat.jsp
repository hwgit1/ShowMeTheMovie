<%@page import="kr.co.ictedu.dto.CGVReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
 	CGVReserveDto reserve = (CGVReserveDto) request.getAttribute("reserve");
	/* if (reserve != null && reserve.getCgvPayDto() != null) {
		System.out.println(reserve.toString());
	} else {
		System.out.println("오류가있습니다!!");
	} */
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/seat.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script> 
<link rel='stylesheet'
	href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script
	src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<!-- MATERIAL DESIGN ICONIC FONT -->

</head>

<body>
	<div class="select-container">
		<div class="select-wrapper">
			<div class="select-title">인원/좌석</div>
			<div class="select-seat-container">
				<div class="select-seat-number-container">
					<div class="select-seat-number-wrapper">
						<div class="select-seat">
							<div class="select-seat-age">인원</div>
							<div class="select-seat-number">
								<ul class="select-seat-ul select-seat-ul-normal">
									<li class="select-number-normal ">0</li>
									<li class="select-number-normal">1</li>
									<li class="select-number-normal">2</li>
									<li class="select-number-normal">3</li>
									<li class="select-number-normal">4</li>
								</ul>
							</div>
						</div>

					</div>
					<div class="reserve-number-wrapper">
						<div class="reserve-number-title">선택된 좌석 수</div>
						<div class="reserve-number">0</div>
					</div>
				</div>
				<div class="select-seat-information">
					<div class="selected-movie"><%=reserve.getTitle()%></div>
					<div class="select-seat-information-wrapper">
						<div class="select-theater-place selected-theater-place-info"><%= reserve.getSelectedTheater()%></div>
						<div class="select-theater-place selected-theater-place-info"><%= reserve.getReserveWhere()%></div>
						<div class="select-theater-place">
							<span>남은좌석</span><span class="remain-seats">152</span>/<span
								class="all-seats">172</span>
						</div>
					</div>
					<div class="select-theater-date">
						<div class="theater-date"><%=reserve.getMovieDate()%></div>
						<div class="theater-time"><%=reserve.getRunningTime()%></div>
					</div>
					<div class="selected-seats-wrapper">
						<span class="selected-seats-title">좌석번호</span> <span
							class="selected-seats">선택한 좌석이 없습니다.</span>
					</div>
					<div class="ticket-price-wrapper">
						<div class="ticket-price-title">가격</div>
						<div class="ticket-price">0원</div>
					</div>
					<form action="moveKakao.do" class="seatForm" method="post">
						<input type="hidden" class="title" name="title"> <input
							type="hidden" class="selectedTheater" name="selectedTheater">
						<input type="hidden" class="reserveDate" name="movieDate">
						<input type="hidden" class="runningTime" name="runningTime">
						<input type="hidden" class="movieAge" name="movieAge"
							value="<%=reserve.getMovieAge()%>">
						<!-- 티켓의수(선택한 좌석) -->
						<input type="hidden" class="ticketNumber" name="ticketNumber">
						<input type="hidden" class="selectedSeat" name="selectedSeat">
						<input type="hidden" class="seatCnt" name="seatCnt">
						<!-- 결제 정보 -->
						<input type="hidden" class="pay" name="pay">
						<button type="button" class="reserve-button">
							결제하기<img src="/resources/img/payment_icon_yellow_medium.png">
						</button>
					</form>
				</div>

			</div>
			<div class="seat-container">
				<div class="seat-wrapper">
					<div class="screen-view-wrapper">
						<div class="screen-view">SCREEN</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- # 카카오페이 -->
<script type="text/javascript">
	    $(document).ready(function(){
	    	$("#reserve-button").click(function() {
	    	kakaoPay();
	     });
	    })
	    function kakaoPay() {
	    	IMP.init('imp25256745');
	    	
		    IMP.request_pay({
		    pg: "kakaopay"
		    ,pay_method: "card"
	        ,merchant_uid:"#order_no"+new Date().getTime() //상점에서 관리하는 주문 번호
	        ,name: '${dto.title}'	//상품이름 들어가는곳		
	        ,amount: '${dto.pay}' //가격정보
	        ,buyer_name: '${login_info.mid}'  			
	        ,buyer_tel:'${login_info.mtel}' 		
	        ,buyer_email: '${login_info.memail}'		
		    }
	        , function(rsp) { //callback
                let _delivery_id = $("#delivery_id").val();

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
        					"${pageContext.request.contextPath}/moveKakao.do"
        					, {
        						, order_md_cnt : '${dto.ticketNumber}'
        						, order_amt : '${dto.pay}'
        						, pay_amt : rsp.paid_amount
        						, str_cart_id : str_cart_id
        						, buy_now_md_id : buy_now_md_id
        						, buy_now_qty : buy_now_qty
        						, coupon_id : coupon_id
        						
        					},
        					function(data, status) {
        						if(data >= 1){
        							alert("주문 등록을 성공 하였습니다.");
        							location.href="${pageContext.request.contextPath}/main";
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

<!-- 카카오페이 -->
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
		    ,pay_method: "card" //결제시 카드결제만 해야함. 카카오포인트로 결제 불가.
	        ,merchant_uid:'merchant_'+new Date().getTime() //상점에서 관리하는 주문 번호
	        ,name: '${dto.title}' 			//'${dto.md_name}'
	        ,amount: '${dto.pay}' //가격정보는 잘 뜸.
	        ,buyer_name: '${login_info.mid}'  			
	    	,buyer_tel:'${login_info.mtel}' 		
	    	,buyer_email: '${login_info.memail}'  
	        
	        //redirect_url : '${pageContext.request.contextPath}/order/insert'
	        
	        }, function(rsp) { //callback
	        	if (rsp.success) {
	        		//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 데이터 전달하기
	                jQuery.ajax({
	                	url: "/order/insert"
	                	, type: 'POST'
	                	, dataType: 'json'
	                	, data: {
	                		imp_uid: rsp.imp_uid
	                		, merchant_uid: rsp.merchant_uid
	                		, name: rsp.name
	                		, paid_amount: rsp.paid_amount
	                		, apply_num: rsp.apply_num
	                		, buyer_name: rsp.buyer_name	
	                	}//data
	                }).done(function(data) {
                	 //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                	  if ( everythings_fine ) {
	                        msg = '결제가 완료되었습니다.';
	                        msg += '\n고유ID : ' + rsp.imp_uid;
	                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                        msg += '\결제 금액 : ' + rsp.paid_amount;
	                        msg += '카드 승인번호 : ' + rsp.apply_num;
	                        
	                        alert(msg);
	                    } else {
	                        //[3] 아직 제대로 결제가 되지 않았습니다.
	                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                    }
					});
	        		//성공시 이동할 페이지
	               location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
	            } else {
	            	msg = '결제에 실패 하였습니다.';
                    msg += ' 에러내용 : ' + rsp.error_msg;
                    msg += ' 에러코드: ' + rsp.error_code;
	          		alert(msg);
	            }
	        });
	    };
	    </script>
</body>
<script src="/resources/js/seat.js"></script>

</html>