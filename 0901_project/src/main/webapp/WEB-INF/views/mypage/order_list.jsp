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
						<a onclick="pwd_ch()">회원 정보 수정</a>
						
						<h4>나의 쇼핑</h4>
						<a href="${pageContext.request.contextPath}/">예매 내역</a>
						
					</div>
				</div>
			</div>
			<div id="main-content">
				<h2>예매 내역</h2>
				<div class="list-box">
					<table>
						<tr class="list-top">
							<td class="order-no">예매 번호</td>
							<td class="order-prdt">영화명</td>
							<td class="order-date">결제일</td>
							<td class="order-amt">결제 금액</td>
							<td class="order_seat">예매 좌석</td>
						</tr>
						<c:forEach var="list" items="${order_list}" varStatus="status">
						<tr class="order-list">
							<td class="order-no">
								<input type="hidden" id="order_no${status.index}" name="order_no${status.index}" value="${list.order_no}">
								${list.order_no}
							</td>	
							<td class="order-prdt">
								<div class="order-prdt-box">
											<p>${list.title}</p>
								</div>
							</td>
							<td class="order-date">${list.reserve_date}</td>
							<td class="order-amt">18000 원 (수정해야됨)</td>
							<td class="order_seat">${list.selectedSeat}</td>
							
						</tr>
						</c:forEach>
						<c:if test="${order_cnt == 0}">
						<tr>
							<td colspan="6">예매 내역이 없습니다.</td>
						</tr>
						</c:if>
					</table>
				</div>
			</div>
		</main>	
	
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