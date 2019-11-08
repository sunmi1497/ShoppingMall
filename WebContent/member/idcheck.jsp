<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript">
	function idok() {
		opener.frm.id.value = "${id}";
		opener.frm.reid.value = "${id}";
		self.close();
	}
</script>
</head>
<body>
	<h2>ID 중복확인</h2>
	<form method=post name=frm action="TalentServlet?command=id_check_form" style="margin-right: 0">
		User ID
		<input type=text name="id" value="${id}">
		<input type=submit value="검색" class="submit"><br>
		
		<div style="margin-top: 20px">
			<c:if test="${message == 1}">
				<script type="text/javascript">
					opener.document.frm.id.value = ""; /* opener의 아이디칸을 비운다 */
				</script>
				
				${id}는 이미 사용중인 아이디입니다.
			</c:if>
			<c:if test="${message == -1}">
				${id}는 사용 가능한 ID입니다.
				<input type="button" value="사용" class="cancel" onclick="idok()">
			</c:if>
		</div>
	</form>
</body>
</html>