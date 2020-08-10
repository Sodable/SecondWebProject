<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**포토게시판**</title>
<% List<String[]> weather = (List<String[]>) request.getAttribute("weather"); %>
<%
for (int i = 0; i < weather.size(); i++) {
	if (i == 0) {
		out.println("현재 시간  : " + weather.get(i)[0]+"<br><br>");
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
		case "WSD" : out.println("풍속 : " + weather.get(i)[1]+"<br>"); break;
		}
	}
}
%>
</head>
<body>
<h1> ** 포토 게시판 글 작성**</h1>
<hr>

<form:form action="/ProtoType/photoboard/write.do" method="post" 
enctype="multipart/form-data" modelAttribute="photoBoardVO" >

<label>제목</label>
<form:input type="text" name="title" path="title" min="1" style="width: 500px "/><br>
<label>이미지 첨부</label>
<form:input type="file" name="imagefile" path="imagefile"/><br>
<form:input type="text" value="맑음" name="pb_weather" path="pb_weather" hidden="true"/><br>
<form:input type="text" value="test" name="id" path="id" hidden="true"/>
<input type="submit" value="글 쓰기">

</form:form>
<a href="/ProtoType/photoboard/view">포토게시판으로 돌아가기</a>
</body>
</html>