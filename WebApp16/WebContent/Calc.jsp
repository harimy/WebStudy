<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
	.txtNum { width: 100px; text-align: right; }
	.txtNum:focus { background-color: #e8e4e6; }
</style>
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<!-- <form action="Calc_ok1.jsp" method="post" name="myForm"> -->
	<!-- <form action="Calc_ok2.jsp" method="post" name="myForm"> -->
	<form action="Calc_ok3.jsp" method="post" name="myForm">
		<table class="table">
			<tr> 
				<th>첫 번째 정수</th>
				<td>
					<input type="text" name="su1" class="txtNum">
				</td>
			</tr>
			<tr>
				<th>연산자</th>
				<td>
					<select name="op">
						<option value="+">더하기</option>
						<option value="-">빼기</option>
						<option value="*">곱하기</option>
						<option value="/">나누기</option>
					</select>
				</td>
			</tr>
			<tr> 
				<th>두 번째 정수</th>
				<td>
					<input type="text" name="su2" class="txtNum">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" style="width: 100%"> = </button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>