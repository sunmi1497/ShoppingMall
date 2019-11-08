<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<style>

#temp{position:relative; width:100px; height:25px; magin:0 auto; text-align:center; }

#login_form{width:200px; height:120px; border:1px solid silver; border-radius:5px; 
			text-align:center; line-height:50px; background:#f9f9f9;
			margin:0 auto; float:right; margin-right:65px;}
.attr{width:200px; height:40px;}			
.attr1 input{width:180px; height:22px; float:right;
			font-size:85%; text-align:center; border:1px solid silver;
			line-height:40px; font-weight:bold; margin-right:8px;  margin-top:5px;}
.attr2 input{width:180px; height:22px; float:right;
			font-size:85%; text-align:center; border:1px solid silver; 
			line-height:40px; font-weight:bold; margin-right:8px; margin-top:2px;}	
.attr3{width:200px; height:50px; text-align:center; margin-top:-10px;}							
.message{width:150px; height:25px; margin:10px auto;
			font-size:90%; text-align:center;line-height:25px;}					
</style>

<div id="main">
	<div id="serv">
		<div id="serv_1">
			<img src="images/01.jpg">
			<img src="images/02.jpg">
			<img src="images/03.jpg">
			<img src="images/04.jpg">
			<img src="images/05.jpg">
			<img src="images/06.jpg">
		</div>
	</div>
	
	<div id="login_form">
		<form action="TalentServlet?command=main_login" method="post">
			<div class="attr">
				<div class="attr1"><input type="text" name="id" placeholder="아이디"></div>
			</div>
			<div class="attr">
				<div class="attr2"><input type="password" name="pwd" placeholder="패스워스"></div>
			</div>
				<div class="attr3">
				<input type="submit" value="로그인" >
				<input type="button" value="회원가입" onclick="location.href='TalentServlet?command=join_form'">
				</div>
			<div class="message">${message}</div>
		</form>
	</div> 
</div>

<table class="tab">
	<tr class="nav">
		<td id="nav1" ><a href="">판매 인기순</a></td>
		<td id="nav2" ><a href="">신규 등록순</a></td>	
	</tr>
</table>			
	<table class="list">
		<tr>
			<td colspan="4" style="border:white; text-align:right">
			</td>
		</tr>
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>등록일자</td>
			<td>조회수</td>
		</tr>
			<c:forEach var="productList" items="${productList}">
				<tr class="record">
					<td>${productList.pseq}</td>
					<td>
					<a href="TalentServlet?command=product_detail&pseq=${productList.pseq}">${productList.ptitle}</a>
					</td>
					<td><fmt:formatDate value="${productList.indate}"/>
					</td>
					<td>${productList.readcount}</td>
					</tr>
			</c:forEach>
	</table>
	
<jsp:include page="paging/pagingP.jsp">
	<jsp:param value="${paging.page}" name="page"/>
	<jsp:param value="${paging.beginPage}" name="beginPage"/>
	<jsp:param value="${paging.endPage}" name="endPage"/>
	<jsp:param value="${paging.prev}" name="prev"/>
	<jsp:param value="${paging.next}" name="next"/>
</jsp:include>	

<div class="clear"></div>	

<%@ include file="footer.jsp"%>