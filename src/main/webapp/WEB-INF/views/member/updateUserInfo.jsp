<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
	<style type="text/css">
		.err{
			color: red;
		}
		#outline{
			width: 99%;
			height: 700px;
			margin: auto;
			border: solid thin;
		}
		#header{
			width: 99%;
			height: 190px;
			margin: auto;
			border: solid thin;
		}
		#logo{
			width: 400px;
			height: 180px;
			margin: auto;
		}
		#main{
			width: 99%;
			height: 470px;
			margin: auto;
			border: solid thin;
		}
		#menu{
			width: 20%;
			height: 450px;
			border: solid thin;
		}
		#content{
			width: 79%;
			height: 450px;
			border: solid thin;
		}
		.body{
			display: inline-table;
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
	</style>
</head>
<body>

	<div id="outline">
		<div id="header">
			<img alt="lf" src="resources/images/logoLeft.png">
			<div id="logo">
				<a href="./"><img alt="logo.png" src="resources/images/logo.png"></a>
			</div>
			<div id="logoRight">
				<img alt="lr" src="resources/images/logoRight.png">
			</div>
		</div>
		
		<div id="main">
			<div id="menu" class="body">
				<ul>
					<li>회원정보 수정</li>
					<li><a href="deleteMember">회원 탈퇴</a></li>
				</ul>
			</div>
			<div id="content" class="body">
				<form action="updateUserForm" method="post" onsubmit="return formCheck()">
					<input type="hidden" name="id" value="${loginId }">
					
					비밀번호<br><br>
					<input type="password" name="password" id="pass">
					<input type="submit" value="확인">
					<div id="err" class="err"></div>
					<c:if test="${errMessage != null }">
						<br><div class="err" id="div2">${errMessage }</div>
					</c:if>
				</form>
			</div>
		</div>
	</div>

</body>
	<script type="text/javascript">
		function formCheck() {
			var pass = document.getElementById('pass');
			var err = document.getElementById('err');
			var div2 = document.getElementById('div2');
			
			if(pass.value == ''){
				err.innerHTML = '<br>비밀번호를 입력하세요';
				div2.innerHTML = '';
				pass.focus();
				return false;
			}
			
			return true;
		}
	</script>
</html>