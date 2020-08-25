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
	<!-- 세션에 id 등록 -->
	<%session.setAttribute("id", request.getAttribute("myresult")); %>
	<c:redirect url="/view/home/home.jsp" />
</c:if>

<c:if test="${empty myresult }">
	<c:redirect url="/?error=1" />
</c:if>

</body>
</html>