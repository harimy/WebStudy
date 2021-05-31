<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	.errMsg { font-size: small; color: red; display:none; }
</style>
<script>
	function formCheck()
	{
		var f = document.getElementById("myForm");
		
		var idErr = document.getElementById("idErr");
		var pwErr = document.getElementById("pwErr");
		var nameErr = document.getElementById("nameErr");
		var telErr = document.getElementById("telErr");
		var emailErr = document.getElementById("emailErr");
		
		idErr.style.display = "none";
		pwErr.style.display = "none";
		nameErr.style.display = "none";
		telErr.style.display = "none";
		emailErr.style.display = "none";
		
		if(!f.userId.value)
		{
			idErr.style.display = "inline";
			f.userId.focus();
			return false;
		}
		if(!f.userPw.value)
		{
			pwErr.style.display = "inline";
			f.userPw.focus();
			return false;
		}
		if(!f.userName.value)
		{
			nameErr.style.display = "inline";
			f.userName.focus();
			return false;
		}
		if(!f.userTel.value)
		{
			telErr.style.display = "inline";
			f.userTel.focus();
			return false;
		}
		if(!f.userEmail.value)
		{
			emailErr.style.display = "inline";
			f.userEmail.focus();
			return false;
		}
		
		return true;
		
	}
</script>
</head>
<body>

<div>
	<h1>MemberInsertForm 페이지</h1>
	<hr>
</div>

<div>
	<form action="memberinsert" method="post" id="myForm" onsubmit="return formCheck()">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId">
					<span class="errMsg" id="idErr">아이디를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="userPw">
					<span class="errMsg" id="pwErr">비밀번호를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="userName">
					<span class="errMsg" id="nameErr">이름을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="userTel">
					<span class="errMsg" id="telErr">전화번호를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="userEmail">
					<span class="errMsg" id="emailErr">이메일을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnInsert" class="btn">입력하기</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>