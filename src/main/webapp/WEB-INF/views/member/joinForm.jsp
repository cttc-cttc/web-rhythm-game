<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
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

	<form action="join" method="post" onsubmit="return joinform()">
		<br><br>
		<div id="joinForm">
			<table>
				<tr><td><br>아이디</td></tr>
				<tr>
					<td>
						<input type="text" id="id" class="userInfo" name="id" readonly="readonly" placeholder="8~12자리">
						<input type="button" value="아이디 중복확인" onclick="idCheck()">
					</td>
				</tr>
				<tr><td><div id="div1" class="divColor"></div></td></tr>
				<tr><td><br>비밀번호</td></tr>
				<tr>
					<td>
						<input type="password" id="pass1" class="userInfo" name="password" placeholder="8~12자리">
					</td>
				</tr>
				<tr><td><div id="div2" class="divColor"></div></td></tr>
				<tr><td><br>비밀번호 확인</td></tr>
				<tr>
					<td>
						<input type="password" id="pass2" class="userInfo">
					</td>
				</tr>
				<tr><td><div id="div3" class="divColor"></div></td></tr>
				<tr><td><br>닉네임</td></tr>
				<tr>
					<td>
						<input type="text" id="nicname" class="userInfo" name="nicname" readonly="readonly" placeholder="2~10자리">
						<input type="button" value="닉네임 중복확인" onclick="nicnameCheck()">
					</td>
				</tr>
				<tr><td><div id="div4" class="divColor"></div></td></tr>
			</table>
			<br><br>
		</div>
		<br>
		<div id="button">
			<input type="submit" value="가입">
			<input type="button" value="취소" onclick="cancel()">
		</div>
	</form>

</body>
	<script type="text/javascript">
		function joinform() {
			var id = document.getElementById('id');
			var pass1 = document.getElementById('pass1');
			var pass2 = document.getElementById('pass2');
			var nicname = document.getElementById('nicname');
			var div1 = document.getElementById('div1');
			var div2 = document.getElementById('div2');
			var div3 = document.getElementById('div3');
			var div4 = document.getElementById('div4');
			
			if(id.value == ''){
				div1.innerHTML = '아이디를 입력하세요';
				return false;
			}
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
			if(nicname.value == ''){
				div4.innerHTML = '닉네임을 입력하세요'
				return false;
			}
			
			return true;
		}
		
		function idCheck() {
			window.open('idCheck','idCheck','top=200,left=600,width=350,height=200');
		}
		
		function nicnameCheck() {
			window.open('nicnameCheck','nicnameCheck','top=200,left=600,width=350,height=200');
		}
		
		function cancel() {
			location.href = './';
		}
	</script>
</html>