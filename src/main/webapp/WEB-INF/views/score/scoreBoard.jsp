<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>점수 조회</title>
<link rel="stylesheet" href="resources/css/boardStyle.css">
	<style type="text/css">
		table{
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
		#scoreTable th{
			background: rgb(197,192,255);
		}
		#scoreTable tr{
			background: rgb(236,235,255);
		}
		#scoreTable tr:nth-child(2n){
			background: rgb(245,245,245);
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
			<table id="scoreTable">
				<tr>
					<th>번호</th>
					<th width="500px">곡명 / 난이도(Easy, Normal, Hard)</th>
				</tr>
				<tr>
					<td>1</td>
					<td>
						Elegante [
						<a href="javascript:musicName('EleganteEasy')">easy</a>
						 Normal Hard ]
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>
						Laplace [ Easy 
						<a href="javascript:musicName('LaplaceNormal')">Normal</a>
						 <a href="javascript:musicName('LaplaceHard')">Hard</a> ]
					</td>
				</tr>
				<tr>
					<td>3</td>
					<td>
						Her Majesty [
						<a href="javascript:musicName('HerMajestyEasy')">easy</a>
						 Normal Hard ]
					</td>
				</tr>
				<tr>
					<td>4</td>
					<td>
						Rage Against Usual [ 
						<a href="javascript:musicName('RageAgainstUsualEasy')">easy</a> Normal Hard ]
					</td>
				</tr>
			</table>
		</div>
		
	</div>
</div>

</body>
	<script type="text/javascript">
		function musicName(name) {
			location.href = 'scoreConfirm?musicTitle=' + name;
		}
	</script>
</html>