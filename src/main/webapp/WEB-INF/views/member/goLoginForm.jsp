<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
	<style type="text/css">
		#err{
			color: red;
		}
		#outline{
			width: 99%;
			height: 600px;
			margin: auto;
		}
		#loginForm{
			width: 250px;
			height: 170px;
			margin: auto;
			background: rgb(225,225,225);
			text-align: center;
			margin-top: 100px;
		}
	</style>
</head>
<body>
	<div id="outline">
		<div id="loginForm">
			<br>
			비정상적인 접근입니다<br><br>
			<form action="anotherLogin" method="post" onsubmit="return formCheck()">
				<input type="hidden" value="">
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" id="id" name="id">
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td>
							<input type="password" id="pass" name="password">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="로그인">
							<input type="button" value="취소" onclick="cancel()">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	
	<c:if test="${loginErr != null }">
		<div id="err"><br>${loginErr }</div>
	</c:if>
</body>
	<script type="text/javascript">
		function formCheck() {
			var id = document.getElementById('id');
			var pass = document.getElementById('pass');
			
			if(id.value == ''){
				alert('아이디를 입력하세요');
				id.focus();
				return false;
			}
			if(pass.value == ''){
				alert('비밀번호를 입력하세요');
				pass.focus();
				return false;
			}
			return true;
		}
		
		function cancel() {
			location.href = './';
		}
		
	</script>
</html>