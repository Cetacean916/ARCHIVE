<%@page import="dto.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#wrap{
		width: 960px;
		margin: 0 auto;
	}
	table{
		width: 960px;
		margin-top: 20px;
	}
	table tr td {
		font-size: 25px;
	}
	
	#ti{
		border : 1px solid #333333;
		padding-left: 8px;
		padding-bottom: 8px;
		width: 300px;
		text-align: center;
	}
	#re{
		text-align: center;
	}
	
	#link{
		text-align: center;
		font-family: Times New Roman;
		font-size: 30px;
	}
	
	#link a {
	 color: #FFCC66; 
	}
	
	#cont p{
		width: 960px;
		height: 700px;
		background: #333333;
		font-size: 25px;
		padding: 1px 1px 8px 8px;
		
	}
	
</style>
</head>
<body>
<div id="wrap">
	<table>
		<tr>
			<td id="ti" colspan="3">${detail.title }</td>
			<td id="re">${detail.regdate }</td>
			<td id="wr">${detail.writer }</td>
			<td id="link"><a href="Main?command=board">Back to List</a></td>
		</tr>
	</table>
	<div id="cont">
		<p>
			${detail.content}
		</p>
	</div>
</div>
</body>
</html>