<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
<title>** 회원 정보 추가 등록 **</title>
<style type="text/css" >
	table { width:100%;border:1px solid #444444;border-collapse:collapse; }
	th, td { border: 1px solid #444444; }
	tr > td:first-child { text-align:center; }
	div#wrap { display:none;border:1px solid #DDDDDD;width:500px;margin-top:5px;padding:5px; }
	div#wrap > div { margin-top:10px;margin-left::5px;margin-right:5px;margin-bottom::5px; }
	div#wrap a:link { color:#000000;text-decoration:none; }
	div#wrap a:hover { color:#0000FF;text-decoration:underline; }
	div#totoalOutcome { display:none; }
	#closeBtn { float:right;margin-top:-5px;margin-right:-5px; }
	#locale { width:380px; }
</style>
<script type="text/JavaScript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script language="javascript">
	/// @brief 주소검색창 - 키보드 Enter키 입력
	function enterSearch() {
		var evt_code = (window.netscape) ? event.which : event.keyCode;
		if (evt_code == 13) {
			event.keyCode = 0;
			getAddr();
		}
	}

	/// @brief 주소검색창 - 데이터 조회
	function getAddr() {
		// 적용예 (api 호출 전에 검색어 체크)
		let keyword = document.getElementById("searchAddr");
		if(!checkSearchedWord(keyword)) {
			return;
		}
		jQuery.ajax({
			  url : "http://www.juso.go.kr/addrlink/addrLinkApiJsonp.do"
			, type : "POST"
			, data : {
				  confmKey : "devU01TX0FVVEgyMDIwMDgwNTE0MjkzNDExMDAyNjg="
				, currentPage : document.getElementById("currentPage").value
				, countPerPage : "5"
				, keyword : keyword.value
				, resultType : "json"
			}
			, dataType : "jsonp"
			, crossDomain : true
			, success : function(jsonStr) {
				jQuery("#list").html("");
				let errCode = jsonStr.results.common.errorCode;
				let errDesc = jsonStr.results.common.errorMessage;

				if(errCode == "0") {
					if(jsonStr != null) {
						makeListJson(jsonStr);
					}
				} else {
					alert(errDesc);
				}
			}
			, error : function(xhr, status, error) {
				alert("에러발생");
			}
		});
	}

	/// @brief 주소검색창 - 주소지 선택
	function makeListJson(jsonStr) {
		let htmlStr = "<thead><tr><th>주소</th></tr></thead><tbody>";
		if(jsonStr.results.common.totalCount > 0) {
			jQuery("#totoalOutcome").css("display", "block");
			jQuery("#totalCnt").html(jsonStr.results.common.totalCount);
			jQuery(jsonStr.results.juso).each(function() {
				let jibunAddr = this.jibunAddr;       // 지번 주소
				htmlStr += "<tr>";
				htmlStr += "<td>";
				htmlStr += "<a href='javascript:;' onClick='inputTextAddress(\""+jibunAddr+"\");'>";
				htmlStr += "지번 : " + jibunAddr;
				htmlStr += "</a>";
				htmlStr += "</td>";
				htmlStr += "</tr>";

			});
			pageMake(jsonStr);
		} else {
			htmlStr += "<tr><td colspan='2'>조회된 데이터가 않습니다.<br/>다시 검색하여 주시기 바랍니다.</td></tr>";
		}
		htmlStr += "</tbody>";
		jQuery("#list").html(htmlStr);
	}

	/// @brief 주소검색창 - 주소지 삽입 , 닫기
	function inputTextAddress(address) {
		var addressArr = address.split(' ');
		document.getElementById("locale_top").value = addressArr[0];
		document.getElementById("locale_mdl").value = addressArr[1];
		document.getElementById("locale_leaf").value = addressArr[2];
		document.getElementById("locale").value = addressArr[0]+" "+addressArr[1]+" "+addressArr[2];
		jQuery("#wrap").slideUp();
		jQuery("#searchAddr").val("");
		jQuery("#totoalOutcome").css("display", "none");
		jQuery("#list").empty();
		jQuery("#pagingList").empty();
		jQuery("#currentPage").val("1");
	}
	
	/// @brief 주소검색창 - 열기
	function addressWindowOpen() {
		jQuery("#wrap").slideDown();
		jQuery("#searchAddr").focus();
	}

	/// @brief 주소검색창 - 특수문자 제거
	function checkSearchedWord(obj) {
		if(obj.value.length > 0) {
			// 특수문자 제거
			var expText = /[%=><]/;

			if(expText.test(obj.value) == true) {
				alert("특수문자를 입력 할수 없습니다.") ;
				obj.value = obj.value.split(expText).join("");
				return false;
			}
			// 특정문자열(sql예약어의 앞뒤공백포함) 제거
			var sqlArray = new Array(
				  "OR", "SELECT", "INSERT", "DELETE", "UPDATE", "CREATE"
				  , "DROP", "EXEC", "UNION",  "FETCH", "DECLARE", "TRUNCATE"
			);
			// sql 예약어

			var regex = "";
			for(var num = 0; num < sqlArray.length; num++) {
				regex = new RegExp(sqlArray[num], "gi") ;
				if(regex.test(obj.value)) {
					alert("\"" + sqlArray[num]+"\"와(과) 같은 특정문자로 검색할 수 없습니다.");
					obj.value = obj.value.replace(regex, "");
					return false;
				}
			}
		}
		return true ;
	}

	/// @brief 주소검색창 - 페이징 생성
	function pageMake(jsonStr) {
		var total = jsonStr.results.common.totalCount;				// 총건수
		var pageNum = document.getElementById("currentPage").value; // 현재페이지
		var pageBlock = 10; // 페이지당 출력 개수
		var paggingStr = "";

		// 검색 갯수가 페이지당 출력갯수보다 작으면 페이징을 나타내지 않는다.
		if (total > pageBlock) {
			var totalPages = Math.floor((total - 1) / pageNum) + 1;
			var firstPage = Math.floor((pageNum - 1) / pageBlock) * pageBlock
					+ 1;
			if (firstPage <= 0) {
				firstPage = 1;
			}
			;
			var lastPage = (firstPage - 1) + pageBlock;
			if (lastPage > totalPages) {
				lastPage = totalPages;
			}
			;
			var nextPage = lastPage + 1;
			var prePage = firstPage - pageBlock;
			if (firstPage > pageBlock) {
				paggingStr += "<a href='javascript:;' onClick='goPage("
						+ prePage + ");'>◀</a>";
				paggingStr += "&nbsp;";
			}
			for (let num = firstPage; lastPage >= num; num++) {
				if (pageNum == num) {
					paggingStr += "<a style='font-weight:bold;color:#0000FF;' href='javascript:;'>"
							+ num + "</a>";
					paggingStr += "&nbsp;";
				} else {
					paggingStr += "<a href='javascript:;' onClick='goPage("
							+ num + ");'>" + num + "</a>";
					paggingStr += "&nbsp;";
				}
			}
			if (lastPage < totalPages) {
				paggingStr += "<a href='javascript:;' onClick='goPage("
						+ nextPage + ");'>▶</a>";
			}
		}
		jQuery("#pagingList").html(paggingStr);
	}

	/// @brief 페이징 이동
	function goPage(pageNum) {
		document.getElementById("currentPage").value = pageNum;
		getAddr();
	}
</script>
</head>
<body>
	<h3>** 추가 회원 정보를 입력하세요 **</h3>
		<%String loginid =(String) session.getAttribute("id");%>
	<p>
		로그인 id :
		<%=loginid%></p>
	<form action="/ProtoType/member/regimore.do" method="post">
		아이디 : <input type="text" name="id" value="<%=loginid%>" readonly="readonly"/><br /> 
		닉네임 : <input type="text" name="nickname"/><br/>		
		성별 : <input type="radio" name="gender" value="남"/>남
		<input type="radio" name="gender" value="여"/>여<br/>		
		나이 : <input type="number" name="age"/><br/>		
		지역 : 
		<input type="text" name="locale" id="locale" readonly="readonly">
		<input type="text" name="locale_top" id="locale_top" hidden="true">
		<input type="text" name="locale_mdl" id="locale_mdl" hidden="true">
		<input type="text" name="locale_leaf" id="locale_leaf" hidden="true">
		<input type="number" id="currentPage" value="1" hidden="true" />
		<input type="button" onClick="addressWindowOpen();" value="주소 검색"/>
		<div id="wrap">
			<div>
				<input type="text" id="searchAddr" value="" onkeydown="enterSearch();" placeholder="도로명주소, 건물명 또는 지번 입력"/>
				<input type="button" onClick="getAddr();" value="검색"/>
			</div>
			<div>
				<div id="totoalOutcome">
					검색결과 : <span id="totalCnt">0</span>
				</div>
				<table id="list"></table>
			</div>
			<div id="pagingList" style='text-align:center;'></div>
		</div><br/>	
		직업 : <input type="text" name="job"/><br/>		
		<input type="submit" value="등록"> 
		<input type="reset" value="재작성">
	</form>
	<a href="/ProtoType/">돌아가기</a>
</body>
</html>