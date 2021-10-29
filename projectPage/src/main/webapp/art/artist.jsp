<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<style type="text/css">
	#wrap{
		width: 960px;
		margin: 0 auto;
	}
	#img{
		width: 960px;
		height: 600px;
		text-align: center;
	}
	#art{
		max-width: 960px;
		max-height: 600px;
	}
	
	#short{
		width: 520px;
		margin-right: 5px;
		display: inline-block;
		position: absolute;
		left: 5px;
	}
	
	#award{
		width: 400px;
		margin-left: 5px;
		display: inline-block;
		position: absolute;
		right: 50px;
		overflow: auto;
		padding: 0 10px 0 10px;
		text-align: center;
		height: 600px;
	}
	
	#award::-webkit-scrollbar{
		display: none;
		width: 0 !important;
	}
	
	#record{
		position: relative;
	}
	#short{
		width: 400px;
		height: 600px;
		margin-left: 5px;
		display: inline-block;
		position: absolute;
		left: 50px;
		overflow: auto;
		padding: 0 10px 0 10px;
		text-align: center;
	}
	#short::-webkit-scrollbar{
		display: none;
		width: 0 !important;
	}
	
</style>
</head>
<body>
	<div id="wrap">
	<div style="text-align: center; margin: 0 0 16px;">
	<b>사진을 클릭하여 더 많은 사진들을 보실 수 있습니다.</b>
	</div>
		<div id="img" onclick="nextPic(true)">
		<img id="art" alt="iu" src="iu/1.jpg">
		</div><br>
		<div id="record">
			<div id="short">
				<h2>약력</h2>
				<ul>
				<c:forEach var="list" items="${history }">
					<li>${list.history }</li>
					<br><br>
				</c:forEach>
				</ul>
			</div>
			<div id="award">
				<h2>수상</h2>
				<ul>
				<c:forEach var="list" items="${award }">
					<li>${list.award }</li>
					<br><br>
				</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
