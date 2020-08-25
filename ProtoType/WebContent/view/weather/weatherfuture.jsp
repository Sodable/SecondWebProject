<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>**날씨 예보**</title>
<% List<String[]> weather = (List<String[]>) request.getAttribute("weather"); %>
</head>
<body>
<h1>**날씨 예보**</h1>
		<%String loginid =(String) session.getAttribute("id");%>
	<p>
		로그인 id :
		<%=loginid%></p>
<hr>
<%
int cnt = 0;
for (int i = 0; i < weather.size(); i++) {
	if (i == 0) {
		out.println("현재 시간  : " + weather.get(i)[0] + "<br>");
		out.println("발표 시간  : " + 
				weather.get(i)[1].substring(0,4) + "-"+
				weather.get(i)[1].substring(4,6) + "-"+
				weather.get(i)[1].substring(6) + " "+
				weather.get(i)[2].substring(0, 2) + ":00<br><br>");
		//out.println("nx : " + weather.get(i)[1]);
		//out.println("ny  : " + weather.get(i)[2]+"<br>");
	} else {
		if(!weather.get(i)[0].equals(weather.get(i-1)[0])){
			out.println("<br>예보 날짜  : " + weather.get(i)[0]+"<br>");
		}
		if(!weather.get(i)[1].equals(weather.get(i-1)[1])){
		out.println("<br>예보 시간  : " +weather.get(i)[1].substring(0, 2)+"시<br><br>");
		}
		switch(weather.get(i)[2]){
		case "T3H" : out.println("3시간 기온  : " + weather.get(i)[3]+"도<br>"); break;
		//case "TMN" : out.println("아침 최저기온  : " + weather.get(i)[3]+"도<br>"); break;
		//case "TMX" : out.println("낮 최고기온  : " + weather.get(i)[3]+"도<br>"); break;
		case "POP" : out.println("강수확률  : " + weather.get(i)[3]+"%<br>"); break;
		//case "R06" : out.println("6시간 강수량  : " + weather.get(i)[3]+"mm<br>"); break;
		//case "S06" : out.println("6시간 신적설  : " + weather.get(i)[3]+"cm<br>"); break;
		//case "UUU" : out.println("동서바람성분 : " + weather.get(i)[3]+"m/s<br>"); break;
		//case "VVV" : out.println("남북바람성분 : " + weather.get(i)[3]+"m/s<br>"); break;
		case "REH" : out.println("습도 : " + weather.get(i)[3]+"%<br>"); break;
		//case "WSD" : out.println("풍속 : " + weather.get(i)[3]+"<br>"); break;
		case "PTY" : 
			String raintype = null;
			switch(weather.get(i)[3]){
			case "0" : raintype = "없음";break;
			case "1" : raintype = "비";break;
			case "2" : raintype = "비/눈";break;
			case "3" : raintype = "눈";break;
			case "4" : raintype = "소나기";break;
			case "5" : raintype = "빗방울";break;
			case "6" : raintype = "빗방울/눈날림";break;
			case "7" : raintype = "눈날림";break;
			default : raintype = "오류";
		}
			out.println("강수형태 : " + raintype +"<br>");
			break;
		case "SKY" : 
			String skytype = null;
			switch(weather.get(i)[3]){
			case "1" : skytype = "맑음";break;
			case "3" : skytype = "구름많음";break;
			case "4" : skytype = "흐림";break;
			default : skytype = "오류";
		}
			out.println("하늘상태 : " + skytype +"<br>");
			cnt++;
			break;
		}
	}
}
%>
</body>
</html>