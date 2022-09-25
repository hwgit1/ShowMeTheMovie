<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

 <%
// CGVMemberDto login = (CGVMemberDto)session.getAttribute("login");
// if(login!= null) System.out.println(login.toString());
%> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" type="text/css" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="resources/css/main.css">
    

</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
			<div id="movie-menu">
								<ul id="movie-ing">
				                  <li>
				                     <a href="${pageContext.request.contextPath}/play">
				                        <h3><span>상영 중인 영화 &nbsp;</span></h3>
				                     </a>
				                  </li>
				                 
				                 
				                  <li>
				                     <a href="${pageContext.request.contextPath}/plan">
				                        </h3><span> &nbsp; 상영 예정 영화</span></h3>
				                     </a>
				                  </li>
				               </ul>
			</div>
		         
		         
		 <div>
            <div class="movie-infomation-wrapper">

                <div class="movie-informaion">
                    <div class="movie-rank"></div>
                    <div class="poster-wrapper"><img src="resources/img/background.jpg"></div>
                    <div>
                        <div class="movie-title"></div>
                        <div class="movie-rate"><span></span><span style="margin-left: 10px;"></span></div>
                        <div class="movie-date"></div>
                        <div class="like-reserve-wrapper">
                            
                            <button class="reserveButton"><img src="resources/img/reserve.PNG"></button>
                        </div>
                    </div>
                </div>
                

            </div>
        </div>

        <script src="resources/js/main.js"></script>
</body>
</html>