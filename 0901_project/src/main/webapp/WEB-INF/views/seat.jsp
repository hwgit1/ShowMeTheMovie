<%@page import="java.util.List"%>
<%@page import="kr.co.ictedu.dto.ReserveSeatDto"%>
<%@page import="kr.co.ictedu.dto.CGVReserveDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%	
	
 	CGVReserveDto reserve = (CGVReserveDto) request.getAttribute("reserve");
	ReserveSeatDto seat = (ReserveSeatDto) request.getAttribute("seat");
	List<ReserveSeatDto> list =(List<ReserveSeatDto>) request.getAttribute("list");
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
							<span>남은좌석</span><span class="remain-seats">120</span>/<span
								class="all-seats">555</span>
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
						<input type="hidden" class="title" name="title"> 
						<input type="hidden" class="selectedTheater" name="selectedTheater">
						<input type="hidden" class="reserveWhere" name="reserveWhere">
						<input type="hidden" class="reserveDate" name="movieDate">
						<input type="hidden" class="runningTime" name="runningTime">
						<input type="hidden" class="movieAge" name="movieAge"
							value="<%=reserve.getMovieAge()%>">
						<!-- 티켓의수(선택한 좌석) -->
						<input type="hidden" class="ticketNumber" name="ticketNumber">
						<input type="hidden" class="selectedSeat" name="selectedSeat">
						<input type="hidden" class="seat_Cnt" name="seat_Cnt">
						<!-- 결제 정보 -->
						<input type="hidden" class="pay" name="pay">
						<button type="button" class="reserve-button">
							진행하기<img src="/resources/img/payment_icon_yellow_medium.png">
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
<<<<<<< HEAD
	<input type="hidden" value="<%= list.toString() %>" name="seatseat" class="seatseat">
	<input type="hidden" value="<%= reserve.getReserveWhere()%>" name="reservename" class="reservename">
=======
	
>>>>>>> origin/민기
</body>
<script th:inline="javascript">
var seatnono=[[${seat.seat_cnt}]];

</script>
<script src="/resources/js/seat.js"></script>
<script type="text/javascript">
const seat = document.querySelector('.seat');
if
</script>

</html>