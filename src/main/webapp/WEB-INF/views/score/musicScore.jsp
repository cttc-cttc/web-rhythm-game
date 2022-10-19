<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>곡별 점수</title>
<link rel="stylesheet" href="resources/css/boardStyle.css">
	<style type="text/css">
		table{
			text-align: center;
		}
		h2{
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
		#score th{
			background: rgb(197,192,255);
		}
		#score tr{
			background: rgb(236,235,255);
		}
		#score tr:nth-child(2n){
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
				<c:if test="${musicTitle == 'LaplaceNormal'}">
					<h2>Laplace - Normal ( 난이도 : 12 )</h2>
				</c:if>
				<c:if test="${musicTitle == 'EleganteEasy'}">
					<h2>Elegante - Easy ( 난이도 : 2 )</h2>
				</c:if>
				<c:if test="${musicTitle == 'HerMajestyEasy'}">
					<h2>Her Majesty - Easy ( 난이도 : 5 )</h2>
				</c:if>
				<c:if test="${musicTitle == 'LaplaceHard'}">
					<h2>Laplace - Hard ( 난이도 : 20 )</h2>
				</c:if>
				<c:if test="${musicTitle == 'RageAgainstUsualEasy'}">
					<h2>Rage Against Usual - Easy ( 난이도 : 8 )</h2>
				</c:if>
				<table id="score">
					<tr>
						<th width="100px">순위</th>
						<th width="200px">닉네임</th>
						<th width="228px">점수</th>
					</tr>
					<c:forEach var="score" items="${scoreInfo }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${score.nicname }</td>
							<td>${score.score }</td>
						</tr>
					</c:forEach>
				</table>
	
		</div>
	</div>
</div>
	
</body>
</html>