<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
	<style type="text/css">
		div{
			color: red;
		}
		#outline{
			width: 99%;
			height: 600px;
		}
		#dform{
			width: 400px;
			height: 200px;
			background: rgb(225,225,225);
			margin: auto;
			margin-top: 200px;
		}
		#innerForm{
			color: black;
			width: 230px;
			height: 100px;
			margin: auto;
			padding-top: 40px;
		}
	</style>
</head>
<body>
	<div id="outline">
		<div id="dform">
			<div id="innerForm">
				<form action="deleteUser" method="post" onsubmit="return formCheck()">
					<input type="hidden" value="${loginId }" name="id">
					비밀번호<br>
					<input type="password" name="password" id="pass">
					<input type="submit" value="확인">
					<br><br>
					<input type="button" value="취소" onclick="cancel()">
				</form>
				<div id="div"></div>
				<c:if test="${errMessage != null }">
					<div id="div2"><br>${errMessage }</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		function formCheck() {
			var pass = document.getElementById('pass');
			var div = document.getElementById('div');
			var div2 = document.getElementById('div2');
			
			if(pass.value == ''){
				div.innerHTML = '<br>비밀번호를 입력하지 않았습니다';
				div2.innerHTML = '';
				pass.focus();
				return false;
			}
			
			if(confirm('탈퇴 하시겠습니까?')){
				
			}else{
				return false;
			}
			return true;
		}
		
		function cancel() {
			location.href = './';
		}
	</script>
</html>