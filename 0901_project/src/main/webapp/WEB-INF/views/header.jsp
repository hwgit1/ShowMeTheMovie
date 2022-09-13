<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib  prefix="spring" uri="http://www.springframework.org/tags" %>     
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300;400;500&display=swap" rel="stylesheet">
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/CSS/basic_style.css">
      
      <div id="header">
         <div id="top-header">
            <c:choose>
               <c:when test="${login_info != null && login_info.mem_email != null}">
                  <a class="top-item" href="${pageContext.request.contextPath}/logout"> 로그아웃 </a>
                  <a class="top-item" href="${pageContext.request.contextPath}/mypage/"> 마이페이지 </a>
                  <span class="top-item" style="color: #F2EEA7;">${login_info.mem_name}님</span>
               </c:when>
               <c:otherwise>
               <a class="top-item" href="${pageContext.request.contextPath}/login_form">로그인</a>
               <a class="top-item" href="${pageContext.request.contextPath}/join/form">회원가입</a>
               </c:otherwise>
            </c:choose>
         </div>
         <div id="middle-header">
            <div id="logo-bar">
               <a href="${pageContext.request.contextPath}/main">
                  <img id="logo" alt="LOGO" src="${pageContext.request.contextPath}/resources/img/logo.png">
               </a>
            </div>
            <div id="search-bar">
               <div id="search">
                  <form action="${pageContext.request.contextPath}/search/searchlist" method="get">
                     <input type="text" placeholder="검색 키워드" id="searchWord" name="searchWord" value="${search_dto.searchWord}">
                     <button type="submit">검 색</button>
                  </form>
               </div>
            </div>
         </div>
         <div id="bottom-header">
            <div id="navMenu">
               <ul id="big-menu">
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=1">
                        <span>영화</span>
                     </a>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=2">
                        <span>예매</span>
                     </a>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=3">
                        <span>공지사항</span>
                     </a>
                  </li>
                  <li>
                     <a href="${pageContext.request.contextPath}/product/bigcatelist?bigcate_no=4">
                        <span>Q&A</span>
                     </a>
                  </li>
               </ul>
            </div>
         </div>
      </div>