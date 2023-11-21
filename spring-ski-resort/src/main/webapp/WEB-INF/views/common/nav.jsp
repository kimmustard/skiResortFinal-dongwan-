<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="/resources/css/nav.css">

</head>
<body>
<div class="navContainer">
	<nav id="hide"></nav>

	<nav class="ski-navbar" id="ski-navbar">
  <div class="ski-collapse">
    <a class="ski-navbar-brand" href="/">다이스키</a>
       <div class="ski-nav-link"><a href="/rental/fee-info">렌탈</a></div>
       <div class="ski-nav-link"><a href="#">Pricing</a></div>
       <div class="ski-nav-link"><a href="#">Pricing</a></div>
       <div class="ski-nav-link"> <a href="/notice/list">고객센터</a></div>
       <div class="ski-nav-link"><a href="/hotel/reservation">예약</a></div>
       <ul class="ski-side-navbar">
       <sec:authorize access="isAnonymous()">
       	
	       	<li><a href="/member/login">로그인</a></li>
	       	<li><a href="/member/register">회원가입</a></li>
       	</sec:authorize>
       <sec:authorize access="isAuthenticated()">
       <sec:authentication property="principal.omvo.memberEmail" var="authEmail"/>
       		<li>${authEmail}님 안녕하세요.</li>
	       	<li><a href="/member/detail">회원정보</a></li>
	       	<li><a href="/member/logout">로그아웃</a></li>
       	</sec:authorize>
       </ul>
  </div>
</nav>
</div>
<div class="ski-blank" id="ski-blank"></div>
<script type="text/javascript" src="/resources/js/nav.js" ></script>
