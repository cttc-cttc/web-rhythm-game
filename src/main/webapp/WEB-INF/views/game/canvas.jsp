<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Accent</title>
	<style type="text/css">
		body{
			background: black;
		}
		#outline{
			width: 99%;
			height: 615px;
		}
		#canvasOut{
			width: 1000px;
			height: 610px;
			margin: auto;
		}
		#canvas{
			border: solid white;
		}
	</style>
</head>
<body>
	<div id="outline">
		<div id="canvasOut">
			<canvas id="canvas" width="1000px" height="610px">
				Your browser dosen't support HTML5 Canvas
			</canvas>
		</div>
		<input type="hidden" value="${key1 }" id="kone">
		<input type="hidden" value="${key2 }" id="ktwo">
		<input type="hidden" value="${key3 }" id="kthree">
		<input type="hidden" value="${key4 }" id="kfour">
		<input type="hidden" value="${key5 }" id="kfive">
		
		<div id="audioPlay"></div>
	</div>	
</body>
	<script type="text/javascript">

<%--오디오 관련--%>

	var audio = document.createElement('audio');
	var bmsName = '${bmsFileName }';
	var imgName = '${imageName }';
	
	function mp3play() {
			
			if(bmsName == 'LaplaceNormal' || bmsName == 'LaplaceHard'){
				audio.src='resources/mp3/Laplace.mp3';
				audio.controls = '';
				audio.autoplay = 'autoplay';
				document.getElementById('audioPlay').appendChild(audio);
				
			}else if(bmsName == 'EleganteEasy'){
				audio.src='resources/mp3/Elegante.mp3';
				audio.controls = '';
				audio.autoplay = 'autoplay';
				document.getElementById('audioPlay').appendChild(audio);
				
			}else if(bmsName == 'HerMajestyEasy'){
				audio.src='resources/mp3/Her Majesty.mp3';
				audio.controls = '';
				audio.autoplay = 'autoplay';
				document.getElementById('audioPlay').appendChild(audio);
				
			}else if(bmsName == 'RageAgainstUsualEasy'){
				audio.src='resources/mp3/Rage Against Usual.mp3';
				audio.controls = '';
				audio.autoplay = 'autoplay';
				document.getElementById('audioPlay').appendChild(audio);
			}
			
	}
	
<%--키배치 관련 - 영문과 숫자, space바 만 가능하고 한글과 특수문자는 사용 불가--%>
		var kone = document.getElementById('kone');
		var ktwo = document.getElementById('ktwo');
		var kthree = document.getElementById('kthree');
		var kfour = document.getElementById('kfour');
		var kfive = document.getElementById('kfive');
		
		var lowerKey1 = kone.value.toLowerCase(); <%--키 소문자 변환--%>
		var lowerKey2 = ktwo.value.toLowerCase();
		var lowerKey3 = kthree.value.toLowerCase();
		var lowerKey4 = kfour.value.toLowerCase();
		var lowerKey5 = kfive.value.toLowerCase();
		
		var upperKey1 = kone.value.toUpperCase(); <%--키 대문자 변환--%>
		var upperKey2 = ktwo.value.toUpperCase();
		var upperKey3 = kthree.value.toUpperCase();
		var upperKey4 = kfour.value.toUpperCase();
		var upperKey5 = kfive.value.toUpperCase();
		
		var lowerCodeKey1 = lowerKey1.charCodeAt(0); <%--키 소문자 유니코드(키코드) 표--%>
		var lowerCodeKey2 = lowerKey2.charCodeAt(0);
		var lowerCodeKey3 = lowerKey3.charCodeAt(0);
		var lowerCodeKey4 = lowerKey4.charCodeAt(0);
		var lowerCodeKey5 = lowerKey5.charCodeAt(0);
		
		var upperCodeKey1 = upperKey1.charCodeAt(0); <%--키 대문자 유니코드(키코드) 표--%>
		var upperCodeKey2 = upperKey2.charCodeAt(0);
		var upperCodeKey3 = upperKey3.charCodeAt(0);
		var upperCodeKey4 = upperKey4.charCodeAt(0);
		var upperCodeKey5 = upperKey5.charCodeAt(0);
		
		
<%--노트 출력 관련--%>
		var totalNoteLine = new Array();
		
		<c:forEach items='${lines }' var='totalLine'> <%--자바스크립트에서 c태그 forEach 사용법--%>
			totalNoteLine.push('${totalLine}');			 <%--자바에서 넘겨온 데이터를 받는 과정--%>
		</c:forEach>
		
			
		
		var datalist1 = totalNoteLine[0]; <%--토탈에 있는 인덱스별로 라인 데이터에 넘김--%>
		var list1 = new Array();
		
		for(var k=0; k<datalist1.length; k++){
			if(datalist1[k] == 'o' || datalist1[k] == 'x'){ <%--배열의 인덱스 값이 []나 ,까지 있기 때문에 o나 x일 때만 따로 저장함--%>
				list1.push(datalist1[k]);
			}
		}
		
		var datalist2 = totalNoteLine[1];
		var list2 = new Array();
		
		for(var k=0; k<datalist2.length; k++){
			if(datalist2[k] == 'o' || datalist2[k] == 'x'){ 
				list2.push(datalist2[k]);
			}
		}
		
		var datalist3 = totalNoteLine[2];
		var list3 = new Array();
		
		for(var k=0; k<datalist3.length; k++){
			if(datalist3[k] == 'o' || datalist3[k] == 'x'){ 
				list3.push(datalist3[k]);
			}
		}
		
		var datalist4 = totalNoteLine[3];
		var list4 = new Array();
		
		for(var k=0; k<datalist4.length; k++){
			if(datalist4[k] == 'o' || datalist4[k] == 'x'){ 
				list4.push(datalist4[k]);
			}
		}
		
		var datalist5 = totalNoteLine[4];
		var list5 = new Array();
		
		for(var k=0; k<datalist5.length; k++){
			if(datalist5[k] == 'o' || datalist5[k] == 'x'){ 
				list5.push(datalist5[k]);
			}
		}
		
<%--캔버스--%>
		var canvas = document.getElementById('canvas');
		var ctx = canvas.getContext('2d');
		var comboRange = new Image();
		var imgBack = new Image();
		var note1 = new Image();
		var note2 = new Image();
		var lineBeam = new Image();
		var lineBack = new Image();
		var lineBottom = new Image();
		var firstBottom = new Image();
		comboRange.src = 'resources/images/comboRange.png';
		imgBack.src = 'resources/images/' + imgName + '';
		note1.src = 'resources/images/note1.png';
		note2.src = 'resources/images/note2.png';
		lineBeam.src = 'resources/images/lineBeam.png';
		lineBack.src = 'resources/images/lineBack.png';
		lineBottom.src = 'resources/images/lineBottom.png';
		firstBottom.src = 'resources/images/firstBottom.png';
		
		var bpm = parseFloat('${BPM }');
		var speed = parseFloat('${frontSpeed }');
		var divineBpm = parseFloat(bpm / 60);
		var divineSpeed = parseFloat(speed / 0.004);
		var bpmCalculation = parseFloat(62.5 / divineBpm / 12 * speed);
		var time = bpmCalculation / divineSpeed * 1000;
		var clearCheck = false;
		
		var pressCheck1 = 0;
		var pressCheck2 = 0;
		var pressCheck3 = 0;
		var pressCheck4 = 0;
		var pressCheck5 = 0;
		
// 		function perfect(pcount) {
// 			ctx.clearRect(650,300,250,50);
// 			ctx.font = '30px Gulim';
// 			ctx.fillText('Perfect ' + pcount,750,300);
			
// 			ctx.clearRect(650,500,250,50);
// 			ctx.fillText('Score ' + scoreCount,750,500);
// 		}
		
// 		function cool(ccount) {
// 			ctx.clearRect(650,350,250,50);
// 			ctx.font = '30px Gulim';
// 			ctx.fillText('Cool ' + ccount,750,350);
			
// 			ctx.clearRect(650,500,250,50);
// 			ctx.fillText('Score ' + scoreCount,750,500);
// 		}
		
// 		function good(gcount) {
// 			ctx.clearRect(650,400,250,50);
// 			ctx.font = '30px Gulim';
// 			ctx.fillText('Good ' + gcount,750,400);
			
// 			ctx.clearRect(650,500,250,50);
// 			ctx.fillText('Score ' + scoreCount,750,500);
// 		}
		
// 		function miss(mcount) {
// 			ctx.clearRect(650,450,250,50);
// 			ctx.font = '30px Gulim';
// 			ctx.fillText('Miss ' + mcount,750,450);
			
// 			ctx.clearRect(650,500,250,50);
// 			ctx.fillText('Score ' + scoreCount,750,500);
// 		}
		
		var comboCount = 0;
		var scoreCount = 0;
		
		var perfectCount = 0;
		var coolCount = 0;
		var goodCount = 0;
		var missCount = 0;
		
		var loc1 = new Array(); <%--노트 위치를 파악하기 위한 변수--%>
		var loc2 = new Array();
		var loc3 = new Array();
		var loc4 = new Array();
		var loc5 = new Array();
		var noteLocation = parseFloat(350 - speed * 500); <%--처음은 노트가 보이기 시작하는 위치, 나중엔 떨구기 위한 변수--%>
		
		ctx.textBaseline = 'top';
		ctx.textAlign = 'center';
		
		var judgePerfectCheck = false;
		var judgeCoolCheck = false;
		var judgeGoodCheck = false;
		var judgeMissCheck = false;
		
		var keyContinueBlock1 = 0;
		var keyContinueBlock2 = 0;
		var keyContinueBlock3 = 0;
		var keyContinueBlock4 = 0;
		var keyContinueBlock5 = 0;
		
		
		var pRange = 492 - 20 * speed;
		var cRange = pRange - 23 * speed;
		var gRange = cRange - 27 * speed;
		
		
		function drop() {
			ctx.fillRect(0,0,70,500); //배경 지우기
			ctx.fillRect(73,0,70,500);
			ctx.fillRect(146,0,70,500);
			ctx.fillRect(219,0,70,500);
			ctx.fillRect(292,0,70,500);
			
			if(comboCount != 0){ //콤보가 0이 아닐 때
				ctx.drawImage(comboRange, -1,130);
				ctx.lineWidth = 2;
				ctx.strokeStyle = 'gray';
				ctx.fillStyle = 'white';
				ctx.font = '70px Gulim';
				ctx.fillText(comboCount,181,130); //콤보 그리기
				ctx.strokeText(comboCount,181,130);
				
				if(judgePerfectCheck == true){
					ctx.font = '35px Gulim';
					ctx.strokeStyle = 'skyblue';
					ctx.fillStyle = 'white';
					ctx.drawImage(firstBottom,-1,430);
					ctx.fillText('Perfect', 181, 430); //퍼펙판정 그리기
					ctx.strokeText('Perfect', 181, 430);
					ctx.stroke();
				
				}else if(judgeCoolCheck == true){
					ctx.font = '35px Gulim';
					ctx.strokeStyle = 'yellow';
					ctx.fillStyle = 'white';
					ctx.drawImage(firstBottom,-1,430);
					ctx.fillText('Cool', 181, 430); //쿨판정 그리기
					ctx.strokeText('Cool', 181, 430);
					ctx.stroke();
				
				}else if(judgeGoodCheck == true){
					ctx.font = '35px Gulim';
					ctx.strokeStyle = 'pink';
					ctx.fillStyle = 'white';
					ctx.drawImage(firstBottom,-1,430);
					ctx.fillText('Good', 181, 430); //굿판정 그리기
					ctx.strokeText('Good', 181, 430);
					ctx.stroke();
				}
				
			}else{ //콤보가 끊길 때나 처음 시작
				if(judgeMissCheck == true){
					ctx.font = '35px Gulim';
					ctx.strokeStyle = 'red';
					ctx.fillStyle = 'white';
					ctx.drawImage(firstBottom,-1,430);
					ctx.fillText('Miss', 181, 430);
					ctx.strokeText('Miss', 181, 430);
					ctx.stroke();
				}
			}
			
			if(noteLocation <= 400){
				ctx.drawImage(lineBottom,0,500);
			}
			
			if(keyConfig1){ //true이면 : 해당 키를 누른 상태이면
				ctx.drawImage(lineBeam, 0, 200); //빔 영역 출력
			}
			if(keyConfig2){
				ctx.drawImage(lineBeam, 73, 200);
			}
			if(keyConfig3){
				ctx.drawImage(lineBeam, 146, 200);
			}
			if(keyConfig4){
				ctx.drawImage(lineBeam, 219, 200);
			}
			if(keyConfig5){
				ctx.drawImage(lineBeam, 292, 200);
			}
			
			ctx.fillStyle = 'black';
			
			var noteGap = 0; //노트 간격을 위한 변수 : bpm별 노트 간격
			for(var i = 0; i < list1.length; i++){

				if(noteLocation - noteGap < 0){
					break; //노트 그려지는 위치가 캔버스 범위 밖이면 안그림
				}
				
				if(list1[i] == 'o'){
					ctx.drawImage(note1, 0, noteLocation - noteGap);
					////////////////
					//모든 노트는 동시에 떨어짐
					//노트를 쳤을 때 없어지게 하려면
					//일단 키보드 연속입력을 막고 노트를 치고 나서 배열의 값을 x로 바꾼다
					loc1[i] = noteLocation - noteGap;
 					
					if(keyConfig1 && pressCheck1 == 1){
						keyContinueBlock1++;
						
						if(keyContinueBlock1 == 1){
							
							if(loc1[i] >= pRange && loc1[i] <= 520){ //1배속 기준, 절대판정 492
								list1[i] = 'x';
								comboCount++;
								perfectCount++;
// 								perfect(perfectCount);
								judgePerfectCheck = true;
								judgeCoolCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 100;
								
							}else if(loc1[i] >= cRange && loc1[i] < pRange
									|| loc1[i] > 520 && loc1[i] <= 540){
								list1[i] = 'x';
								comboCount++;
								coolCount++;
// 								cool(coolCount);
								judgeCoolCheck = true;
								judgePerfectCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 70;
								
							}else if(loc1[i] >= gRange && loc1[i] < cRange
									|| loc1[i] > 540 && loc1[i] <= 560){
								list1[i] = 'x';
								comboCount++;
								goodCount++;
// 								good(goodCount);
								judgeGoodCheck = true;
								judgePerfectCheck = false;
								judgeCoolCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 50;
							}
						
						}
					}
					if(loc1[i] > 580){
						list1[i] = 'x';
						comboCount = 0;
						missCount++;
// 						miss(missCount);
						judgeMissCheck = true;
						judgePerfectCheck = false;
						judgeCoolCheck = false;
						judgeGoodCheck = false;
					}
						
				}
				
				
				if(list2[i] == 'o'){
					ctx.drawImage(note2, 73, noteLocation - noteGap);
					loc2[i] = noteLocation - noteGap;
					
					if(keyConfig2 && pressCheck2 == 1){
						keyContinueBlock2++;
						
						if(keyContinueBlock2 == 1){
							
							if(loc2[i] >= 492 - 20 * speed && loc2[i] <= 520){ //1배속 기준, 절대판정 492
								list2[i] = 'x';
								comboCount++;
								perfectCount++;
// 								perfect(perfectCount);
								judgePerfectCheck = true;
								judgeCoolCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 100;
							
							}else if(loc2[i] >= 492 - 43 * speed && loc2[i] < 492 - 20 * speed
									|| loc2[i] > 520 && loc2[i] <= 540){
								list2[i] = 'x';
								comboCount++;
								coolCount++;
// 								cool(coolCount);
								judgeCoolCheck = true;
								judgePerfectCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 70;
							
							}else if(loc2[i] >= 492 - 70 * speed && loc2[i] < 492 - 43 * speed
									|| loc2[i] > 540 && loc2[i] <= 560){
								list2[i] = 'x';
								comboCount++;
								goodCount++;
// 								good(goodCount);
								judgeGoodCheck = true;
								judgePerfectCheck = false;
								judgeCoolCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 50;
							
							}
						
						}
					}
					
					if(loc2[i] > 580){
						list2[i] = 'x';
						comboCount = 0;
						missCount++;
// 						miss(missCount);
						judgeMissCheck = true;
						judgePerfectCheck = false;
						judgeCoolCheck = false;
						judgeGoodCheck = false;
					}
				}
				
				
				
				if(list3[i] == 'o'){
					ctx.drawImage(note1, 146, noteLocation - noteGap);
					loc3[i] = noteLocation - noteGap;
					
					if(keyConfig3 && pressCheck3 == 1){
						keyContinueBlock3++;
						
						if(keyContinueBlock3 == 1){
						
							if(loc3[i] >= 492 - 20 * speed && loc3[i] <= 520){ //1배속 기준, 절대판정 492
								list3[i] = 'x';
								comboCount++;
								perfectCount++;
// 								perfect(perfectCount);
								judgePerfectCheck = true;
								judgeCoolCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 100;
							
							}else if(loc3[i] >= 492 - 43 * speed && loc3[i] < 492 - 20 * speed
									|| loc3[i] > 520 && loc3[i] <= 540){
								list3[i] = 'x';
								comboCount++;
								coolCount++;
// 								cool(coolCount);
								judgeCoolCheck = true;
								judgePerfectCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 70;
							
							}else if(loc3[i] >= 492 - 70 * speed && loc3[i] < 492 - 43 * speed
									|| loc3[i] > 540 && loc3[i] <= 560){
								list3[i] = 'x';
								comboCount++;
								goodCount++;
// 								good(goodCount);
								judgeGoodCheck = true;
								judgePerfectCheck = false;
								judgeCoolCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 50;
							
							}
						
						}
					}
						
					if(loc3[i] > 580){
						list3[i] = 'x';
						comboCount = 0;
						missCount++;
// 						miss(missCount);
						judgeMissCheck = true;
						judgePerfectCheck = false;
						judgeCoolCheck = false;
						judgeGoodCheck = false;
					}
				}
				
				
				
				if(list4[i] == 'o'){
					ctx.drawImage(note2, 219, noteLocation - noteGap);
					loc4[i] = noteLocation - noteGap;
					
					if(keyConfig4 && pressCheck4 == 1){
						keyContinueBlock4++;
						
						if(keyContinueBlock4 == 1){
						
							if(loc4[i] >= 492 - 20 * speed && loc4[i] <= 520){ //1배속 기준, 절대판정 492
								list4[i] = 'x';
								comboCount++;
								perfectCount++;
// 								perfect(perfectCount);
								judgePerfectCheck = true;
								judgeCoolCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 100;
							
							}else if(loc4[i] >= 492 - 43 * speed && loc4[i] < 492 - 20 * speed
									|| loc4[i] > 520 && loc4[i] <= 540){
								list4[i] = 'x';
								comboCount++;
								coolCount++;
// 								cool(coolCount);
								judgeCoolCheck = true;
								judgePerfectCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 70;
							
							}else if(loc4[i] >= 492 - 70 * speed && loc4[i] < 492 - 43 * speed
									|| loc4[i] > 540 && loc4[i] <= 560){
								list4[i] = 'x';
								comboCount++;
								goodCount++;
// 								good(goodCount);
								judgeGoodCheck = true;
								judgePerfectCheck = false;
								judgeCoolCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 50;
							
							}
						
						}
					}
					
					if(loc4[i] > 580){
						list4[i] = 'x';
						comboCount = 0;
						missCount++;
// 						miss(missCount);
						judgeMissCheck = true;
						judgePerfectCheck = false;
						judgeCoolCheck = false;
						judgeGoodCheck = false;
					}
				
				}
				
				
				
				if(list5[i] == 'o'){
					ctx.drawImage(note1, 292, noteLocation - noteGap);
					loc5[i] = noteLocation - noteGap;
					
					if(keyConfig5 && pressCheck5 == 1){
						keyContinueBlock5++;
						
						if(keyContinueBlock5 == 1){
						
							if(loc5[i] >= 492 - 20 * speed && loc5[i] <= 520){ //1배속 기준, 절대판정 492
								list5[i] = 'x';
								comboCount++;
								perfectCount++;
// 								perfect(perfectCount);
								judgePerfectCheck = true;
								judgeCoolCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 100;
							
							}else if(loc5[i] >= 492 - 43 * speed && loc5[i] < 492 - 20 * speed
									|| loc5[i] > 520 && loc5[i] <= 540){
								list5[i] = 'x';
								comboCount++;
								coolCount++;
// 								cool(coolCount);
								judgeCoolCheck = true;
								judgePerfectCheck = false;
								judgeGoodCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 70;
							
							}else if(loc5[i] >= 492 - 70 * speed && loc5[i] < 492 - 43 * speed
									|| loc5[i] > 540 && loc5[i] <= 560){
								list5[i] = 'x';
								comboCount++;
								goodCount++;
// 								good(goodCount);
								judgeGoodCheck = true;
								judgePerfectCheck = false;
								judgeCoolCheck = false;
								judgeMissCheck = false;
								
								scoreCount += 50;
							
							}
						
						}
					}
						
					if(loc5[i] > 580){
						list5[i] = 'x';
						comboCount = 0;
						missCount++;
// 						miss(missCount);
						judgeMissCheck = true;
						judgePerfectCheck = false;
						judgeCoolCheck = false;
						judgeGoodCheck = false;
					}
				}
				
				noteGap += bpmCalculation;
				
			}//for
			
//////////////////////////////////
//////////////////////////////////
			noteLocation += speed * 4.168; //배속 역할을 할 부분
			
			if(noteLocation > 400){
				ctx.drawImage(lineBottom,0,500); //다 떨어지면 노트 삭제 - 사실 배경을 덮어 씌움
			}
			
				
			//마지막 노트가 없으면 노트 수가 나올 만큼의 시간 + 4 / speed + 1초 뒤에 종료(192비트)
			if(list1[list1.length-1] == 'x'){
				setTimeout(clear, time*list1.length + 4000 / speed + 1000);
			}
			
			if(!clearCheck){
				window.requestAnimationFrame(drop);
			}else{
			    cancelAnimationFrame(RAF);
			}
			
		}//drop()
		
<%--onload--%>
		firstBottom.onload = function(){
			drawBackground();
		}
<%--/onload--%>	
		
		function drawBackground() {
			ctx.drawImage(lineBottom,0,500);
			ctx.drawImage(lineBack,0,0);
			ctx.fillStyle = 'white';
			ctx.fillRect(362,0,3,630);
			setTimeout('ready()', 1000);
		}
		
		var fadeCheck = 0;
		var globalAlphaNum = 0;
		var x = 0;
		
		function ready() {
			readyAF = window.requestAnimationFrame(readyMark);
			ctx.lineWidth = 2;
			ctx.strokeStyle = 'skyblue';
			ctx.fillStyle = 'white';
			ctx.font = '40px Gulim';
		}
		
		function readyMark() {
			ctx.globalAlpha = globalAlphaNum;
			
			if(fadeCheck == 0){
				ctx.globalAlpha = 1;
				ctx.drawImage(firstBottom,-1,430);
				
				ctx.globalAlpha = globalAlphaNum;
				ctx.fillText('Ready', 181, 430);
				ctx.strokeText('Ready', 181, 430);
				ctx.stroke();
				x += 2;
				globalAlphaNum = x / 100;
				
				if(globalAlphaNum == 2){
					fadeCheck = 1;
				}
				
			}else if(fadeCheck == 1){
				ctx.globalAlpha = 1;
				ctx.drawImage(firstBottom,-1,430);
				
				ctx.globalAlpha = globalAlphaNum;
				ctx.fillText('Ready', 181, 430);
				ctx.strokeText('Ready', 181, 430);
				ctx.stroke();
				x -= 2;
				globalAlphaNum = x / 100;
				
				if(globalAlphaNum == -0.02){
					cancelAnimationFrame(readyAF);
					ctx.globalAlpha = 1;
					ctx.drawImage(firstBottom,-1,430);
					setTimeout('start()', 1000);
				}
			}
			
			if(globalAlphaNum != -0.02){ //애니메이션 프레임이 종료되면 더 이상 돌지 않음
				window.requestAnimationFrame(readyMark);
			}
			
		}//readyMark()
		
		function start() {
			RAF = window.requestAnimationFrame(drop);
			
			if(bmsName == 'LaplaceNormal' || bmsName == 'LaplaceHard'){
				setTimeout('mp3play()', 3200); //laplace
				
			}else if(bmsName == 'EleganteEasy'){
				setTimeout('mp3play()', 3650); //elegante
				
			}else if(bmsName == 'HerMajestyEasy'){
				setTimeout('mp3play()', 2850); //her majesty
			
			}else if(bmsName == 'RageAgainstUsualEasy'){
				setTimeout('mp3play()', 1850); //rage
			}
			
			ctx.drawImage(imgBack,400,100);
			
			document.onkeypress = keypress; <%--그냥 페이지에서 사용 가능--%>
			document.onkeyup = keyup;
		}
		
		function clear() {
			clearCheck = true;
			setTimeout(nextPage, 3000);
		}
		
		function nextPage() {
			var form = document.createElement('form');
			var input1 = document.createElement('input');
			var input2 = document.createElement('input');
			var input3 = document.createElement('input');
			var input4 = document.createElement('input');
			var input5 = document.createElement('input');
			var input6 = document.createElement('input');
			
			form.action = 'resultPage';
			form.method = 'post';
			
			input1.type = 'hidden';
			input1.value = perfectCount;
			input1.name = 'perfectCount';
			
			input2.type = 'hidden';
			input2.value = coolCount;
			input2.name = 'coolCount';
			
			input3.type = 'hidden';
			input3.value = goodCount;
			input3.name = 'goodCount';
			
			input4.type = 'hidden';
			input4.value = missCount;
			input4.name = 'missCount';
			
			input5.type = 'hidden';
			input5.value = scoreCount;
			input5.name = 'scoreCount';
			
			input6.type = 'hidden';
			input6.value = bmsName;
			input6.name = 'musictitledif';
			
			form.appendChild(input1);
			form.appendChild(input2);
			form.appendChild(input3);
			form.appendChild(input4);
			form.appendChild(input5);
			form.appendChild(input6);
			
			document.body.appendChild(form);
			form.submit();

		}
		
		var keyConfig1 = false;
		var keyConfig2 = false;
		var keyConfig3 = false;
		var keyConfig4 = false;
		var keyConfig5 = false;
		
		function keypress() {
			if(event.keyCode == upperCodeKey1 || event.keyCode == lowerCodeKey1){
				keyConfig1 = true;
				pressCheck1++;
			}
			if(event.keyCode == upperCodeKey2 || event.keyCode == lowerCodeKey2){
				keyConfig2 = true;
				pressCheck2++;
			}
			if(event.keyCode == upperCodeKey3 || event.keyCode == lowerCodeKey3){
				keyConfig3 = true;
				pressCheck3++;
			}
			if(event.keyCode == upperCodeKey4 || event.keyCode == lowerCodeKey4){
				keyConfig4 = true;
				pressCheck4++;
			}
			if(event.keyCode == upperCodeKey5 || event.keyCode == lowerCodeKey5){
				keyConfig5 = true;
				pressCheck5++;
			}
		}
		
		function keyup() {
			if(event.keyCode == upperCodeKey1 || event.keyCode == lowerCodeKey1){
				keyConfig1 = false;
				ctx.fillRect(0, 400, 70, 100);
				pressCheck1 = 0;
				keyContinueBlock1 = 0;
			}
			if(event.keyCode == upperCodeKey2 || event.keyCode == lowerCodeKey2){
				keyConfig2 = false;
				ctx.fillRect(73, 400, 70, 100);
				pressCheck2 = 0;
				keyContinueBlock2 = 0;
			}
			if(event.keyCode == upperCodeKey3 || event.keyCode == lowerCodeKey3){
				keyConfig3 = false;
				ctx.fillRect(146, 400, 70, 100);
				pressCheck3 = 0;
				keyContinueBlock3 = 0;
			}
			if(event.keyCode == upperCodeKey4 || event.keyCode == lowerCodeKey4){
				keyConfig4 = false;
				ctx.fillRect(219, 400, 70, 100);
				pressCheck4 = 0;
				keyContinueBlock4 = 0;
			}
			if(event.keyCode == upperCodeKey5 || event.keyCode == lowerCodeKey5){
				keyConfig5 = false;
				ctx.fillRect(292, 400, 70, 100);
				pressCheck5 = 0;
				keyContinueBlock5 = 0;
			}
		}
		
	</script>
</html>