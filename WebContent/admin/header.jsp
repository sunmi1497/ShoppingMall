<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty loginUser}">
	<jsp:forward page='TalentServlet?command=admin_login_form' />
</c:if>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nonage Admin</title>
<link rel="stylesheet" href="admin/css/admin.css">
<script type="text/javascript" src="admin/product/product.js"></script>

</head>
<body>
	<div id="wrap">
		<header>
			<div id="logo">
				<a href="TalentServlet?command=admin_login_form">
					<img style="width: 800px" src="admin/images/bar_01.gif">
					<img src="admin/images/text.gif">
				</a>
			</div>
			<input class="btn" type="button" value="logout" style="float: right;"
				onClick="location.href='TalentServlet?command=admin_logout'">
		</header>
		<div class="clear"></div>
		