<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/admin/header.jsp"%>
<%@ include file="/admin/sub_menu.jsp"%>
<script type="text/javascript">
function go_save() {
	var theForm = document.frm;
	
	if (theForm.kind.value == '') {
		alert('상품분류를 선택하세요.');
		theForm.kind.focus();
	} else if (theForm.ptitle.value == '') {
		alert('상품명을 입력하세요.');
		theForm.ptitle.focus();
	} else if (theForm.area.value == '') {
		alert('지역을 입력하세요.');
		theForm.area.focus();
	} else if (theForm.price.value == '') {
		alert('판매가를 입력하세요.');
		theForm.price.focus();
	} else if (theForm.period.value == '') {
		alert('작업 기간을 입력하세요.');
		theForm.period.focus();
	} else if (theForm.content.value == '') {
		alert('상품상세를 입력하세요.');
		theForm.content.focus();
	} else if (theForm.image.value == '') {
		alert('상품이미지들 입력하세요.');
		theForm.image.focus();
	} else {
		theForm.encoding = "multipart/form-data";
		theForm.price.value = removeComma(theForm.price);
		
		theForm.action = "TalentServlet?command=admin_product_write";
		theForm.submit();
	}
}

function go_mov() {
	var theForm = document.frm;
	theForm.action = "TalentServlet?command=admin_product_list";
	theForm.submit();
}
</script>
<article>
	<h1>상품등록</h1>
	
	<!-- [1] 파일을 업로드 하기 위해서는 폼태그를 post 방식으로 전송하고,
	인코딩 타입을 multipart/form-data 로 지정해야 한다. -->
	<form name="frm" method="post" enctype="multipart/form-data">
		<table id="list">
			<tr>
				<th>상품분류</th>
				<td colspan="5">
					<select name="kind">
						<c:forEach items="${kindList}" var="kind" varStatus="status">
							<option value="${status.count}">${kind}</option>
						</c:forEach>
					</select>
				</td>
			<tr>
				<th>상품명</th>
				<td width="343" colspan="5">
					<input type="text" name="ptitle" size="47" maxlength="100">
				</td>
			</tr>
			<tr>
				<th>지역</th>
				<td width="70">
					<input type="text" name="area" size="11" value="서울">
				</td>
				<th>판매가</th>
				<td width="70">
					<input type="text" name="price" size="11" onKeyUp='NumFormat(this)' value="20000">
				</td>
				<th>기간(Day)</th>
				<td width="72">
					<input type="text" name="period" size="11" value='3'>
				</td>
			</tr>
			
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="id" size="11" value="${loginUser.id }" readonly>
				</td>
				<th>전화번호</th>
				<td colspan="3">
					<input type="text" name="phone" size="20" value="010-2234-6593">
				</td>
			</tr>
			
			<tr>
				<th>상세설명</th>
				<td colspan="5">
					<textarea name="content" rows="8" cols="70">이뻐요</textarea>
				</td>
			</tr>
			<tr>
				<th>상품이미지</th>
				<td width="343" colspan="5">
					<!--  [2] 파일 업로드를 하기 위한 input 태그는 타입 속성 값을 file로 지정해야 한다.  -->
					<input type="file" name="image">
				</td>
			</tr>
		</table>
		
		<input class="btn" type="button" value="등록" onClick="go_save()">
		<input class="btn" type="button" value="취소" onClick="go_mov()">
	</form>
</article>

<%@ include file="/admin/footer.jsp"%>