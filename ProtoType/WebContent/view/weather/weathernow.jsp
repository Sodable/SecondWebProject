<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>**현재 날씨**</title>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
List<String[]> weather = (List<String[]>) request.getAttribute("weather"); %>
</head>
<body>
<%
for (int i = 0; i < weather.size(); i++) {
	if (i == 0) {
		out.println("현재 시간  : " + weather.get(i)[0]+"<br><br>");
		out.println("발표 시간  : " + 
				weather.get(i)[1].substring(0,4) + "-"+
				weather.get(i)[1].substring(4,6) + "-"+
				weather.get(i)[1].substring(6) + " "+
				weather.get(i)[2].substring(0, 2) + ":00<br><br>");
		//out.println("nx : " + weather.get(i)[1]);
		//out.println("ny  : " + weather.get(i)[2]+"<br>");
	} else {
		switch(weather.get(i)[0]){
		case "T1H" : out.println("기온  : " + weather.get(i)[1]+"도<br>"); break;
		//case "RN1" : out.println("1시간 강수량  : " + weather.get(i)[1]+"mm<br>"); break;
		//case "UUU" : out.println("동서바람성분 : " + weather.get(i)[1]+"m/s<br>"); break;
		//case "VVV" : out.println("남북바람성분 : " + weather.get(i)[1]+"m/s<br>"); break;
		case "REH" : out.println("습도 : " + weather.get(i)[1]+"%<br>"); break;
		case "PTY" : 
			String raintype = null;
			switch(weather.get(i)[1]){
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
		case "WSD" : out.println("풍속 : " + weather.get(i)[1]+"m/s	<br>"); break;
		}
	}
}
%>
</body>
</html>