<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>key Configuration</title>
	<style type="text/css">
		.key{
			width: 25px;
			height: 25px;
			border-radius: 4px;
			font-size: 22px;
			text-align: center;
		}
		body{
			text-align: center;
		}
		#key1{
			margin-left: 30px;
		}
		#ukey1{
			margin-left: 30px;
		}
	</style>
</head>
<body>
현재 키 상태<br>
<input type="text" readonly="readonly" id="key1" name="keyone" value="${key1 }" class="key">
<input type="text" readonly="readonly" id="key2" name="keytwo" value="${key2 }" class="key">
<input type="text" readonly="readonly" id="key3" name="keythree" value="${key3 }" class="key">
<input type="text" readonly="readonly" id="key4" name="keyfour" value="${key4 }" class="key">
<input type="text" readonly="readonly" id="key5" name="keyfive" value="${key5 }" class="key">
<br><br>
변경할 키 배치<br>
<input type="text" id="ukey1" class="key">
<input type="text" id="ukey2" class="key">
<input type="text" id="ukey3" class="key">
<input type="text" id="ukey4" class="key">
<input type="text" id="ukey5" class="key"><br><br>
<input type="button" value="변경" onclick="updateKey()">
<input type="button" value="닫기" onclick="closeWindow()">

<br><br>tab 키를 사용하면 조금 편해집니다
</body>

	<script type="text/javascript">
		var key1 = document.getElementById('key1');
		var key2 = document.getElementById('key2');
		var key3 = document.getElementById('key3');
		var key4 = document.getElementById('key4');
		var key5 = document.getElementById('key5');
		
		if(key1.value == '' && key2.value == '' && key3.value == ''
		&& key4.value == '' && key5.value == ''){
			key1.value = 'd';
			key2.value = 'f';
			key3.value = ' ';
			key4.value = 'j';
			key5.value = 'k';
		}
		
		function updateKey() {
			var ukey1 = document.getElementById('ukey1');
			var ukey2 = document.getElementById('ukey2');
			var ukey3 = document.getElementById('ukey3');
			var ukey4 = document.getElementById('ukey4');
			var ukey5 = document.getElementById('ukey5');
			
			if(ukey1.value == '' || ukey2.value == '' 
			|| ukey3.value == '' || ukey4.value == '' || ukey5.value == ''){
				alert('변경할 키를 입력하세요');
				return;
			}
			if(ukey1.value.length != 1 || ukey2.value.length != 1
			|| ukey3.value.length != 1 || ukey4.value.length != 1 || ukey5.value.length != 1){
				alert('지정할 키는 한 자리만 가능합니다');
				return;
			}
			if(ukey1.value == ukey2.value || ukey1.value == ukey3.value
			|| ukey1.value == ukey4.value || ukey1.value == ukey5.value
			|| ukey2.value == ukey3.value || ukey2.value == ukey4.value
			|| ukey2.value == ukey5.value || ukey3.value == ukey4.value
			|| ukey3.value == ukey5.value || ukey4.value == ukey5.value){
				alert('키는 각각 달라야 합니다');
				return;
			}
			
			key1.value = ukey1.value;
			key2.value = ukey2.value;
			key3.value = ukey3.value;
			key4.value = ukey4.value;
			key5.value = ukey5.value;
			
			var form = document.createElement('form');
			form.action = 'updateKey';
			form.method = 'post';
			
			ukey1.name = 'ukeyone';
			ukey2.name = 'ukeytwo';
			ukey3.name = 'ukeythree';
			ukey4.name = 'ukeyfour';
			ukey5.name = 'ukeyfive';
			
			form.appendChild(ukey1);
			form.appendChild(ukey2);
			form.appendChild(ukey3);
			form.appendChild(ukey4);
			form.appendChild(ukey5);
			
			document.body.appendChild(form);
			form.submit();
			
			ukey1.value = '';
			ukey2.value = '';
			ukey3.value = '';
			ukey4.value = '';
			ukey5.value = '';
			
		}
		
		function closeWindow() {
			window.close();
		}
		
	</script>
</html>