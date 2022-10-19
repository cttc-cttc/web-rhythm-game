<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
<link rel="stylesheet" href="resources/css/boardStyle.css">
	<style type="text/css">
		#logo{
			width: 400px;
			height: 180px;
			margin: auto;
			margin-top: -190px;
		}
		#logoRight{
			margin-left: 80.5%;
			margin-top: -184px;
		}
		#boardTable{
			width: 550px;
		}
		#clickButton{
			width: 91px;
			height: 26px;
			margin-left: auto;
		}
		#writeButton{
			width: 42px;
			height: 26px;
			margin-left: auto;
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
		
		<div id="board">
			<span><a href="freeBoard">자유</a></span>
			<span>공지</span>
			<span>수록곡 정보</span>
			<span><a href="scoreBoard">곡별 점수</a></span>
		</div>
		<div id="boardContent">

				<form action="updateFreeBoardForm" method="post">
					<input type="hidden" value="${readBoard.freeboardnum }" name="boardnum">
					<table id="boardTable">
						<tr>
							<th>${readBoard.nicname }</th>
							<th width="250px">${readBoard.title }</th>
							<th>${readBoard.indate }</th>
							<th>${readBoard.hits }</th>
						</tr>
						<tr>
							<td colspan="4"><pre>${readBoard.content }</pre></td>
						</tr>
						<c:if test="${loginId == readBoard.id}">
							<tr>
								<td colspan="4">
									<div id="clickButton">
										<input type="submit" value="수정">
										<input type="button" value="삭제" onclick="deleteBoard(${readBoard.freeboardnum })">
									</div>
								</td>
							</tr>
						</c:if>
					</table>
				</form>
				<br>
				<a href="freeBoard">목록으로</a>
				
				
				<input type="hidden" value="${readBoard.freeboardnum }" id="freeboardnum">
				<input type="hidden" value="${loginId }" id="id">
				<input type="hidden" value="${loginNicname }" id="nicname">
						
				<c:if test="${loginId != null }">
					<br><br><br><br>
						댓글 작성<br><br>
						<table id="replyTable">
							<tr>
								<th>${loginNicname }</th>
							</tr>
							<tr>
								<td>
									<textarea rows="5" cols="75" id="replyContent"></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<div id="writeButton">
										<input type="button" value="작성" onsubmit="return replyFormCheck()" id="writeReplyButton">
									</div>
								</td>
							</tr>
						</table>
				</c:if>
				
				<br><br><br>
				댓글<br><br>
				<div id="comments"></div>
		</div>
		
	</div>
</div>
	
	
</body>
 	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	
		$(document).ready(function(){
			$('#writeReplyButton').on('click', sendReply);
			printReply();
			
			$('#boardTable th').css('background','rgb(197,192,255)');
			$('#boardTable tr').css('background', 'rgb(236,235,255)');
			
			$('#replyTable tr').css('background', 'rgb(236,235,255)');
			
		});
	
		function deleteBoard(num) {
			if(confirm('삭제 하시겠습니까?')){
				location.href = 'deleteFreeBoard?boardnum=' + num;
			}else{
				
			}
		}
		
		function sendReply() {
			var replyContent = document.getElementById('replyContent');
			
			if(replyContent.value == ''){
				alert('댓글 내용을 입력하세요');
				replyContent.focus();
				return;
			}
			
			var replycontent = $('#replyContent').val();
			var freeboardnum = $('#freeboardnum').val();
			var id = $('#id').val();
			var nicname = $('#nicname').val();
			
			$.ajax({
				url: 'writeReply'
				,type: 'post'
				,data: {freeboardnum: freeboardnum, id: id, nicname: nicname, replycontent: replycontent}
				,success: function(){
					replyContent.value = '';
					printReply();
				}
				,error: function(x){
					alert(JSON.stringify(x));
				}
			});
			
		}
		
		function printReply() {
			var freeboardnum = $('#freeboardnum').val();
			var id = $('#id').val();

			$.ajax({
				url: 'showReply'
				,type: 'post'
				,data: {freeboardnum: freeboardnum}
				,dataType: 'json'
				,success: function(reply){
					
					var str = '';
					
					$.each(reply, function(index, item){
						str += '<table class="ajaxReply"><tr><td width="450">' + item.nicname + '</td><td>' + item.replyindate + '</td></tr>';
						str += '<tr><td colspan="2"><pre>' + item.replycontent + '</pre></td></tr>';
						
						if(id == item.id){
							str += '<tr><td colspan="2"><div class="deleteBt"><input type="button" class="delete" value="삭제" num="' + item.replynum + '"></div></td></tr>';
						}
						
						str += '</table><hr><br><br>';
					});
					
					$('#comments').html(str);
					$('.delete').on('click',deleteReply);
					
					$('.ajaxReply tr:nth-child(2n-1)').css('background', 'rgb(236,235,255)');
					$('.ajaxReply tr:nth-child(2n)').css('background', 'rgb(245,245,245)');
					$('.ajaxReply').css('width','558px');
					$('.deleteBt').css('width','42px').css('height','26px').css('margin-left','auto');
				}
				,error: function(x){
					alert(JSON.stringify(x));
				}
			});
			
		}
		
		function deleteReply() {
			
			if(confirm('삭제 하시겠습니까?')){
				
			}else{
				return;
			}
			
			var replynum = $(this).attr('num');
			$.ajax({
				url: 'deleteReply'
				,type: 'post'
				,data: {replynum: replynum}
				,success: function(){
					
				}
				,error: function(x){
					alert(JSON.stringify(x));
				}
			});
			
			printReply();
		}
	</script>
</html>