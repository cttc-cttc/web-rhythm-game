<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
	<style type="text/css">
		#outline{
			width: 99%;
			height: 600px;
		}
		#bodyLocation{
			width: 790px;
			height: 310px;
			margin: auto;
			margin-top: 100px;
			background: rgb(225,225,225);
		}
		#buttons{
			width: 91px;
			height: 50px;
			margin: auto;
		}
		#title{
			width: 719px;
		}
	</style>
</head>
<body>
	<div id="outline">
		<div id="bodyLocation">
				<br><br>
				<form action="freeBoardUpdate" method="post" onsubmit="return formCheck()">
					<input type="hidden" value="${readBoard.freeboardnum }" name="freeboardnum">
					<table>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="title" id="title" value="${readBoard.title }">
							</td>
						</tr>
						<tr>
							<td>내용</td>
							<td>
								<textarea rows="10" cols="100" name="content" id="content">${readBoard.content }</textarea>
							</td>
						</tr>
					</table>
					<br>
					<div id="buttons">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="cancel()">
					</div>
				</form>
		</div>
	</div>
</body>
	<script type="text/javascript">
		function formCheck() {
			var title = document.getElementById('title');
			var content = document.getElementById('content');
			
			if(title.value == ''){
				alert('제목을 입력하세요');
				title.focus();
				return false;
			}
			if(content.value == ''){
				alert('내용을 입력하세요');
				content.focus();
				return false;
			}
			if(confirm('수정 하시겠습니까?')){
				
			}else{
				return false;
			}
			
			return true;
		}
		
		function cancel() {
			location.href = 'freeBoard';
		}
	</script>
</html>