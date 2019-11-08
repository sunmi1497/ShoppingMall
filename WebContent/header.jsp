<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재능넷-재능판매</title>
<script src="http://code.jquery.com/jquery-1.11.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script src="member/member.js"></script>
<link href="css/header.css" rel="stylesheet">
</head>
<body>
<div id="wrap">

	<div id="first_div">
	  <div id="top">
			<div id="top_menu">			 
				<div id="top_left">
				<span style="color:red">[★이벤트중]</span>
				가입인사 남기면 재능구매시 1,000원을 할인해드립니다
				</div>
				<div id="top_right">
					<ul>
					<c:choose>
					<c:when test="${empty loginUser}">
						<li><a href="TalentServlet?command=login_form"> 로그인</a></li>
						<li><a href="#"> 회원가입</a></li>
						<li><a href="#"> 마이페이지</a></li>
						<li><a href="#"> 장바구니</a></li>
						<li><a href="#"> 주문내역</a></li>	
						</c:when>
					<c:otherwise>
						
			
						<li style="color:orange">
							${loginUser.name}(${loginUser.id}) 님
						</li>
						<li>
						<a href="TalentServlet?command=logout">
						로그아웃</a></li>
						<li></li>
						<li><a href="TalentServlet?command=cart_list">장바구니</a></li>
						<li></li>
						<li><a href="TalentServlet?command=mypage">마이페이지</a></li>
						
					</c:otherwise>	
				</c:choose>
					</ul>
				</div>
			</div>
		</div>

	<div id= "base">
		<div id="base_01">
		<a href="TalentServlet?command=main_login_form">
		<img src="images/logo.png" style="width:80px; height:80px" >
		<img src="images/logo_1.png" style="width:92px; height:39px" >
		</a>
		</div>
		<div id="base_02">		
			<div class="search_bar">
				<select id="id">
					<option>재능검색</option>
					<option>판매자 닉네임</option>
				</select>
				
				<input type="text" id="t_search" placeholder="재능명 또는 판매자 닉네임 검색">
				<input type="button" id="button_search" value="검색">			
			</div>
		</div>	
		<div id="base_03">	
			<a href="#"><div id="box01">재능등록
			</div></a>
			<a href="#"><div id="box02">이용방법
			</div></a>
		</div>	
		</div>
</div>
			
	<div id="category">	
		<div id ="category_menu">
			<div id="menu01"><a href="TalentServlet?command=product_list">디자인</a></div>
			<div id="menu01"><a href="TalentServlet?command=product_list">번역/외국어</a></div>
			<div id="menu01"><a href="TalentServlet?command=product_list">문서작성</a></div>
			<div id="menu01"><a href="TalentServlet?command=product_list">음악/영상</a></div>
			<div id="menu01"><a href="TalentServlet?command=product_list">프로그램개발</a></div>
			<div id="menu01"><a href="TalentServlet?command=product_list">마케팅/비즈니스</a></div>	
			<div id="menu01"><a href="TalentServlet?command=product_list">생활서비스</a></div>
		</div>	
	</div>	
	
<div class="clear"></div>	