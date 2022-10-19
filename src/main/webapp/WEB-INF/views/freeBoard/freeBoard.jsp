<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유 게시판</title>
<link rel="stylesheet" href="resources/css/boardStyle.css">
	<style type="text/css">
		table{
			text-align: center;
		}
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
		
			<table id="boardTable">
				<tr>
					<th>번호</th>
					<th width="270px">제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<c:forEach varStatus="status" var="board" items="${freeBoardList }">
					<tr>
						<td>${board.freeboardnum }</td>
						<td><a href="readFreeBoard?boardnum=${board.freeboardnum }">${board.title }</a></td>
						<td>${board.nicname }</td>
						<td>${board.indate }</td>
						<td>${board.hits }</td>
					</tr>
				</c:forEach>
				<tr>
					<td>
						<c:if test="${page - 1 > 0}">
							<a href="javascript:prePage()">이전</a>
						</c:if>
					</td>
					<td colspan="3">
						<c:forEach begin="1" end="${num }" var="pageNum">
							<c:choose>
								<c:when test="${page == pageNum }">
									<b>${pageNum }</b>
								</c:when>
								<c:otherwise>
									<a href="javascript:movePage(${pageNum })">${pageNum }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</td>
					<td>
						<c:if test="${page + 1 <= lastpage}">
							<a href="javascript:nextPage()">다음</a>
						</c:if>
					</td>
				</tr>
			</table>
			
			<c:if test="${loginId != null }">
				<br><br>
				<input type="button" value="글쓰기" onclick="writeForm()">
			</c:if>
			
		</div>
		
	</div>
</div>

	
</body>
	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#boardTable tr th').css('background','rgb(197,192,255)');
			$('#boardTable tr').css('background', 'rgb(236,235,255)');
			$('#boardTable tr:nth-child(2n)').css('background', 'rgb(245,245,245)');
		});
	
	
	
		function writeForm() {
			location.href = 'freeBoardWriteForm';
		}
		
		function prePage() {
			var form = document.createElement('form');
			var input = document.createElement('input');
			
			form.action = 'freeBoard';
			form.method = 'post';
			
			input.type = 'hidden';
			input.value = ${page } - 1;
			input.name = 'page';
			
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		}
		
		function nextPage() {
			var form = document.createElement('form');
			var input = document.createElement('input');
			
			form.action = 'freeBoard';
			form.method = 'post';
			
			input.type = 'hidden';
			input.value = ${page } + 1;
			input.name = 'page';
			
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		}
		
		function movePage(pageNum) {
			var form = document.createElement('form');
			var input = document.createElement('input');
			
			form.action = 'freeBoard';
			form.method = 'post';
			
			input.type = 'hidden';
			input.value = pageNum;
			input.name = 'page';
			
			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		}
	</script>
</html>