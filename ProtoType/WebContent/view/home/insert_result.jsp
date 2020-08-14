<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 등록 결과 **</title>
</head>
<body>
<%
String loginid =(String) (session.getAttribute("id")==null ? "null" : session.getAttribute("id"));
String loginnickname =(String) (session.getAttribute("nickname")==null ? "null" : session.getAttribute("nickname"));
%>
<p>	로그인 id : <%=loginid%><br>
	로그인 nickname : <%=loginnickname%></p>
<c:if test="${!empty myresult }">
	${myresult }님의 고객 정보 등록이 완료 되었습니다.<br>
	<a href="/ProtoType/index.jsp">홈 화면으로 이동</a>
</c:if>

<c:if test="${empty myresult }">
	이미 존재하거나 잘못 입력하셨습니다.<br>
	다시 입력해 주세요<br>
	<a href="/ProtoType/member/regi">다시 입력</a>
</c:if>

</body>
</html>