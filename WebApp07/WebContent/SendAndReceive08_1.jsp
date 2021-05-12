<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%

	// 오늘 날짜
	Calendar cal = Calendar.getInstance();
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);

	// 클라이언트에 의해 넘어온 데이터 (a태그에서 받아옴)
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	// 표시할 달력의 년, 월
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear!=null)
		year=Integer.parseInt(strYear);
	if(strMonth!=null)
		month=Integer.parseInt(strMonth);
	
	// 이전 년, 월 
	int prevYear=year, prevMonth=month-1;
	
	// 월이 1보다 작아지면 이전 년도 12월로 이동 
	if(prevMonth<1)
	{
		prevYear=year-1;
		prevMonth=12;
	}
	
	// 다음 년, 월
	int nextYear=year, nextMonth=month+1;
	if(nextMonth>12)
	{
		nextYear=year+1;
		nextMonth=1;
	}
	
	// 달력
	cal.set(year, month-1, 1);
	
	int startDay=1;	// 1일
	int endDay=cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 마지막일
	int week = cal.get(Calendar.DAY_OF_WEEK);	// 요일
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08_1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	a {text-decoration: none; color: black;}
	table {width: 300px;}
	td {text-align: center; font-size: 10pt; height: 20px;}
</style>
</head>
<body>

<!-- 
	○ 데이터 송수신 실습 08
	  - 달력을 출력하는 JSP 페이지를 구성한다.
	  - 연도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	  - 단, submit 버튼 없이 이벤트 처리를 한다.
	  - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	  
	  ◀ 2021 년 5 월 ▶
      
      -------------------------
      -------------------------
      
      - 『 ◀ 』이나 『 ▶ 』 클릭 시
        해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
      
      - 사용자 최초 요청 주소는
        http://localhost:8090/WebApp07/SendAndReceive08.jsp
        
	  ○ SendAndReceive08.jsp

-->

<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>

<div>

	<table>
		<tr>
			<td style="font-size: 15pt;" align="center">
				<a href="SendAndReceive08_1.jsp?year=<%=prevYear %>&month=<%=prevMonth%>">◀</a>
				<%=year %> 년 <%=month %> 월
				<a href="SendAndReceive08_1.jsp?year=<%=nextYear %>&month=<%=nextMonth%>">▶</a>
			</td>
		</tr>
	</table>
		

</div>


<table>
	<tr>
		<td align="center"><font color="red">일</font></td>
		<td>월</td>
		<td>화</td>
		<td>수</td>
		<td>목</td>
		<td>금</td>
		<td align="center"><font color="blue">토</font></td>		
	</tr>

	<%
		int newLine = 0;
		
		out.print("<tr>");
		for (int i=1; i<week; i++)
		{
			out.print("<td style='background-color: #cccccc'>&nbsp;</td>");
			newLine++;
		}
		
		for (int i=startDay; i<=endDay; i++)
		{
			String fontColor = (newLine==0) ? "red" : (newLine==6) ? "blue" : "white";
			String bgColor = (nowYear==year) && (nowMonth==month) && (nowDay==i) ? "#555555" : "#cccccc";
			
			out.print("<td style='background-color: " + bgColor + "'>");
			out.print("<span style='color: " + fontColor + "'>" + i + "</span>");
			out.print("</td>");
			
			newLine++;
			
			if(newLine==7 && i!=endDay)
			{
				out.print("</tr><tr>");
				newLine = 0;
			}
		}
		
		while(newLine<7)
		{
			out.print("<td style='background-color: #cccccc'>&nbsp;</td>");
			newLine++;
		}
		
		
		out.print("</tr>");
		
	%>

</table>
</body>
</html>
