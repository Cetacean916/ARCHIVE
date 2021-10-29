<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	article{
		border: 1px solid white;
		width: 960px;
		height: 788px;
		margin: 0 auto;
		overflow:scroll;
	}
	article::-webkit-scrollbar{
		display: none;
		width: 0 !important;
	}
	
	table{
		width: 960px;
		white-space: pre-wrap;
	}
	th, td{
		width: 120px;
		text-align: center;
		text-decoration: underline;
		border: inherit;
	}
	th{
		text-decoration: none;
	}
	table #tt:hover {
		background-color: gray;
	}
	#tt{
		height: 45px;
		background-color: #110110;
	}
	#qq{
		height: 60px;
		background-color: #333300;
	}
</style>
</head>
<body>
<div id="new">
<a href="Main?command=writeForm" ><h2>New Write</h2></a>
</div>
<article>
	<table>
		<tr id="qq">
			<th>번호</th>
			<th colspan="3" >제목</th>
			<th>작성자</th>
			<th colspan="2">작성일</th>
		</tr>
		<c:forEach var="list" items="${list}">
			<tr onclick="location.href='Main?command=detail&num=${list.num }'" id="tt">
				<td>${list.num }</td>
				<td colspan="3">${list.title }</td>
				<td>${list.writer }</td>
				<td colspan="2">${list.regdate }</td>
			</tr>
		</c:forEach>
	</table>
</article>
</body>
</html>
