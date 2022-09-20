<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>showmethemovie</title>
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
						<a onclick="pwd_ch()">회원정보 변경</a>
						
						<h4>나의 예매</h4>
						<a href="${pageContext.request.contextPath}/mypage/order">예매 내역</a>
						
					</div>
				</div>
			</div>
			<div id="main-content">
				
				<div class="record">
					<h4>최근 예매 내역</h4>
					<div class="list-box">
						<table>
							<tr class="list-top">
								<td class="rorder-no">예매 번호</td>
								<td class="rorder-prdt">영화명</td>
								<td class="rorder-amt">예매 금액</td>
								<td class="rorder_seat">예매 좌석</td>
								<td class="rorder-date">결제일</td>
							</tr>
							<c:forEach var="olist" items="${recent_order_list}">
							<tr>
								<td class="rorder-no">${olist.order_no}</td>	
								<td class="rorder-prdt">${olist.title}</td>
								<td class="rorder-amt">18000원(수정해야됨)</td>
								<td class="rorder_seat">${olist.selectedSeat}</td>
								<td class="rorder-date">${olist.reserve_date}</td>
							</tr>
							</c:forEach>
							
						</table>
					</div>
				</div>
				
			</div>
		</main>	
	
	<script type="text/javascript">
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