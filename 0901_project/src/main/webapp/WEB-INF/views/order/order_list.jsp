<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 주 문 서 </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3> 주 문 서 </h3>
		<hr>
		<table class="table table-hover">
			<col class="col-1">
			<thead>
				<tr>
					<th> 썸네일 </th>	<th> 상품명 </th>
					<th> 단가 </th>	<th> 구매 수량 </th>	<th> 구매 금액 </th>
					<th> 할인 금액 </th>	<th> 실 구매 금액 </th>
				</tr>
			</thead>
			<tbody>
				<c:set var="sum_product_class_qty" value="0" />
				<c:set var="sum_buy_amt" value="0" />
				<c:set var="sum_discount_amt" value="0" />
				<c:forEach var="dto" items="${list}" varStatus="status">
					<c:set var="sum_product_class_qty" value="${sum_product_class_qty + 1}" />
					<c:set var="sum_buy_amt" value="${sum_buy_amt + (dto.price * dto.buy_qty)}" />
					<c:set var="sum_discount_amt" value="${sum_discount_amt + ( (dto.price - dto.sale_price) * dto.buy_qty )}" />
					<tr>
						<td width="10%">
							<img src="${dto.thumbnail_path}" class="img-thumbnail">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/product/detail?prdt_no=${dto.prdt_no}">
								${dto.prdt_name}
							</a>
						</td>
						<td> ${dto.price} 원 </td>
						<td> ${dto.buy_qty} 개 </td>
						<td> ${dto.price * dto.buy_qty} 원 </td>
						<td class="text-danger"> -${ (dto.price - dto.sale_price) * dto.buy_qty} 원 </td>
						<td> ${dto.price * dto.buy_qty - ( (dto.price - dto.sale_price) * dto.buy_qty )} 원 </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<div class="row">
			<div class="col-6">
				<table class="table table-hover table-borderless">
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/delivery/form">
								<button type="button" class="btn btn-primary btn-sm">
									배 송 지 추 가
								</button>
							</a>
							<button id="delivery_btn" type="button" class="btn btn-primary btn-sm"
							 		data-toggle="modal" data-target="#delivery_choice_modal">
								배 송 지 선 택
							</button>
						</td>
					</tr>
					<tr>
						<td id="td_delivery">
							<c:choose>
								<c:when test="${deliverylist != null && deliverylist[0] != null}">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">배송지 : ${deliverylist[0].addr_name}</h5>
											<p class="card-text">받는 분 : ${deliverylist[0].recipient_name} ( 연락처 : ${deliverylist[0].tel} )</p>
											<p class="card-text">( ${deliverylist[0].post_code} ) ${deliverylist[0].addr1} ${deliverylist[0].addr2}</p>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<h5> 등록된 배송지가 없습니다. </h5>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				<input type="hidden" id="addr_no" name="addr_no"
					<c:if test="${deliverylist != null && deliverylist[0] != null}">
						value="${deliverylist[0].addr_no}"
					</c:if>
				>
				<table class="table table-hover table-borderless">
					<tr>
						<td>
							<a href="${pageContext.request.contextPath}/credit/card/form">
								<button type="button" class="btn btn-primary btn-sm">
									신 용 카 드 추 가
								</button>
							</a>
							<button id="credit_card_btn" type="button" class="btn btn-primary btn-sm"
							 		data-toggle="modal" data-target="#credit_card_choice_modal">
								신 용 카 드 선 택
							</button>
						</td>
					</tr>
					<tr>
						<td id="td_credit_card">
							<c:choose>
								<c:when test="${cardlist != null && cardlist[0] != null}">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">${cardlist[0].card_name}</h5>
											<p class="card-text">카드 번호 : ${cardlist[0].card_number}</p>
											<p class="card-text">유효 기간 (MM/YY) : ${cardlist[0].expiry_date_month} / ${cardlist[0].expiry_date_year}</p>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<h5> 등록된 카드가 없습니다. </h5>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</table>
				<input type="hidden" id="card_no" name="card_no"
					<c:if test="${cardlist != null && cardlist[0] != null}">
						value="${cardlist[0].card_no}"
					</c:if>
				>
			</div>
			<div class="col-6">
				<table class="table table-hover">
					<tr>
						<th> 총 상 품 수 </th>
						<td class="text-right"> <span id="span_sum_product_class_qty">${sum_product_class_qty}</span> 개 </td>
					</tr>
					<tr>
						<th> 총 구 매 금 액 </th>
						<td class="text-right"> <span id="span_sum_buy_amt">${sum_buy_amt}</span> 원 </td>
					</tr>
					<tr>
						<th> 총 할 인 금 액 </th>
						<td class="text-right text-danger"> -<span id="span_sum_discount_amt">${sum_discount_amt}</span> 원 </td>
					</tr>
					<tr>
						<th> <h3>총 결 제 금 액</h3> </th>
						<td class="text-right"> <h3><span id="span_sum_total_buy_amt">${sum_buy_amt - sum_discount_amt}</span> 원</h3> </td>
					</tr>
					<tr>
						<td colspan="2" class="text-center">
							<button id="order_btn" class="btn btn-danger btn-lg"> 결 제 하 기 </button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<hr>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
	<!-- delivery modal start -->
	<div class="modal" id="delivery_choice_modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"> 배 송 지 선 택 </h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-hover table-borderless">
						<col class="col-10">
						<tbody>
							<c:forEach var="dto" items="${deliverylist}" varStatus="status">
								<tr>
									<td id="td_delivery${status.index}">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">배송지 : ${dto.addr_name}</h5>
												<p class="card-text">받는 분 : ${dto.recipient_name} ( 연락처 : ${dto.tel} )</p>
												<p class="card-text">( ${dto.post_code} ) ${dto.addr1} ${dto.addr2}</p>
											</div>
										</div>
									</td>
									<td class="text-right">
										<button class="addr_delete_btn btn btn-danger btn-sm mt-1 mb-1" value="${dto.addr_no}"> 삭제 </button>
										<button class="addr_choice_btn btn btn-primary btn-sm" value="${dto.addr_no}" name="${status.index}"> 선택 </button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath}/delivery/form">
						<button type="button" class="btn btn-primary btn-sm">
							배 송 지 추 가
						</button>
					</a>
					<button type="button" class="btn btn-warning btn-sm" data-dismiss="modal"> 취 소 </button>
				</div>

			</div>
		</div>
	</div>
	<!-- delivery modal end -->
	<!-- credit_card modal start -->
	<div class="modal" id="credit_card_choice_modal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title"> 신 용 카 드 선 택 </h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<table class="table table-hover table-borderless">
						<col class="col-10">
						<tbody>
							<c:forEach var="dto" items="${cardlist}" varStatus="status">
								<tr>
									<td id="td_credit_card${status.index}">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">${dto.card_name}</h5>
												<p class="card-text">카드 번호 : ${dto.card_number}</p>
												<p class="card-text">유효 기간 (MM/YY) : ${dto.expiry_date_month} / ${dto.expiry_date_year}</p>
											</div>
										</div>
									</td>
									<td class="text-right">
										<button class="credit_card_delete_btn btn btn-danger btn-sm mt-1 mb-1" value="${dto.card_no}"> 삭제 </button>
										<button class="credit_card_choice_btn btn btn-primary btn-sm" value="${dto.card_no}" name="${status.index}"> 선택 </button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<a href="${pageContext.request.contextPath}/credit/card/form">
						<button type="button" class="btn btn-primary btn-sm">
							신 용 카 드 추 가
						</button>
					</a>
					<button type="button" class="btn btn-warning btn-sm" data-dismiss="modal"> 취 소 </button>
				</div>

			</div>
		</div>
	</div>
	<!-- credit_card modal end -->

	<script type="text/javascript">
	let arr_basket_no = ${arr_basket_no};
	let str_basket_no = "";
	$.each( ${arr_basket_no}, function(idx, str) {
		//alert(idx + " : " + str);
		if(idx == 0){
			str_basket_no = str_basket_no + str;
		} else {
			str_basket_no = str_basket_no + "," + str;
		}
	});//each
	let buy_now_prdt_no = "${list[0].prdt_no}";
	let buy_now_qty = "${list[0].buy_qty}";
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".addr_choice_btn").click(function() {

			$("#td_delivery").html( $("#td_delivery" + $(this).attr("name") ).html() );
			$("#addr_no").val( $(this).val() );
			$("#delivery_choice_modal").modal("hide");

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".addr_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/delivery/delete"
					, {
						addr_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("배송지 주소를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/order/order_list?arr_basket_no="+arr_basket_no;
						} else {
							alert("배송지 주소 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".credit_card_choice_btn").click(function() {

			$("#td_credit_card").html( $("#td_credit_card" + $(this).attr("name") ).html() );
			$("#card_no").val( $(this).val() );
			$("#credit_card_choice_modal").modal("hide");

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$(".credit_card_delete_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/credit/card/delete"
					, {
						card_no : $(this).val()
					}
					, function(data, status) {
						if(data >= 1){
							alert("신용 카드를 삭제 하였습니다.");
							location.href="${pageContext.request.contextPath}/order/order_list?arr_basket_no="+arr_basket_no;
						} else {
							alert("신용 카드 삭제를 실패 하였습니다.");
						}
					}//call back function
			);//get

		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#order_btn").click(function() {

			$.post(
					"${pageContext.request.contextPath}/order/insert"
					, {
						addr_no : $("#addr_no").val()
						, card_no : $("#card_no").val()
						, order_product_cnt : $("#span_sum_product_class_qty").text()
						, order_amt : $("#span_sum_buy_amt").text()
						, discount_amt : $("#span_sum_discount_amt").text()
						, pay_amt : $("#span_sum_total_buy_amt").text()
						, str_basket_no : str_basket_no
						, buy_now_prdt_no : buy_now_prdt_no
						, buy_now_qty : buy_now_qty
					}
					, function(data, status) {
						if(data >= 1){
							alert("주문을 성공적으로 등록 하였습니다.");
							location.href="${pageContext.request.contextPath}/history/my_order_list";
						} else if(data <= 0){
							alert("주문 등록을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready
	</script>
	
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
	        ,name: $("#md_name").val()	//상품이름 들어가는곳		
	        ,amount: $("#span_sum_total_buy_amt").text() //가격정보
	        ,buyer_name: '${login_info.mid}'  			
	        ,buyer_tel:'${login_info.mtel}' 		
	        ,buyer_email: '${login_info.memail}'		
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
