<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>닉네임 중복확인</title>
<style type="text/css">
		div{
			color: red;
		}
	</style>
</head>
<body>
	<form action="nicnameConfirm" method="get" onsubmit="return formCheck()">
		<input type="text" name="nicname" id="searchNicname">
		<input type="submit" value="확인"><br>
		<div id="div"></div>
	</form>
	
	<c:if test="${checkNumber == 2 }">
		<br>
		${useNicname }는 이미 사용중인 닉네임입니다
	</c:if>
	<c:if test="${checkNumber == 1 }">
		<br>
		${useNicname }는 사용 가능한 닉네임입니다<br><br>
		<input type="button" value="사용하기" onclick="useNicname('${useNicname }')">
	</c:if>
</body>
	<script type="text/javascript">
		function formCheck() {
			var searchNicname = document.getElementById('searchNicname');
			var div = document.getElementById('div');
			
			if(searchNicname.value == ''){
				div.innerHTML = '사용할 닉네임을 입력하세요';
				searchNicname.focus();
				return false;
			}
			if(searchNicname.value.length < 2 || searchNicname.value.length > 10){
				div.innerHTML = '닉네임은 2~10자리로 만들어주세요';
				searchNicname.value = '';
				searchNicname.focus();
				return false;
			}
		
			return true;
		}
		
		function useNicname(nicname) {
			opener.document.getElementById('nicname').value = nicname;
			this.close();
		}
	</script>
</html>