<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
	
	function sendIt()
	{
		var f = document.myForm;
		
		if(!f.userName.value)
		{
			alert("이름을 입력하세요.");
			f.userName.focus();
			return;
		}
		
		if(!f.userAge.value)
		{
			alert("나이를 입력하세요.");
			f.userAge.focus();
			return;
		}
		
		if(!f.userGender.value)
		{
			alert("성별을 선택하세요.");
			return;
		}
		
		
		f.submit();
	}
	
</script>
</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" name="userName">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" name="userAge">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" value="남자" name="userGender">남자
					</label>
					<label>
						<input type="radio" value="여자" name="userGender">여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" value="강동원" name="userIdeal">강동원
					</label>
					<label>
						<input type="checkbox" value="송강" name="userIdeal">송강
					</label>
					<label>
						<input type="checkbox" value="이도현" name="userIdeal">이도현
					</label>
					<label>
						<input type="checkbox" value="이제훈" name="userIdeal">이제훈
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn"
               		style="width: 100%;">등록</button>
            	</td>
         	</tr>
		</table>
	</form>
</div>

</body>
</html>