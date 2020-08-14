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
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
List<String[]> weather = (List<String[]>) request.getAttribute("weather"); 

String raintype = null;
for (int i = 0; i < weather.size(); i++) {
		if(weather.get(i)[0].equals("PTY")){
			switch(weather.get(i)[1]){
			case "0" : raintype = "맑음";break;
			case "1" : raintype = "비";break;
			case "2" : raintype = "진눈깨비";break;
			case "3" : raintype = "눈";break;
			case "4" : raintype = "소나기";break;
			case "5" : raintype = "빗방울";break;
			case "6" : raintype = "빗방울/눈날림";break;
			case "7" : raintype = "눈날림";break;
			default : raintype = "오류";
		}
		}
}
%>
</head>
<body>
<h1> ** 포토 게시판 글 작성**</h1>
<hr>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>

<form:form action="/ProtoType/photoboard/write.do" method="post" 
enctype="multipart/form-data" modelAttribute="photoBoardVO" >

<label>제목</label>
<form:input type="text" name="title" path="title" min="1" style="width: 500px "/><br>
	<p style="color:red; font-weight:bold">
		<form:errors path="title"/>
	</p>
<label>이미지 첨부</label>
<form:input type="file" name="imagefile" path="imagefile"/><br>
	<p style="color:red; font-weight:bold">
		<form:errors path="imagefile"/>
	</p>
<form:input type="text" value="<%=raintype %>" name="pb_weather" path="pb_weather" hidden="true"/><br>
<form:input type="text" value="<%=loginid%>" name="id" path="id" hidden="true"/>
<input type="submit" value="글 쓰기">

</form:form>
<a href="/ProtoType/photoboard/view">포토게시판으로 돌아가기</a>
</body>
</html>