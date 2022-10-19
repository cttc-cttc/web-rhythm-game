<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Accent</title>
	<style type="text/css">
		#outline{
			width: 99%;
			height: 700px;
		}
		header{
			height: 190px;
 			border: solid thin; 
		}
		#outline2{
			width: 99%;
			height: 510px;
		}
		.body{
			display: table-cell;
		}
		#body1{
			width: 20%;
			height: 500px;
		}
		#body2{
 			width: 78%;
			height: 480px;
		}
		#login{
			width: 250px;
			height: 217px;
			border: solid thin; 
			margin: auto;
			background: rgb(245,245,245);
			border-color: rgb(165,165,165);
		}
		#game{
			width: 250px;
			height: 190px;
 			border: solid thin; 
			margin: auto;
			background: rgb(245,245,245);
			border-color: rgb(165,165,165);
		}
		#board{
			height: 50px;
 			border: solid thin;
 			background: rgb(236,235,255);
 			border-color: rgb(165,165,165);
		}
		#notice{
			height: 350px;
			border: solid thin;
			background: rgb(245,245,245);
			border-color: rgb(165,165,165);
		}
		.logInfo{
			width: 100px;
		}
		#loginErr{
			color: red;
		}
		#memberInfo{
			width: 200px;
			height: 100px;
			margin: auto;
			text-align: right;
		}
		#loginbefore{
			width: 250px;
			height: 100px;
			margin: auto;
		}
		#logo{
			width: 400px;
			height: 180px;
			margin: auto;
			margin-top: -190px;
		}
		#logoRight{
			margin-left: 81%;
			margin-top: -180px;
		}
		span{
			margin-left: 19%;
		}
		#gameButton{
			width: 150px;
			height: 150px;
			margin-top: 20px;
			margin-left: 47px;
			font-size: 25px;
		}
		#loginTable{
			background: rgb(236,235,255);
			margin: auto;
			margin-top: 10px;
		}
		#noticeContent{
			width: 377px;
			height: 30px;
			font-size: 18px;
			margin: auto;
			margin-top: 30px;
		}
		#tego{
			width: 606px;
			height: 250px;
			margin: auto;
			margin-top: 26px;
		}
		#comment{
			width: 386px;
			height: 26px;
			margin: auto;
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
		<div class="body" id="body1">
			<div id="login">
					<div id="loginBefore">
					<c:choose>
						<c:when test="${loginId == null }">
							<form action="loginMember" method="post" onsubmit="return formCheck()">
								<input type="hidden" value="main" name="pageType">
								<table id="loginTable">
									<tr>
										<td>아이디</td>
										<td>
											<input type="text" class="logInfo" name="id" id="userId">
										</td>
										
									</tr>
									<tr>
										<td>비밀번호</td>
										<td>
											<input type="password" class="logInfo" name="password" id="userPass">
										</td>
										<td>
											<input type="submit" value="로그인">
										</td>
									</tr>
									<tr>
										<td colspan="3">
											<a href="javascript:joinForm()">회원가입</a>
											<a href="y">아이디/비밀번호 찾기</a>
										</td>
									</tr>
								</table>
							</form>
							<c:if test="${loginErr != null }">
								<div id="loginErr">${loginErr }</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<div id="memberInfo">
								${loginNicname }님<br>
								<a href="updateUserInfo">정보수정</a>
								<a href="logout">로그아웃</a>
							</div>
						</c:otherwise>
					</c:choose>
					</div>
			</div>
			<div id="game">
				<input type="button" value="game start" onclick="gameStart()" id="gameButton">
			</div>
		</div>
		
		<div class="body" id="body2">
			<div id="board">
				<span><a href="freeBoard">자유</a></span>
				<span>공지</span>
				<span>수록곡 정보</span>
				<span><a href="scoreBoard">곡별 점수</a></span>
			</div>
			<div id="notice">
				<div id="noticeContent">
					노래에 맞춰서 내려오는 노트를 두들겨봅시다!
				</div>
				<div id="tego">
					<img alt="tego1" src="resources/images/tego.jpg">
					<img alt="tego22" src="resources/images/tego22.png">
					<div id="comment">게임할 때 뭔가 이상하다 싶으면 새로고침을 해보세요</div>
				</div>
				
			</div>
		</div>
	</div>
</div>

</body>
	<script type="text/javascript">
		function formCheck() {
			var userId = document.getElementById('userId');
			var userPass = document.getElementById('userPass');
			
			if(userId.value == ''){
				alert('아이디를 입력하세요');
				userId.focus();
				return false;
			}
			if(userPass.value == ''){
				alert('비밀번호를 입력하세요');
				userPass.focus();
				return false;
			}
			
			return true;
		}
		
		function joinForm() {
			location.href = 'joinForm';
		}
		
		function gameStart() {
			location.href = 'inGame';
		}
	</script>
</html>
