<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>계정관리를 잘 합시다</title>
	<link rel="stylesheet" href="resources/css/boardStyle.css">
	<style type="text/css">
		#boardContent{
			text-align: center;
		}
		#logo{
			width: 400px;
			height: 180px;
			margin: auto;
			margin-top: -190px;
		}
		#logoRight{
			margin-left: 80.5%;
			margin-top: -184px;
		}
		
		a:link { color: rgb(70,161,211); text-decoration: none;}
		a:visited { color: rgb(70,161,211); text-decoration: none;}
		a:hover { color: blue; text-decoration: underline;}
	</style>
</head>
<body>

	<div id="outline">
		<header>
			<img alt="lf" src="resources/images/logoLeft.png">
			<div id="logo">
				<a href="./"><img alt="logo.png" src="resources/images/logo.png"></a>
			</div>
			<div id="logoRight">
				<img alt="lr" src="resources/images/logoRight.png">
			</div>
		</header>
		<div id="outline2">
		
			<div id="board">
				<span><a href="freeBoard">자유</a></span>
				<span>공지</span>
				<span>수록곡 정보</span>
				<span><a href="scoreBoard">곡별 점수</a></span>
			</div>
			<div id="boardContent">
				<br>
				<div><h3>여러분의 계정은 소중합니다<br><br>
				평소에 잘 관리하는 습관을 가집시다!</h3></div>
			
			</div>
		</div>
	</div>

</body>
</html>