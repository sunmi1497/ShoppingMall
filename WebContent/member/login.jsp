<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
function loginCheck() {
	if (document.frm.id.value.length == 0) {
		alert("아이디를 써주세요.");
		frm.id.focus();
		return false;
	}
	if (document.frm.pwd.value == "") {
		alert("암호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	return true;
}
</script>

<style type="text/css">
#login_wrp { width:400px; height:262px; padding:20px; background:#f9f9f9; margin:30px auto; }
.btnArea { font-size: 14px; width:388px; height:37px; text-align:right; }
#login_btn { padding:9px 18px; cursor: pointer; border: solid 1px #b7b7b7;
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
	text-align: center; box-shadow: 0 1px 2px rgba(0,0,0,.2); border-radius:5px; }
.etcArea { padding-top:20px; font-size: 14px; width:388px; text-align:right; border-top:1px solid #e1e1e1; }
</style>

<div id="login_wrp">
	<h3 style="border-bottom: 1px solid #e1e1e1; padding-bottom:10px; margin:0;">로그인</h3>
	
	<form action="TalentServlet?command=login" method="post" name="frm">
		<p>
			<label style="width:100px; margin-bottom: 5px; float:left; font-weight:bold; font-size: 14px; line-height:30px;">아이디</label>
			<input type="text" name="id" value="${id}" style="display: inline-block; width:286px; height:30px; border: 1px solid #d1d1d1; font-weight: bold; font-size: 16px;">
		</p>
		<p>
			<label style="width:100px; margin-bottom: 5px; float:left; font-weight:bold; font-size: 14px;  line-height:30px;">비밀번호</label>
			<input type="password" name="pwd" style="display: inline-block; width:286px; height:30px; border: 1px solid #d1d1d1;  font-weight: bold; font-size: 16px;">
		</p>
		<p style="padding:5px; margin:0;"></p>
		<div class="btnArea">
			<input type="submit" value="LOGIN >>" onClick="return loginCheck()" id="login_btn">
		</div>
	</form>
	
		<p style="padding:5px; margin:0;"></p>
		<div class="etcArea">
			<p style="margin:0; margin-bottom:5px; padding:0;">
				<a href="TalentServlet?command=join_form" style="text-decoration:none; color:black;">회원가입 >></a>
			</p>
		</div>
		<div style="text-align:center; font-size:0.9em;">
			${message }
		</div>
</div>

</body>
</html>