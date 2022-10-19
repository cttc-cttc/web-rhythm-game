<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복확인</title>
	<style type="text/css">
		div{
			color: red;
		}
	</style>
</head>
<body>
	<form action="idConfirm" method="get" onsubmit="return formCheck()">
		<input type="text" name="id" id="searchId">
		<input type="submit" value="확인"><br>
		<div id="div"></div>
	</form>
	
	<c:if test="${checkNumber == 2 }">
		<br>
		${useId }는 이미 사용중인 아이디입니다
	</c:if>
	<c:if test="${checkNumber == 1 }">
		<br>
		${useId }는 사용 가능한 아이디입니다<br><br>
		<input type="button" value="사용하기" onclick="useId('${useId }')">
	</c:if>
</body>
	<script type="text/javascript">
		function formCheck() {
			var searchId = document.getElementById('searchId');
			var div = document.getElementById('div');
			
			if(searchId.value == ''){
				div.innerHTML = '사용할 아이디를 입력하세요';
				searchId.focus();
				return false;
			}
			if(searchId.value.length < 8 || searchId.value.length > 12){
				div.innerHTML = '닉네임은 8~12자리로 만들어주세요';
				searchId.value = '';
				searchId.focus();
				return false;
			}
			
			return true;
		}
		
		function useId(id) {
			opener.document.getElementById('id').value = id;
			this.close();
		}
	</script>
</html>