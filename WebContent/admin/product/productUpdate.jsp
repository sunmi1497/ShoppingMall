<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
function go_mod_save(tpage) {	//* pseq 리퀘스트 공간으로 쭉 전해지는 중(여긴 굳이 안써줘도 됨)
	var theForm = document.frm;
	
	if (theForm.kind.value == '') {
		alert('상품분류를 선택하세요');
		theForm.kind.focus();
	} else if (theForm.ptitle.value == '') {
		alert('상품명을 입력하세요');
		theForm.name.focus();
	} else if (theForm.area.value == '') {
		alert('지역을 입력하세요');
		theForm.area.focus();
	} else if (theForm.price.value == '') {
		alert('판매가를 입력하세요');
		theForm.price.focus();
	} else if (theForm.period.value == '') {
		alert('작업기간을 입력하세요');
		theForm.period.focus();
	} else if (theForm.content.value == '') {
		alert('상품상세를 입력하세요');
		theForm.content.focus();
	} else {
		if ( confirm('수정하시겠습니까?') ) {
			// check 박스가 두개가 아니라 한개만 사용하므로 따로 메소드 만들어줘서 value 전해줌
			if (theForm.useyn.checked == true) {
				theForm.useyn.value = "y";
			}
			if (theForm.bestyn.checked == true) {
				theForm.bestyn.value = "y";
			}
			// 업로드용
			theForm.encoding = "multipart/form-data";
			theForm.price.value = removeComma(theForm.price);	//* onKeyUp , 콤마 지워주기
			
			theForm.action = "TalentServlet?command=admin_product_update&page=" + tpage;
			//* tpage => request.get으로 list에서 다시 불러짐 => page로 보내줌
			theForm.submit();
		}
	}
}

function go_mov() {
	var theForm = document.frm;
	theForm.action = "TalentServlet?command=admin_product_list";
	theForm.submit();
}
</script>

<article>
	<h1>상품수정</h1>
	<form name="frm" method="post" enctype="multipart/form-data">	<!-- 업로드용 enctype -->
		<input type="hidden" name="pseq" value="${productVO.pseq}">
		<input type="hidden" name="nonmakeImg" value="${productVO.image}">
		
		<table id="list">
			<tr>
				<th>상품분류</th>
				<td colspan="5">
					<select name="kind">
						<c:forEach items="${kindList}" var="kind" varStatus="status"><!-- varStatus 이용 -->
							<c:choose>
								<c:when test="${productVO.kind==status.count}"><!-- status.count - 1부터의 순서 -->
									<option value="${status.count}" selected="selected">${kind}</option>
								</c:when>
								<c:otherwise>
									<option value="${status.count}">${kind}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td width="343" colspan="5">
					<input type="text" name="ptitle" size="47" maxlength="100" value="${productVO.ptitle}">
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td width="70">
					<input type="text" name="area" size="11" value="${productVO.area}">
				</td>
				<th>판매가</th>
				<td width="70">
					<input type="text" name="price" size="11"
					onKeyUp='NumFormat(this)' value="${productVO.price}">
					<!-- onKeyUp 메시지를 입력할때 발생 -->
				</td>
				<th>기간(Day)</th>
				<td width="72">
					<input type="text" name="period" size="11" value="${productVO.period}">
				</td>
			</tr>
			
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" size="11" value="${productVO.id }" readonly>
				</td>
				<th>전화번호</th>
				<td colspan="3">
					<input type="text" name="phone" size="20" value="${productVO.phone }">
				</td>
			</tr>
			
			<tr>
				<th>베스트상품</th>
				<td><c:choose>
						<c:when test='${productVO.bestyn=="y"}'>
							<input type="checkbox" name="bestyn" value="y" checked="checked">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="bestyn" value="n">
						</c:otherwise>
				</c:choose></td>
				<th>사용유무</th>
				<td><c:choose>
						<c:when test='${productVO.useyn=="y"}'>
							<input type="checkbox" name="useyn" checked="checked">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="useyn">
						</c:otherwise>
				</c:choose></td>
			</tr>
			
			<tr>
				<th>상세설명</th>
				<td colspan="5">
					<textarea name="content" rows="8" cols="70">${productVO.content}</textarea>
				</td>
			</tr>
			<tr>
				<th>상품이미지</th>
				<td colspan="5">
					<img src="product_images/${productVO.image}" width="200pt"> <br>
					<input type="file" name="image">
				</td>
			</tr>
		</table>
		
		<input class="btn" type="button" value="수정"
			onClick="go_mod_save('${tpage}')">
		<input class="btn" type="button" value="취소" onClick="go_mov()">
	</form>
</article>

<%@ include file="/admin/footer.jsp"%>