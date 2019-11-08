<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paging</title>
<style type="text/css">
body {
	text-align:center;
}
#paging {		/* 페이징 폰트크기 조절 */
	font-size: 110%;
}
</style>
</head>
<body>
<div id="paging">
	
	<c:url var="action" value="TalentServlet?command=admin_product_list&key=${param.keyP }" /><!-- ${action } -->
	
	<c:if test="${param.prev }"><!-- prev true인지 테스트 -->
		<a href="${action }&page=${param.beginPage-1 }">prev</a>
	</c:if>
	
	<c:forEach begin="${param.beginPage}" end="${param.endPage}" step="1" var="index">
	<!-- 현재 돌고있는 forEach == index -->
		
		<c:choose>
			<c:when test="${param.page == index }"><!-- 현재 페이지와 같은곳엔 링크 안걸어줌 -->
				${index}
			</c:when>
			<c:otherwise>
				<a href="${action }&page=${index }">${index }</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	
	<c:if test="${param.next }"><!-- next true인지 테스트 -->
		<a href="${action }&page=${param.endPage+1 }">next</a>
	</c:if>
	
</div>
</body>
</html>