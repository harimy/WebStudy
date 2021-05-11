<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String yearStr = request.getParameter("year");
	String monthStr = request.getParameter("month");
	
	int year=0, month=1;
	try
	{
		year = Integer.parseInt(yearStr);
		month = Integer.parseInt(monthStr);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
	
	int[] last = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	// 윤년 처리
	if(year%4==0 && year%100!=0 || year%400==0)
		last[1] = 29;
	
	// 입력한 년도 전년도 12월 31일 까지의 날 수 계산
	int nalsu = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	
	// 입력한 월 전 월 말일 까지의 날 수 계산
	for(int i=0; i<month-1; i++)
	{
		nalsu += last[i];
	}
	
	// 입력받은 월의 1일
	nalsu += 1;
	
	// 시작 요일
	int w = nalsu%7;
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function submit(obj)
	{
		obj.submit();
	}
</script>

</head>
<body>

<!-- 
	○ 데이터 송수신 실습 07
	  - 달력을 출력하는 JSP 페이지를 구성한다.
	  - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	  - 단, submit 버튼 없이 이벤트 처리를 한다.
	  - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다. (단독 페이지)
	  - 연도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
	  - 월을 1월부터 12월 까지로 구성한다. 
	  
	    [ 2021 ▼ ] 년 [ 5 ▼ ] 월
		---------------------------
		---------------------------
	  
	  - 연도 select box 나 월 select box 내용 변화 시
	    해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	    
	  - 사용자 최초 요청 주소는
	  	http://localhost:8090/WebApp07/SendAndReceive07.jsp
	  	로 한다.
	  	
	○ SendAndReceive07.jsp
-->

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
	<form method="get">
		<select id="year" name="year" onchange="submit(this.form)">
			<!-- <option>==년도==</option> -->
			<option value="2011">2011</option>
			<option value="2012">2012</option>
			<option value="2013">2013</option>
			<option value="2014">2014</option>
			<option value="2015">2015</option>
			<option value="2016">2016</option>
			<option value="2017">2017</option>
			<option value="2018">2018</option>
			<option value="2019">2019</option>
			<option value="2020">2020</option>
			<option value="2021">2021</option>
		</select>
		년
		<select id="month" name="month" onchange="submit(this.form)">
			<!-- <option>==월==</option> -->
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>		
		</select>
		월
		<br>
		------------------------<br>
		<table border="1">
		<tr>
			<th>일</th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>		
		</tr>
		<%
			out.print("<tr>");
			for(int i=1; i<=w ; i++)
			{
				out.print("<td></td>");
			}
				
		
			for(int i=1; i<=last[month-1]; i++)
			{
				out.print("<td text-align='center'>");
				out.print(i);
				out.print("</td>");
				w++;
				if(w%7==0)
					out.print("</tr><tr>");
			}
		%>
		</table>
		------------------------<br>
	</form>
</div>

<div>
	<h2>년도 : <%=year %></h2>
	<h2>월 : <%=month %></h2>
	<h2>날수 : <%=nalsu %></h2>
</div>

</body>
</html>