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
		padding: 20px 0 20px 0;
		vertical-align: bottom;
		cursor: pointer;
	}
	#upl:hover{
		box-shadow: none;
		background-color: silver;
		border: 1px dashed white;
		color: black;
		font-size: 30px;
		padding: 20px 0 20px 0;
		vertical-align: bottom;
		cursor: pointer;
	}
	#upl:active{
		box-shadow: none;
		background-color: gray;
		border: 1px dashed silver;
		color: black;
		font-size: 30px;
		padding: 20px 0 20px 0;
		vertical-align: bottom;
		cursor: pointer;
	}
	
	#a{
		background-color: black;
		color: white;
		font-size: 30px;
		box-shadow: none;
	}
	
	#a label {
	  display: inline-block;
	  padding: 16px 0 21px 0;
	  width: 100%;
	  height: 100%;
	  color: white;
	  font-size: inherit;
	  line-height: normal;
	  background-color: black;
	  cursor: pointer;
	  border-radius: .25em;
	  -webkit-transition: background-color 0.2s;
	  transition: background-color 0.2s;
	  vertical-align: text-bottom;
	}
	
	#a label:hover {
	  background-color: silver;
	  color: black;
	}
	
	#a label:active {
	  background-color: gray;
	  color: black;
	}
	
	#a input[type="file"] {
	  position: absolute;
	  overflow: hidden;
	  clip: rect(0, 0, 0, 0);
	  width: 0px;
	  height: 0px;
	  padding: 0;
	  margin: -1px;
	  border: 0;
	}
	
	#file_val{
		background-color: black;
		color: white;
		border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
		width: 950px;
	}
	#file_name_box{
		border: 2px double orange;
		width: 958px;
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
		<div id="a">
			<label for="fil">사진 등록</label>
			<input type="file" name="pic" id="fil" onchange="javascript:document.getElementById('file_val').value=this.value">
		</div>
		<div id="b"><input type="submit" value="upload" onclick="check()" id="upl"></div>
	</form>
	<div id="file_name_box"><input type="text" readonly="readonly" id="file_val"></div>
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
