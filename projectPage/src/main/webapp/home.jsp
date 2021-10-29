<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	var num = 1;
	function nextPic(idx) {
		if(idx){
			if(num < 80){
				num++;
			}else {
				num = 1;
			}
		}
		var img = document.getElementById("art");
		img.setAttribute("src","iu/"+num+".jpg");
	}
</script>
<%
	Cookie[] ck = request.getCookies();
	
	String popup = "";
	String strUrl, str;
	
	String pop = (String)request.getAttribute("pop");
	
	strUrl = "popup.jsp";
	str = "window.open('" + strUrl + "', 'Think', ";
	str += "'top=300px, ";
	str += "left=550px, ";
	str += "width=330px, ";
	str += "height= 180px', ";
	str += "'toolbar=no', ";
	str += "'menubar=no', ";
	str += "'status=no', ";
	str += "'scrollbars=no', ";
	str += "'resizable=no')";
	
	popup = str;
	if(ck != null){
		for(Cookie c : ck){
			if(c.getName().equals("popup") && c.getValue().equals("no")){
				popup = "";
				break;
			}
		}
	}
%>
<meta charset="UTF-8">
<style type="text/css">
	div#mainMenu{
		margin-top: 50px;
	}
	#wrap{
		width: 960px;
		margin: 0 auto;
		position: relative;
	}
	
	#imgBox{
		width: 625px;
		height: 450px;
		margin: 0px;
		position: absolute;
		right: 0px;
		top: 105px;
		text-align: center;
	}
	#art{
		max-width: 625px;
		max-height: 450px;
	}
	#albumBox{
		width: 325px;
		height: 450px;
		overflow: auto;
		position: absolute;
		left: 0px;
		top: 105px;
	}
	#albumBox::-webkit-scrollbar{
		display: none;
		width: 0 !important;
	}
	
	#albumDetail{
		width: 335px;
		height: 50px;
		margin: 5px 0px;
		background-color: gray;
		position: relative;
	}
	#albumDetail b{
		font-size: 13px;
		position: absolute;
		top:10px;
		margin-left: 5px;
	}
	#albumImg{
		margin: 0px;
	}
	#boardBox{
		width: 959px;
		margin: 0 auto;
		border: 1px solid gray;
		position: absolute;
		top: 565px;
		overflow: scroll;
		height: 600px;
	}
	
	#boardBox::-webkit-scrollbar{
		display: none;
		width: 0 !important;
	}
	
	#boardBox table{
		width: 960px;
	}
	#boardBox table tr td,th{
		width: 105px;
		height:50px;
		text-align: center;
	}
	#boardBox table #tt:hover {
		background-color: gray;
	}
	
	#boardBox table #hh{
		background-color: gray;
	}
</style>
</head>
<c:choose>
<c:when test="${!empty pop}">
<body onload="<%=popup%>">
</c:when>
<c:otherwise>
<body>
</c:otherwise>
</c:choose>
	<div id="wrap">
		<div id="box">
			<div id="albumBox">		
			<c:forEach var="list" items="${album }">
				<div id="albumDetail" onclick="location.href='${list.link}'">
					<img alt="albumImg" src="album/${list.image }.jpg" width="100px" height="50px">
					<b>${list.song } [${list.release }]</b>
				</div>	
			</c:forEach>
			</div>
			
			<div id="imgBox" onclick="nextPic(true)">
				<img id="art" alt="iu" src="iu/1.jpg">
			</div>
		</div>
		<div id="boardBox">
		<table>
			<tr id="hh">
				<th>번호</th>
				<th colspan="3" >제목</th>
				<th>작성자</th>
				<th colspan="2">작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="list" items="${board }">
				<tr onclick="location.href='Main?command=detail&num=${list.num }'" id="tt">
					<td>${list.num }</td>
					<td colspan="3">${list.title }</td>
					<td>${list.writer }</td>
					<td colspan="2">${list.regdate }</td>
					<td>${list.cnt }</td>
				</tr>
			</c:forEach>
		</table>	
		</div>
	</div>
</body>
</html>