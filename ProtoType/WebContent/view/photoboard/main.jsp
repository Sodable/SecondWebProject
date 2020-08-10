<%@page import="DWM.vo.PhotoBoardVO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>**포토게시판**</title>
		<%String loginid =(String) session.getAttribute("id");%>
	<p>
		로그인 id :
		<%=loginid%></p>
<% // 이부분을 컨트롤러에서 get으로 보내주면 검색하기 편할듯 
List<PhotoBoardVO> photolist = (List<PhotoBoardVO>) request.getAttribute("photolist");
String date = (String) request.getAttribute("date");
int pagenum = (int) request.getAttribute("pagenum"); // 입력된 페이지 , 컨트롤러에서 디폴트로 1
int itemnum = (int) request.getAttribute("itemnum"); // 게시물 총 갯수 받아오기
//System.out.println("pagenum : "+pagenum);
//System.out.println("itemnum : "+itemnum);
int totalpage = (int) itemnum/12 + 1;
int pageflag = (int) (pagenum-1)/5+1;
if(!photolist.isEmpty()){
	int fromIndex = (pagenum-1)*12;
	int toIndex = ((pagenum*12 >itemnum) ? itemnum : pagenum*12 );
	photolist = photolist.subList(fromIndex, toIndex);
}
%>
</head>
<body>
<h1> ** 포토 게시판 **</h1>

<hr>
		<!-- 데일리 탑3 부분 -->
<%=date%>&nbsp;TOP&nbsp;3<br>
<table border="0">
<tr>
<%for(int i = 0 ; i < 3 ; i++) {%>
<td><%=i+1 %></td>
<%} %>
</tr>
</table>

<hr>
<!-- 데일리 4X3 포맷으로 12개 마다 페이지 넘기기 -->
<table border="0">
<%for(int i = 0 ; i < photolist.size() ; i++){ 
if(i%4==0){%>
<tr>
<%} %>
	<!-- 각 게시물 정보 -->
	<td><img src="/ProtoType/upload/photoboard/<%=photolist.get(i).getPb_file().trim()%>" 
	title="<%=photolist.get(i).getPb_file().trim()%>" 
	alt="" width="100px" height="100px" onclick=""><br>
	닉네임(<%=photolist.get(i).getId() %>)<br>
	<a href="/ProtoType/photoboard/recommand?date=<%=date %>&pagenum=<%=pagenum %>&count=<%=photolist.get(i).getCount() %>">추천 하기</a><br>
	추천수 : <%=photolist.get(i).getPb_count() %>
	</td>
<%if(i%4==3){ %>
</tr>
<%}} %>
</table>

<!-- 페이지 넘기는 코드 -->
<%if(pageflag>1){%>
<a href="/ProtoType/photoboard/view?date=today&pagenum=<%=pagenum-(pagenum-1)%5-1%>">이전</a>
<%} %>
<%for (int i = 0 ; i < ((totalpage-(pageflag-1)*5)>5 ? 5 : (totalpage-(pageflag-1)*5)) ; i++) {%>
<a href="/ProtoType/photoboard/view?date=today&pagenum=<%=(pagenum-1)/5*5+i+1 %>"><%=(pagenum-1)/5*5+i+1 %></a>
<%} %>
<%if(pageflag<(int)(totalpage-1)/5+1) {%>
<a href="/ProtoType/photoboard/view?date=today&pagenum=<%=(pagenum-1)/5*5+6%>">다음</a>
<%} %>
<hr>
<form action="/ProtoType/photoboard/write" method="post">
	<input type="text" name="id" value="<%=loginid %>" hidden="true"/>
<input type="submit" value="글 작성"/>
</form>

</body>
</html>