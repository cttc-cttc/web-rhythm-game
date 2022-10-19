<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Result Page</title>
	<style type="text/css">
		header{
			text-align: center;
			border: solid thin;
			margin-top: 50px;
		}
		#background{
			width: 1000px;
			height: 610px;
			border: solid thin;
			margin: auto;
			margin-top: 50px;
			position: relative;
			z-index: 0;
		}
		#result{
			width: 700px;
			height: 400px;
			margin: auto;
			margin-top: -500px;
			background: rgb(250,236,197);
			position: relative;
			z-index: 1;
		}
		table{
			width: 500px;
			height: 300px;
			border: solid;
			margin: auto;
			margin-top: -80px;
			text-align: center;
			font-size: 19px;
			background: rgb(230,255,255);
		}
		#resultButton{
			width: 264px;
			height: 50px;
			margin: auto;
		}
		.bt{
			font-size: 18px;
			border: solid thin;
			border-radius: 5px;
		}
		#rankMark{
			width: 38px;
			height: 188px;
			margin-left: 10px;
		}
	</style>
</head>
<body>
<header>result</header>
<div id="background">
	<img alt="back" src="resources/images/resultBack.jpg">
		<div id="result">
			<input type="hidden" value="${(perfect + cool + good + miss) * 100 }" id="totalScore">
			<br><br><br><br><br>
			<table border="1">
				<tr>
					<td width="100px">Perfect</td>
					<td width="210px">${perfect }</td>
					<td rowspan="4"><div id="rankMark"></div></td>
				</tr>
				<tr>
					<td>Cool</td>
					<td>${cool }</td>
				</tr>
				<tr>
					<td>Good</td>
					<td>${good }</td>
				</tr>
				<tr>
					<td>Miss</td>
					<td>${miss }</td>
				</tr>
				<tr>
					<td>Score</td>
					<td>${score }</td>
					<td>랭크</td>
				</tr>
			</table>
			<br>
			<div id="resultButton">
				<input type="button" value="곡 선택 화면으로" onclick="musicSelect()" class="bt">
				<input type="button" value="커뮤니티로" onclick="goCommunity()" class="bt">
			</div>
		</div>
</div>
	
	<input type="hidden" value="${loginId }" name="id" id="logID">
	<input type="hidden" value="${loginNicname }" name="nicname" id="nicname">
	<input type="hidden" value="${musictitledif }" name="musictitledif" id="musicName">
	<input type="hidden" value="${score }" name="score" id="score">
	
</body>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		var totalScore = parseFloat($('#totalScore').val());
		var userScore = parseFloat('${score }');
		var realRankScore = userScore / totalScore * 100;
		var rankScore = realRankScore.toFixed(2);
		var rankMark = '';
		
		var logID = $('#logID').val();
		
		$(document).ready(function(){
			
			if(logID != ''){
				setTimeout('sendScore()', 100);
			}
			
			if(rankScore == 100.00){
				rankMark = '<img src="resources/images/p.jpg" id="rankImg">';
			}else if(rankScore >= 90.00 && rankScore < 100.00){
				rankMark = '<img src="resources/images/s.jpg" id="rankImg">';
			}else if(rankScore >= 80.00 && rankScore < 90.00){
				rankMark = '<img src="resources/images/a.jpg" id="rankImg">';
			}else if(rankScore >= 70.00 && rankScore < 80.00){
				rankMark = '<img src="resources/images/b.jpg" id="rankImg">';
			}else if(rankScore >= 60.00 && rankScore < 70.00){
				rankMark = '<img src="resources/images/c.jpg" id="rankImg">';
			}else if(rankScore >= 50.00 && rankScore < 60.00){
				rankMark = '<img src="resources/images/d.jpg" id="rankImg">';
			}else if(rankScore >= 40.00 && rankScore < 50.00){
				rankMark = '<img src="resources/images/e.jpg" id="rankImg">';
			}else{
				rankMark = '<img src="resources/images/f.jpg" id="rankImg">';
			}
			$('#rankMark').html(rankMark);
			
			
		});
		
		function musicSelect() {
			location.href = 'inGame';
		}
		
		function goCommunity() {
			location.href = './';
		}
		
		function sendScore() {
			var nicname = $('#nicname').val();
			var musicName = $('#musicName').val();
			var score = $('#score').val();
			
			$.ajax({
			
				url: 'sendScore'
				,type: 'post'
				,data: {id: logID, nicname: nicname, musictitledif: musicName, score: score}
				,dataType: 'text'
				,success: function(){
					
				}
				,error: function(x){
					alert(JSON.stringify(x));
				}
			});
		}
	</script>
</html>