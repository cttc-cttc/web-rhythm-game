<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보 수정</title>
	<style type="text/css">
		#joinForm{
			width: 250px;
			margin: auto;
			background: rgb(220,220,220);
		}
		#button{
			width: 91px;
			margin: auto;
		}
		.userInfo{
			width: 100px;
		}
		td{
			padding-left: 10px;
		}
		.divColor{
			color: red;
		}
	</style>
</head>
<body>

	<form action="infoUpdateComplite" method="post" onsubmit="return updateform()">
		<br><br>
		<div id="joinForm">
			<table>
				<tr><td><br>아이디</td></tr>
				<tr>
					<td>
						<input type="text" class="userInfo" name="id" readonly="readonly" value="${userInfo.id }">
					</td>
				</tr>
				<tr><td><br>비밀번호</td></tr>
				<tr>
					<td>
						<input type="password" id="pass1" class="userInfo" name="password" placeholder="8~12자리" value="${userInfo.password }">
					</td>
				</tr>
				<tr><td><div id="div2" class="divColor"></div></td></tr>
				<tr><td><br>비밀번호 확인</td></tr>
				<tr>
					<td>
						<input type="password" id="pass2" class="userInfo" value="${userInfo.password }">
					</td>
				</tr>
				<tr><td><div id="div3" class="divColor"></div></td></tr>
				<tr><td><br>닉네임</td></tr>
				<tr>
					<td>
						<input type="text" id="nicname" class="userInfo" name="nicname" readonly="readonly" value="${userInfo.nicname }">
						<input type="button" value="닉네임 중복확인" onclick="nicnameCheck()">
					</td>
				</tr>
			</table>
			<br><br>
		</div>
		<br>
		<div id="button">
			<input type="submit" value="수정">
			<input type="button" value="취소" onclick="cancel()">
		</div>
	</form>

</body>
	<script type="text/javascript">
		function updateform() {
			var pass1 = document.getElementById('pass1');
			var pass2 = document.getElementById('pass2');
			var div2 = document.getElementById('div2');
			var div3 = document.getElementById('div3');
			
			if(pass1.value == ''){
				div2.innerHTML = '비밀번호를 입력하세요';
				pass1.focus();
				return false;
			}
			if(pass2.value == ''){
				div3.innerHTML = '비밀번호 확인을 해주세요';
				pass2.focus();
				return false;
			}
			if(pass1.value != pass2.value){
				div3.innerHTML = '비밀번호가 일치하지 않습니다';
				pass2.value = '';
				pass2.focus();
				return false;
			}
			
			if(confirm('수정 하시겠습니까?')){
				
			}else{
				return false;
			}
			return true;
		}
		
		function nicnameCheck() {
			window.open('nicnameCheck','nicnameCheck','top=200,left=600,width=350,height=200');
		}
		
		function cancel() {
			location.href = './';
		}
	</script>
</html>