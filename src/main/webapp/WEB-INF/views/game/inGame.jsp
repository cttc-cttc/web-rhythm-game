<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Game Mode</title>
	<style type="text/css">
		header{
			width: 98%;
			text-align: center;
			margin-top: 50px;
			margin-bottom: 50px;
			font-size: 30px;
		}
		#outline{
			width: 99%;
			height: 620px;
			margin: auto;
		}
		#bodyline{
			width: 97%;
			height: 500px;
			margin: auto;
			border: solid thin;
			background: pink;
		}
		.gameInfo{
			display: inline-table;
		}
		#musicList{
			width: 350px;
			height: 270px;
		}
		#musicTitleImage{
			width: 400px;
			height: 300px;
			margin-left: 100px;
			border: solid thin;
		}
		#keyInfo{
			width: 400px;
			height: 250px;
			border: solid thin;
			margin-left: 100px;
			margin-top: 50px;
		}
		
		
		
		#speed{
			width: 70px;
			height: 27px;
			font-size: 23px;
			background: silver;
			border-radius: 4px;
			cursor: pointer;
			text-align: center;
		}
		#option{
			width: 120px;
			height: 27px;
			font-size: 23px;
			background: silver;
			border-radius: 4px;
			cursor: pointer;
			text-align: center;
		}
		#keyConf{
			width: 80px;
			height: 35px;
			font-size: 18px;
			background: silver;
			border-radius: 4px;
			cursor: pointer;
		}
		#start{
			width: 100px;
			height: 45px;
			font-size: 25px;
			background: skyblue;
			border-radius: 4px;
			cursor: pointer;
		}
		#community{
			width: 120px;
			height: 35px;
			font-size: 18px;
			background: silver;
			border-radius: 4px;
			cursor: pointer;
		}
		#buttonControl{
			width: 100px;
			height: 28px;
			margin: auto;
		}
		#areaOut{
			width: 300px;
			margin: auto;
		}
		
		
		
 		#area1{ 
 			width: 200px; 
 			height: 50px; 
 			cursor: pointer; 
 			text-align: center; 
 			font-size: 18px; 
 			border-radius: 10px; 
 			background: rgb(250,237,125); 
 			margin-left: 50px;
 		} 
 		#area2{ 
 			width: 200px; 
 			height: 50px; 
 			cursor: pointer; 
 			text-align: center; 
 			font-size: 18px; 
 			border-radius: 10px; 
 			background: rgb(250,237,125); 
 			margin-left: 50px;
 		} 
 		#area3{  			
 			width: 200px; 
			height: 50px; 
 			cursor: pointer;  			
 			text-align: center; 
			font-size: 18px; 
			border-radius: 10px; 
 			background: rgb(250,237,125); 
 			margin-left: 50px;
		}
		#area4{  			
 			width: 200px; 
			height: 50px; 
 			cursor: pointer;  			
 			text-align: center; 
			font-size: 18px; 
			border-radius: 10px; 
 			background: rgb(250,237,125); 
 			margin-left: 50px;
		}
		#area5{  			
 			width: 200px; 
			height: 50px; 
 			cursor: pointer;  			
 			text-align: center; 
			font-size: 18px; 
			border-radius: 10px; 
 			background: rgb(250,237,125); 
 			margin-left: 50px;
		}
		.apply{
			color: red;
		}
		#musicTitle{
			width: 425px;
			height: 150px;
			margin-top: -230px;
		}
		#bodyline2{
			width: 1000px;
			height: 600px;
			margin: auto;
			border: solid thin;
			background: white;
		}
		span{
			color: red;
			font-size: 20px;
		}
		#spantext{
			font-size: 16px;
		}
		#musicTitleText{
			text-align: center;
		}
	</style>
</head>
<body>
	<div id="outline" class="gameInfo">
		<header>SELECT MUSIC</header>
		<div id="bodyline" class="gameInfo">
			<div id="bodyline2">
			<div id="musicList" class="gameInfo">
				<div id="musicTitle">
				<div id="musicTitleText">
					*How to Play*<br><br>
					1. 좌측의 플레이 하고 싶은 곡을 선택합니다.<br>
					2. 우측의 키배치, 배속, 옵션을 선택합니다.<br>
					3. 시작 버튼을 누릅니다.
					<br><br><span id="spantext">*숫자는 해당 곡 난이도입니다</span><br><br><br>
					<b>[ Music List ]</b><br><br>
				</div>
					<form action="musicData" method="post">
						<div id="areaOut">
							<input type="text" value="Elegante" readonly="readonly" id="area1"><span><b> 2</b></span><br>
							<input type="text" value="Laplace" readonly="readonly" id="area2"><span><b> 12</b></span><br>
							<input type="text" value="Her Majesty" readonly="readonly" id="area3"><span><b> 5</b></span><br>
							<input type="text" value="Rage Against Usual" readonly="readonly" id="area4"><span><b> 8</b></span><br>
							<input type="text" value="Laplace - Hard" readonly="readonly" id="area5"><span><b> 20</b></span><br>
						</div>
					</form>
				</div>
			</div>
			
			<div class="gameInfo">
				<div id="musicTitleImage"></div>
				<div id="keyInfo">
				
					<form action="canvas" method="post">
						<div id="dataSeat"></div>
						<img alt="gear" src="resources/images/lineBottom.png" id="gear">
						<br>　　　
						　<input type="button" value="키변경" onclick="popup()" id="keyConf">
						　　　　　　
						<input type="button" value="커뮤니티로" id="community" onclick="goCommunity()">
						<br>　　　　　　　　
						<div id="buttonControl">
							<input type="submit" value="Start" id="start">
						</div>
						<br><br>　　배속 : 
						<select name="speed" id="speed">
							<option value="1.0">1.0</option>
							<option value="1.2">1.2</option>
							<option value="1.4">1.4</option>
							<option value="1.6">1.6</option>
							<option value="1.8">1.8</option>
							<option value="2.0">2.0</option>
							<option value="2.2">2.2</option>
							<option value="2.4">2.4</option>
							<option value="2.6">2.6</option>
							<option value="2.8">2.8</option>
							<option value="3.0">3.0</option>
							<option value="3.2">3.2</option>
							<option value="3.4">3.4</option>
							<option value="3.6">3.6</option>
							<option value="3.8">3.8</option>
							<option value="4.0">4.0</option>
							<option value="4.2">4.2</option>
							<option value="4.4">4.4</option>
							<option value="4.6">4.6</option>
							<option value="4.8">4.8</option>
						</select>
						
						　　　　옵션 : <select name="option" id="option">
							  	<option value="1">None</option>
							  	<option value="2">Mirror</option>
							  	<option value="3">Random</option>
							  </select>
					</form>
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			var gwidth = $('#gear')[0].naturalWidth;
			var gheight = $('#gear')[0].naturalHeight;
			var width = gwidth + 38;
			var height = gheight - 50;
			$('#gear').css('width',width);
			$('#gear').css('height',height);
			
			var preImg = '<img alt="pre" src="resources/images/pretitle.jpg" id="preImage">';
			$('#musicTitleImage').html(preImg);
			
			
			
			
			$('#start').hide();
			
			$('#area1').on('click',function(){
				$('#area1').removeClass('apply');
				$('#area2').removeClass('apply');
				$('#area3').removeClass('apply');
				$('#area4').removeClass('apply');
				$('#area5').removeClass('apply');
				$(this).addClass('apply');
				$('#start').fadeIn('slow'); //버튼 뚜렷해짐 = 버튼 보임
				tossData($(this).val());
				
				var imgFIle = '<img alt="la" src="resources/images/eleganteback.jpg" id="image">';
				$('#musicTitleImage').html(imgFIle);
				
				var originalWidth = $('#image')[0].naturalWidth;
				var originalHeight = $('#image')[0].naturalHeight;
				var changeWidth = gwidth - 78;
				var changeHeight = gheight - 58;	//이미지를 불러오고 크기 조정
				$('#image').css('width',width);
				$('#imgae').css('height',height);
			});
// 			$('#area1').on('focusout',function(){
// 				$(this).removeClass('apply');
// 				$('#start').fadeOut('fast'); //버튼 흐려짐 = 버튼 안보임
// 			});
			
			$('#area2').on('click',function(){
				$('#area1').removeClass('apply');
				$('#area2').removeClass('apply');
				$('#area3').removeClass('apply');
				$('#area4').removeClass('apply');
				$('#area5').removeClass('apply');
				$(this).addClass('apply');
				$('#start').fadeIn('slow');
				tossData($(this).val());
				
				var imgFIle = '<img alt="la" src="resources/images/laplaceback.jpg" id="image">';
				$('#musicTitleImage').html(imgFIle);
				
				var originalWidth = $('#image')[0].naturalWidth;
				var originalHeight = $('#image')[0].naturalHeight;
				var changeWidth = gwidth - 78;
				var changeHeight = gheight - 58;	//이미지를 불러오고 크기 조정
				$('#image').css('width',width);
				$('#imgae').css('height',height);
			});
// 			$('#area2').on('focusout',function(){
// 				$(this).removeClass('apply');
// 				$('#start').fadeOut('fast');
// 			});
			
			$('#area3').on('click',function(){
				$('#area1').removeClass('apply');
				$('#area2').removeClass('apply');
				$('#area3').removeClass('apply');
				$('#area4').removeClass('apply');
				$('#area5').removeClass('apply');
				$(this).addClass('apply');
				$('#start').fadeIn('slow');
				tossData($(this).val());
				
				var imgFIle = '<img alt="la" src="resources/images/hermajestyback.jpg" id="image">';
				$('#musicTitleImage').html(imgFIle);
				
				var originalWidth = $('#image')[0].naturalWidth;
				var originalHeight = $('#image')[0].naturalHeight;
				var changeWidth = gwidth - 78;
				var changeHeight = gheight - 58;	//이미지를 불러오고 크기 조정
				$('#image').css('width',width);
				$('#imgae').css('height',height);
			});
// 			$('#area3').on('focusout',function(){
// 				$(this).removeClass('apply');
// 				$('#start').fadeOut('fast');
// 			});
			
			$('#area4').on('click',function(){
				$('#area1').removeClass('apply');
				$('#area2').removeClass('apply');
				$('#area3').removeClass('apply');
				$('#area4').removeClass('apply');
				$('#area5').removeClass('apply');
				$(this).addClass('apply');
				$('#start').fadeIn('slow');
				tossData($(this).val());
				
				var imgFIle = '<img alt="ra" src="resources/images/rage.png" id="image">';
				$('#musicTitleImage').html(imgFIle);
				
				var originalWidth = $('#image')[0].naturalWidth;
				var originalHeight = $('#image')[0].naturalHeight;
				var changeWidth = gwidth - 78;
				var changeHeight = gheight - 58;	//이미지를 불러오고 크기 조정
				$('#image').css('width',width);
				$('#imgae').css('height',height);
			});
// 			$('#area4').on('focusout',function(){
// 				$(this).removeClass('apply');
// 				$('#start').fadeOut('fast');
// 			});
			
			$('#area5').on('click',function(){
				$('#area1').removeClass('apply');
				$('#area2').removeClass('apply');
				$('#area3').removeClass('apply');
				$('#area4').removeClass('apply');
				$('#area5').removeClass('apply');
				$(this).addClass('apply');
				$('#start').fadeIn('slow');
				tossData($(this).val());
				
				var imgFIle = '<img alt="ra" src="resources/images/laplaceback.jpg" id="image">';
				$('#musicTitleImage').html(imgFIle);
				
				var originalWidth = $('#image')[0].naturalWidth;
				var originalHeight = $('#image')[0].naturalHeight;
				var changeWidth = gwidth - 78;
				var changeHeight = gheight - 58;	//이미지를 불러오고 크기 조정
				$('#image').css('width',width);
				$('#imgae').css('height',height);
			});
// 			$('#area5').on('focusout',function(){
// 				$(this).removeClass('apply');
// 				$('#start').fadeOut('fast');
// 			});
		});
		
		function tossData(musicName) {
			$.ajax({
				url: 'preCanvas'
				,type: 'get'
				,data: {musicName: musicName}
				,dataType: 'json'
				,success: function(ar){
					var input = '<input type="hidden" value="' + ar[0] + '" name="bmsFileName" id="titleImg">' +
								'<input type="hidden" value="' + ar[1] + '" name="bpm">' +
								'<input type="hidden" value="' + ar[2] + '" name="imageName">';
					$('#dataSeat').html(input);
				}
				,error: function(x){
					alert(JSON.stringify(x));
				}
			});
		}
		
		function popup() {
			window.open('keyConfig','keyConfiguration','top=200,left=400,width=450px,height=250px;');
		}
		
		function goCommunity() {
			location.href = './';
		}
	</script>
</html>