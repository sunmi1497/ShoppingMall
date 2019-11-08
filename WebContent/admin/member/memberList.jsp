<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
	function go_searchM() {
		document.frm.action = "TalentServlet?command=admin_member_list";
		document.frm.submit();
	}
	
	function Enter_Check() {
		// 엔터의 키코드는 13
		if(event.keyCode == 13) {
			go_searchM();
			return;	//* 원래의 enter?
		}
	}
</script>

<article>
	<h1>회원리스트</h1>
	<form name="frm" method="post">
		<table style="float: right;">
			<tr>
				<td>
					회원 이름
					<input type="text" name="key" onkeydown="Enter_Check();">
					<input class="btn" type="button" value="검색" onclick="go_searchM()">
				</td>
			</tr>
		</table>
		<br>
		<table id="orderList">
			<tr>
				<th>아이디(탈퇴여부)</th>
				<th>이름</th>
				<th>이메일</th>
				<th>주소</th>
				<th>전화</th>
				<th>가입일</th>
			</tr>
			<c:forEach items="${memberList}" var="memberVO">
				<tr>
					<td>${memberVO.id}
						<c:choose>
							<c:when test='${memberVO.useyn=="y"}'>
								<input type="checkbox" name="useyn" disabled="disabled">
							</c:when>
							<c:otherwise>
								<input type="checkbox" name="useyn" checked="checked" disabled="disabled">
							</c:otherwise>
						</c:choose>
					</td>
					<td>${memberVO.name}</td>
					<td>${memberVO.email}</td>
					<td>${memberVO.address}</td>
					<td>${memberVO.phone}</td>
					<td><fmt:formatDate value="${memberVO.indate}" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>
	
	<!-- jsp:include 페이지 include하며 파라미터 보내주기 -->
	<jsp:include page="/paging/pagingM.jsp">
		<jsp:param value="${paging.page }" name="page"/>
		<jsp:param value="${paging.beginPage }" name="beginPage"/>
		<jsp:param value="${paging.endPage }" name="endPage"/>
		<jsp:param value="${paging.prev }" name="prev"/>
		<jsp:param value="${paging.next }" name="next"/>
		<jsp:param value="${keyM}" name="keyM"/>
	</jsp:include>
	<!-- jsp:param '보내주는 파라미터들 5개' -->
</article>
<%@ include file="/admin/footer.jsp"%>