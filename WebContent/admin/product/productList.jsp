<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<script type="text/javascript">
function go_searchP() {
	var theForm = document.frm;
	theForm.action = "TalentServlet?command=admin_product_list";
	theForm.submit();
}

function go_total() {
	var theForm = document.frm;
	theForm.key.value = "";
	theForm.action = "TalentServlet?command=admin_product_list";
	theForm.submit();
}

function Enter_Check() {
	// 엔터의 키코드는 13
	if(event.keyCode == 13) {
		go_searchP();
		return;	//* 원래의 enter?
	}
}

function go_wrt() {
	var theForm = document.frm;
	
	theForm.action = "TalentServlet?command=admin_product_write_form";
	theForm.submit();
}

function go_detail(tpage, pseq) {
	var theForm = document.frm;
	// 상품 상세 보기 페이지에서 다시 상품 리스트로 돌아왔을 경우 현재 페이지로
	// 돌아올 수 있도록 하기 위해서 현재 페이지 번호를 쿼리 스트링으로 넘겨준다.
	theForm.action = "TalentServlet?command=admin_product_detail&tpage="
			+ tpage + "&pseq=" + pseq;

	theForm.submit();
}
</script>

<article>
	<h1>상품리스트</h1>
	<form name="frm" method="post">
		<input  type="hidden" name="all_view" value="y">
		
		<table>
			<tr>
				<td width="642">
				상품명
				<input type="text" name="key" onkeydown="Enter_Check();">
				<input class="btn" type="button" name="btn_search" value="검색" onClick="go_searchP()">
				<input class="btn" type="button" name="btn_total" value="전체보기 " onClick="go_total()">
				<input class="btn" type="button" name="btn_write" value="상품등록" onClick="go_wrt()">
				</td>
			</tr>
		</table>
		
		<table id="productList">
			<tr>
				<th>번호</th>
				<th>상품명</th>
				<th>지역</th>
				<th>판매가</th>
				<th>등록일</th>
				<th>사용유무</th>
				<th>베스트상품</th>
			</tr>
			
			<c:choose>
				<c:when test="${productListSize<=0}">
					<tr>
						<td width="100%" colspan="7" align="center" height="23">
							등록된 상품이 없습니다.
						</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach items="${productList}" var="productVO">
						<tr>
							<td height="23" align="center">${productVO.pseq}</td>
							<td style="text-align: left; padding-left: 50px; padding-right: 0px;">
								<a href="#" onClick="go_detail('${tpage}', '${productVO.pseq}')">
									${fn:substring(productVO.ptitle, 0, 20)} ...
								</a>
							</td>
							<td>${productVO.area}</td>
							<td><fmt:formatNumber value="${productVO.price}" /></td>
							<td><fmt:formatDate value="${productVO.indate}" /></td>
							<td>
								<c:choose>
									<c:when test='${productVO.useyn=="y"}'>사용</c:when>
									<c:otherwise>미사용</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test='${productVO.bestyn=="y"}'>Y</c:when>
									<c:otherwise>N</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
	
	<!-- jsp:include 페이지 include하며 파라미터 보내주기 -->
	<jsp:include page="/paging/pagingP.jsp">
		<jsp:param value="${paging.page }" name="page"/>
		<jsp:param value="${paging.beginPage }" name="beginPage"/>
		<jsp:param value="${paging.endPage }" name="endPage"/>
		<jsp:param value="${paging.prev }" name="prev"/>
		<jsp:param value="${paging.next }" name="next"/>
		<jsp:param value="${keyP}" name="keyP"/>
	</jsp:include>
	<!-- jsp:param '보내주는 파라미터들 5개' -->
	
</article>

<%@ include file="/admin/footer.jsp"%>