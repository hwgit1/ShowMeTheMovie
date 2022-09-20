<%@page import="kr.co.ictedu.util.dto.MemberDTO"%>
<%@page import="kr.co.ictedu.dto.ReserveSeatDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
 	ReserveSeatDto seat = (ReserveSeatDto) request.getAttribute("seat");
 	MemberDTO login = (MemberDTO)session.getAttribute("login_info");
	if(login!= null) System.out.println(login.toString());
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 
    <link rel="stylesheet" href="/resources/css/reset.css">
    <link rel="stylesheet" href="/resources/css/reserve.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
    <script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
    <link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <!-- MATERIAL DESIGN ICONIC FONT -->

</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

    <div class="reserve-container">
        <div class="movie-part">
            <div class="reserve-title">영화</div>
            <div class="sort-wrapper">
                <div class="sort-rate sort-selected">예매율순</div>
            </div>
             <div class="movie-list-wrapper">
                <div class="movie-list">
                </div>
            </div>
        </div>
        <div class="theater-part">
            <div class="reserve-title">
                극장
            </div>
            <div class="theater-container">
                <div class="theater-wrapper">
                    <div class="theater-location-wrapper">
                        <button class="theater-location">서울(18)</button>
                        <button class="theater-location">경기(43)</button>
                        <button class="theater-location">인천(10)</button>
                        <button class="theater-location">강원(5)</button>
                    </div>
                    <div class="theater-place-wrapper">
                        <button class="theater-place">신촌</button>
                        <button class="theater-place">홍대</button>
                        <button class="theater-place">건대입구</button>
                        <button class="theater-place">구로</button>
                        <button class="theater-place">대학로</button>
                        <button class="theater-place">동대문</button>
                        <button class="theater-place">목동</button>
                        <button class="theater-place">명동</button>
                        <button class="theater-place">미아</button>
                        <button class="theater-place">불광</button>
                        <button class="theater-place">상봉</button>
                        <button class="theater-place">송파</button>
                        <button class="theater-place">수유</button>
                        <button class="theater-place">압구정</button>
                        <button class="theater-place">여의도</button>
                        <button class="theater-place">영등포</button>
                        <button class="theater-place">왕십리</button>
                        <button class="theater-place">중계</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="day-part">
            <div class="reserve-title">날짜</div>
            <div class="reserve-date"></div>
        </div>
        <div class="time-part">
            <div class="reserve-title">시간</div>
            <div class="reserve-time">
                <div class="reserve-where" id="4관(Laser) 6층(총 120석)">4관(Laser) 6층(총 120석)</div>
                <div class="reserve-time-wrapper">
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="4관(Laser) 6층(총 120석)">12:20</span>
	            <span class="reserve-time-remain">120석</span>
	        </button>
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="4관(Laser) 6층(총 120석)">14:20</span>
	            <span class="reserve-time-remain">120석</span>
	        </button>
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="4관(Laser) 6층(총 120석)">16:20</span>
	            <span class="reserve-time-remain">120석</span>
	        </button>
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="4관(Laser) 6층(총 120석)">18:20</span>
	            <span class="reserve-time-remain">120석</span>
	        </button>

                </div>
            </div>
<!--             2번쨰 관 -->
            <div class="reserve-time">
                <div class="reserve-where" id="2관(4DX) 5층(총 80석)">2관(4DX) 5층(총 80석)</div>
                <div class="reserve-time-wrapper">
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="2관(4DX) 5층(총 80석)">12:20</span>
	            <span class="reserve-time-remain">80석</span>
	        </button>
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="2관(4DX) 5층(총 80석)">14:20</span>
	            <span class="reserve-time-remain">80석</span>
	        </button>
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="2관(4DX) 5층(총 80석)">16:20</span>
	            <span class="reserve-time-remain">80석</span>
	        </button>
	        <button class="reserve-time-button">
	            <span class="reserve-time-want" id="2관(4DX) 5층(총 80석)">18:20</span>
	            <span class="reserve-time-remain">80석</span>
	        </button>

                </div>
            </div>
            <div>
            <form class="moveSeatForm" action="moveSeat.do" method="post">
            <input type="hidden" class="title" name="title">
            <input type="hidden" class="movieAge" name="movieAge">
            <input type="hidden" class="selectedTheater" name="selectedTheater">
            <input type="hidden" class="reserveDate" name="movieDate">
            <input type="hidden" class="runningTime" name="runningTime">
            <input type="hidden" class="reserveWhere" name="reserveWhere">
            <button class="moveSeatButton" type="button">예약하기</button>
            </form>
            </div>
        </div>

    </div>
    <script src="/resources/js/reserve.js"></script>
</body>
</html>