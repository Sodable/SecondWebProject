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
<c:if test="${!empty myresult }">
	${myresult }님 환영합니다<br>
	<a href="/ProtoType/">홈 화면으로 이동</a>
</c:if>

<c:if test="${empty myresult }">
	잘못 입력하셨습니다.<br>
	다시 입력해 주세요<br>
	<a href="/ProtoType/view/home/login.jsp"">다시 입력</a>
</c:if>

</body>
</html>