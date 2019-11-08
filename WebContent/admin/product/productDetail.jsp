<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
function go_list(tpage) {
	var theForm = document.frm;
	// 상품 리스트로 이동하되 현재 페이지를 쿼리 스트링으로 넘긴다.
	theForm.action = "TalentServlet?command=admin_product_list&page=" + tpage;
	theForm.submit();
}

function go_mod(tpage, pseq) {
	var theForm = document.frm;
	// 현재 페이지를 쿼리 스트링으로 넘긴다.
	theForm.action = "TalentServlet?command=admin_product_update_form&tpage="
			+ tpage + "&pseq=" + pseq;
	
	theForm.submit();
}
</script>

<article>
	<h1>상품 상세 보기</h1>
	<form name="frm" method="post">
		<table id="list">
			<tr>
				<th>상품분류</th>
				<td colspan="5">${kind}</td>
			</tr>
			<tr>
				<th align="center">상품 명</th>
				<td colspan="5">${productVO.ptitle}</td>
			</tr>
			
			<tr>
				<th>지역</th>
				<td width="60">${productVO.area}</td>
				<th>판매가 [B]</th>
				<td width="60">${productVO.price}</td>
				<th>작업기간</th>
				<td>${productVO.period}</td>
			</tr>
			
			<tr>
				<th>아이디</th>
				<td>${productVO.id }
				</td>
				<th>전화번호</th>
				<td colspan="3">
					${productVO.phone}
				</td>
			</tr>
			
			<tr>
				<th>상세설명</th>
				<td colspan="5">${productVO.content}</td>
			</tr>
			
			<tr>
				<th>상품이미지</th>
				<td colspan="5" align="center">
					<!--[7] 상품 이미지를 출력하기 -->
					<img src="product_images/${productVO.image}" width="200pt">
				</td>
			</tr>
		
		</table>
		<!--[8] 수정 버튼이 눌리면 상품 수정 페이지로 이동하되 현재 페이지와 상품 일련번호 값을 전달해 준다. -->
		<input class="btn" type="button" value="수정"
			onClick="go_mod('${tpage}','${productVO.pseq}')">
		<!--[9] 목록 버튼이 눌리면 상품 리스트 페이지로 이동하되 현재 페이지를 전달해 준다. -->
		<input class="btn" type="button" value="목록"
			onClick="go_list('${tpage}')">
	</form>
</article>

<%@ include file="/admin/footer.jsp"%>