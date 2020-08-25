<%@page import="DWM.vo.PhotoBoardVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**포토게시판**</title>
<% 
// 로그인 아이디 받아오기
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
//================================================================

// 당일 탑3 게시물들 받아오기
List<PhotoBoardVO> top3list = (List<PhotoBoardVO>) request.getAttribute("top3list");
//================================================================

//닉네임 받아올 객체
Map<String,String> nickname = (Map<String,String>) request.getAttribute("nickname");
//================================================================

// 페이지 부분 이부분을 컨트롤러에서 get으로 보내주면 검색하기 편할듯 
String date = (String) request.getAttribute("date");
//================================================================



%>
</head>
<body>
		<!-- 데일리 탑3 부분 -->
<%=date%>&nbsp;TOP&nbsp;3<br>
<table border="0">
<tr>
<%for(int i = 0 ; i < top3list.size() ; i++) {%>
<td><img src="/ProtoType/upload/photoboard/<%=top3list.get(i).getPb_file().trim()%>" 
	title="<%=top3list.get(i).getPb_file().trim()%>" alt="" width="100px" height="100px" 
	onclick="window.open('/ProtoType/photoboard/viewbody?count=<%=top3list.get(i).getCount() %>',
	'<%=top3list.get(i).getPb_file().trim()%>',
	'height=650,location=no,status=no,scrollbars=yes');"><br>
	<%=nickname.get(top3list.get(i).getId()) %>
	(<%=top3list.get(i).getId() %>)<br>
	날씨 : <%=top3list.get(i).getPb_weather() %><br>
	추천수 : <%=top3list.get(i).getPb_count() %></td>
<%} %>
</tr>
</table>

</body>
</html>