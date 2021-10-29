<%@page import="dto.GalleryVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<%ArrayList<GalleryVO> list = (ArrayList)request.getAttribute("picList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#wrap{
		width: 960px;
		margin: 0 auto;
	}
	#upload{
		text-align: center;
	}
	#picBox{
		width: 958px;
		text-align: center;
		height: 798px;
		border: 2px double orange;
	}
	#pic{
		max-width: 960px;
		max-height: 800px;
	}
	
	#listBox{
		width: 948px;
		height: 320px;
		overflow: scroll;
		overflow-x: hidden;
		border: 2px double orange;
		margin: 0 auto;
		padding: 5px 0 0 10px;
	}
	
	#listBox::-webkit-scrollbar{
		width: 0 !important;
		display: none;
	}
	
	#listBox div{
		width: 116px;
		text-align: center;
		margin: 10px 7px 0px 5px;
		display: inline-block;
		height:39px;
		padding-top: 12px;
		padding-bottom: 10px;
		overflow: hidden;
		border: 1px dashed #FFCC33;
	}
	#listBox div:hover{
		background-color: #FFFF99;
		color: black;
		width: 110px;
		height: 33px;
		border: 4px solid #CC9900;
	}
	#listBox div a{
		font-size: 20px;
		color: inherit;
	}
	
	#uploadBox{
		width: 958px;
		height: 98px;
		border: 2px double orange;
		text-align: center;
	}
	#uploadBox div{
		margin-top: 10px;
		width: 470px;
		display: inline-block;
	}
	#uploadBox div input {
		width: 95%;
		background-image: url('../img/fileselec.png');
		background-repeat:no-repeat;
	}
	
	#upl{
		
		box-shadow: none;
		background-color: black;
		border: 1px dashed gray;
		color: white;
		font-size: 30px;
		padding-top : 20px;
		padding-bottom: 20px;
	}
	
</style>

</head>
<body>
<div id="wrap">
	<div id="picBox" onclick="nextPic()">
		<img alt="img" src="logo/galleryMain.gif" id="pic">
	</div>
	
	<div id="listBox">
		<script type="text/javascript">
			var pic = document.getElementById("pic");
			var picArr = [ <% for(int i=0; i<list.size(); i++){%>
			<%GalleryVO vo = list.get(i); %>
			"gallery/<%= vo.getPic()%>"
			<%if(i < list.size()-1){%>,<%}%>
			<%}%>];
			function choosePic(index) {
				pic.setAttribute("src",picArr[index]);
			}
		</script>
		
		<%for(GalleryVO vo : list){%>
			<div onclick="choosePic(<%=vo.getNum() %>)">
				<a onclick="choosePic(<%=vo.getNum() %>)"><%=vo.getPic() %> </a>
			</div>
		<%} %>
	</div>

	<form action="Main?command=upload" method="post" enctype="multipart/form-data" id="uploadBox" name="upload">
		<div id="a"><input type="file" name="pic"></div>
		<div id="b"><input type="submit" value="upload" onclick="check()" id="upl"></div>
	</form>
</div>	

<script type="text/javascript">
	var pic = document.getElementById("pic");
	var picArr = [ <% for(int i=0; i<list.size(); i++){%>
					<%GalleryVO vo = list.get(i); %>
					"gallery/<%= vo.getPic()%>"
					<%if(i < list.size()-1){%>
					,
					<%}%>
					<%}%>];
	var index = 0;
	function nextPic() {
		pic.setAttribute("src",picArr[index]);
		index++;
		if(index>=picArr.length){
			index=0;
		}
		return true;
	}
	function check() {
		var acc = ".jpg,.jpeg,.png,.gif,.jfif,.raw";
		var accArr = acc.split(",");
		var file = document.upload.pic.value;
		
		if(file.value != ""){
			file = file.substr(file.length-4).toLowerCase();
			for(i=0; i<accArr.length;i++){
				if(file == accArr[i]){
					alert("이미지가 등록되었습니다.");
					return true;
				}else{
					alert("이미지 파일을 등록해주세요.");
					break;
				}
			}
		}
	}
</script>
</body>
</html>