package org.jsp.project;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GameControl {
	
	@ResponseBody
	@RequestMapping(value = "/preCanvas", method = RequestMethod.GET)
	public ArrayList<String> preCanvas(String musicName, Model model) {
		String bmsFileName = "";
		String BPM = "";
		String imageName = "";
		
		if(musicName.equals("Elegante")) {
			bmsFileName = "EleganteEasy";
			BPM = "133";
			imageName = "eleganteback.jpg";
		
		}else if(musicName.equals("Laplace") || musicName.equals("Laplace - Hard")){
			
			if(musicName.equals("Laplace")) {
				bmsFileName = "LaplaceNormal";
			
			}else if(musicName.equals("Laplace - Hard")) {
				bmsFileName = "LaplaceHard";
			}
			
			BPM = "155";
			imageName = "laplaceback.jpg";
		
		}else if(musicName.equals("Her Majesty")){
			bmsFileName = "HerMajestyEasy";
			BPM = "111";
			imageName = "hermajestyback.jpg";
		
		}else if(musicName.equals("Rage Against Usual")){
			bmsFileName = "RageAgainstUsualEasy";
			BPM = "152";
			imageName = "rage.png";
		}
		//else if 로 음악마다 추가
		
		ArrayList<String> musicInfo = new ArrayList<>();
		musicInfo.add(bmsFileName);
		musicInfo.add(BPM);
		musicInfo.add(imageName);
		
		return musicInfo;
	}
	
	@RequestMapping("/canvas")
	public String canvas(String bpm, String speed , Model model, String option, 
						String keyone, String keytwo, String keythree,
						String keyfour, String keyfive, String bmsFileName,
						String imageName ,HttpSession session) {
		
		String line;
		int count = 0;
		int lineNumber = 0;
		int numCountSC = 0; //공백인 라인을 확인하기 위한 변수
		int numCount1 = 0; //공백인 라인에 x를 채워넣기 위한 변수
		int numCount2 = 0;
		int numCount3 = 0;
		int numCount4 = 0;
		int numCount5 = 0;
		
		ArrayList<String> noteLineSC = new ArrayList<>(); //SC
		ArrayList<String> noteLine1 = new ArrayList<>(); //1번줄
		ArrayList<String> noteLine2 = new ArrayList<>(); //2번줄
		ArrayList<String> noteLine3 = new ArrayList<>(); //3번줄
		ArrayList<String> noteLine4 = new ArrayList<>(); //4번줄
		ArrayList<String> noteLine5 = new ArrayList<>(); //5번줄
		
		BufferedReader in = null;
		
		try { //regret, Laplace5key, LaplaceNormal
			in = new BufferedReader(new FileReader(
				"C:\\Spring\\SpringWorkspace\\personalProject\\src\\main\\resources\\bms\\" + bmsFileName + ".bms")
					);
			
			while ( (line = in.readLine()) != null) {
				
				if(line.startsWith("#GENRE")) {
					String genre = line.substring(7);
					model.addAttribute("genre", genre);
				}
				if(line.startsWith("#TITLE")) {
					String title = line.substring(7);
					model.addAttribute("title", title);
				}
				if(line.startsWith("#ARTIST")) {
					String artist = line.substring(8);
					model.addAttribute("artist", artist);
				}
				if(line.startsWith("#BPM")) {
					String bpmInfo = line.substring(5);
					model.addAttribute("bpm", bpmInfo);
				}
				if(line.startsWith("#PLAYLEVEL")) {
					String playLevel = line.substring(11);
					model.addAttribute("playLevel", playLevel);
				}
				if(line.startsWith("#WAVYY")) {
					String mp3File = line.substring(7);
					model.addAttribute("mp3File", mp3File);
				}
				
				
				
				if(lineNumber > 23) { //MAIN DATA FIELD 노트 정보
					String cnt = Integer.toString(count);
					String c = "";
					
					if(count <= 9) { //마디 수 : 0 ~ 9
						c = "#00" + cnt;
						
					}else if(count <= 99) { //마디 수 : 10 ~ 99
						c = "#0" + cnt;
						
					}else { //마디 수 : 100 ~
						c = "#" + cnt;
						
					}
					
					
					if(count <= 9) { //마디 수 : 0 ~ 9
						if(line.equals("")) { //메모장 라인이 빈칸이면
							
							if(numCountSC != numCount1) { //sc의 값과 라인의 값이 다르면
								numCount1++;			  //라인 번호를 하나 증가 시키고
								
								for(int z=0; z<192; z++) {
									noteLine1.add("x");		//라인에 x를 192개 채움
								}
							}
							if(numCountSC != numCount2) {
								numCount2++;
								
								for(int z=0; z<192; z++) {
									noteLine2.add("x");
								}
							}
							if(numCountSC != numCount3) {
								numCount3++;
								
								for(int z=0; z<192; z++) {
									noteLine3.add("x");
								}
							}
							if(numCountSC != numCount4) {
								numCount4++;
								
								for(int z=0; z<192; z++) {
									noteLine4.add("x");
								}
							}
							if(numCountSC != numCount5) {
								numCount5++;
								
								for(int z=0; z<192; z++) {
									noteLine5.add("x");
								}
							}
							
							count++;	//마디 수 증가
							cnt = Integer.toString(count);
							if(count <= 9) {
								c = "#00" + cnt;
							}else {			//9에서 10이 될 때 여기 걸림
								c = "#0" + cnt;
							}
						}
					}else if(count <= 99) { //마디 수 : 10 ~ 99
						if(line.equals("")) { //메모장 라인이 빈칸이면
							
							if(numCountSC != numCount1) { //sc의 값과 라인의 값이 다르면
								numCount1++;			  //라인 번호를 하나 증가 시키고
								
								for(int z=0; z<192; z++) {
									noteLine1.add("x");		//라인에 x를 192개 채움
								}
							}
							if(numCountSC != numCount2) {
								numCount2++;
								
								for(int z=0; z<192; z++) {
									noteLine2.add("x");
								}
							}
							if(numCountSC != numCount3) {
								numCount3++;
								
								for(int z=0; z<192; z++) {
									noteLine3.add("x");
								}
							}
							if(numCountSC != numCount4) {
								numCount4++;
								
								for(int z=0; z<192; z++) {
									noteLine4.add("x");
								}
							}
							if(numCountSC != numCount5) {
								numCount5++;
								
								for(int z=0; z<192; z++) {
									noteLine5.add("x");
								}
							}
							
							count++;	//마디 수 증가
							cnt = Integer.toString(count);
							if(count <= 9) {
								c = "#0" + cnt;
							}else {			//99에서 100이 될 때 여기 걸림
								c = "#" + cnt;
							}
						}
					}else { //마디 수 : 100 ~
						if(line.equals("")) { //메모장 라인이 빈칸이면
							
							if(numCountSC != numCount1) { //sc의 값과 라인의 값이 다르면
								numCount1++;			  //라인 번호를 하나 증가 시키고
								
								for(int z=0; z<192; z++) {
									noteLine1.add("x");		//라인에 x를 192개 채움
								}
							}
							if(numCountSC != numCount2) {
								numCount2++;
								
								for(int z=0; z<192; z++) {
									noteLine2.add("x");
								}
							}
							if(numCountSC != numCount3) {
								numCount3++;
								
								for(int z=0; z<192; z++) {
									noteLine3.add("x");
								}
							}
							if(numCountSC != numCount4) {
								numCount4++;
								
								for(int z=0; z<192; z++) {
									noteLine4.add("x");
								}
							}
							if(numCountSC != numCount5) {
								numCount5++;
								
								for(int z=0; z<192; z++) {
									noteLine5.add("x");
								}
							}
							
							count++;	//마디 수 증가
							cnt = Integer.toString(count);
							c = "#" + cnt;
						}
					}
					
					if(line.startsWith(c)) {	//마디번호 구분
/////////////////// SC					
						if(line.substring(4, 6).equals("16")) {	//마디의 라인 구분, SC
							numCountSC++;
							
							String arraySC = line.substring(7);
								if(arraySC.length() == 2) {		//라인의 비트 구분
									
									noteLineSC.add("o");//일단 하나 등록
									for(int iSCn=1; iSCn<192; iSCn++) {
										noteLineSC.add("x"); //나머지
									}
									
								}else if(arraySC.length() == 6) { //3비트
									
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<64; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<64; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 8) { //4비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<48; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<48; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 12) { //6비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<32; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<32; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 16) { //8비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<24; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<24; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 24) { //12비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<16; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<16; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 32) { //16비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<12; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<12; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 48) { //24비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<8; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<8; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 64) { //32비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<6; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<6; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 96) { //48비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<4; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<4; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}else if(arraySC.length() == 128) { //64비트
									for(int i=0; i<arraySC.length(); i+=2) {
										if(arraySC.substring(i, i+1).equals("X")) {
											noteLineSC.add("o");
											for(int i13=1; i13<3; i13++) {
												noteLineSC.add("x");
											}
										}else {
											noteLineSC.add("x");
											for(int i13=1; i13<3; i13++) {
												noteLineSC.add("x");
											}
										}
									}
									
								}
/////////////////////////// 1번
						}else if(line.substring(4, 6).equals("11")) {	//1번줄
							numCount1++;
							
							String array1 = line.substring(7);
								if(array1.length() == 2) {		//라인의 비트 구분
									
									noteLine1.add("o");//일단 하나 등록
									for(int iSCn=1; iSCn<192; iSCn++) {
										noteLine1.add("x"); //나머지
									}
									
								}else if(array1.length() == 4) { //2비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<96; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<96; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 6) { //3비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<64; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<64; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 8) { //4비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<48; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<48; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 12) { //6비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<32; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<32; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 16) { //8비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<24; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<24; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 24) { //12비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<16; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<16; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 32) { //16비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<12; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<12; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 48) { //24비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<8; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<8; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 64) { //32비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<6; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<6; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 96) { //48비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<4; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<4; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}else if(array1.length() == 128) { //64비트
									for(int i=0; i<array1.length(); i+=2) {
										if(array1.substring(i, i+1).equals("X")) {
											noteLine1.add("o");
											for(int i13=1; i13<3; i13++) {
												noteLine1.add("x");
											}
										}else {
											noteLine1.add("x");
											for(int i13=1; i13<3; i13++) {
												noteLine1.add("x");
											}
										}
									}
									
								}
/////////////////////////// 2번								
						}else if(line.substring(4, 6).equals("12")) { //2번줄
							numCount2++;
							
							String array2 = line.substring(7);
							if(array2.length() == 2) {		//라인의 비트 구분
								
								noteLine2.add("o");//일단 하나 등록
								for(int iSCn=1; iSCn<192; iSCn++) {
									noteLine2.add("x"); //나머지
								}
							
							}else if(array2.length() == 4) { //2비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<96; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<96; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 6) { //3비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<64; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<64; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 8) { //4비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<48; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<48; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 12) { //6비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<32; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<32; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 16) { //8비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<24; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<24; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 24) { //12비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<16; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<16; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 32) { //16비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<12; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<12; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 48) { //24비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<8; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<8; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 64) { //32비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<6; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<6; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 96) { //48비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<4; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<4; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}else if(array2.length() == 128) { //64비트
								for(int i=0; i<array2.length(); i+=2) {
									if(array2.substring(i, i+1).equals("X")) {
										noteLine2.add("o");
										for(int i13=1; i13<3; i13++) {
											noteLine2.add("x");
										}
									}else {
										noteLine2.add("x");
										for(int i13=1; i13<3; i13++) {
											noteLine2.add("x");
										}
									}
								}
								
							}
/////////////////////// 3번							
						}else if(line.substring(4, 6).equals("13")) { //3번줄
							numCount3++;
							
							String array3 = line.substring(7);
							if(array3.length() == 2) {		//라인의 비트 구분
								
								noteLine3.add("o");//일단 하나 등록
								for(int iSCn=1; iSCn<192; iSCn++) {
									noteLine3.add("x"); //나머지
								}
							
							}else if(array3.length() == 4) { //2비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<96; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<96; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 6) { //3비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<64; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<64; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 8) { //4비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<48; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<48; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 12) { //6비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<32; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<32; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 16) { //8비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<24; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<24; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 24) { //12비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<16; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<16; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 32) { //16비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<12; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<12; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 48) { //24비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<8; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<8; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 64) { //32비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<6; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<6; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 96) { //48비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<4; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<4; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}else if(array3.length() == 128) { //64비트
								for(int i=0; i<array3.length(); i+=2) {
									if(array3.substring(i, i+1).equals("X")) {
										noteLine3.add("o");
										for(int i13=1; i13<3; i13++) {
											noteLine3.add("x");
										}
									}else {
										noteLine3.add("x");
										for(int i13=1; i13<3; i13++) {
											noteLine3.add("x");
										}
									}
								}
								
							}
/////////////////////// 4번							
						}else if(line.substring(4, 6).equals("14")) { //4번줄
							numCount4++;
							
							String array4 = line.substring(7);
							if(array4.length() == 2) {		//라인의 비트 구분
								
								noteLine4.add("o");//일단 하나 등록
								for(int iSCn=1; iSCn<192; iSCn++) {
									noteLine4.add("x"); //나머지
								}
								
							}else if(array4.length() == 4) { //2비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<96; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<96; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 6) { //3비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<64; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<64; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 8) { //4비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<48; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<48; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 12) { //6비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<32; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<32; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 16) { //8비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<24; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<24; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 24) { //12비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<16; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<16; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 32) { //16비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<12; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<12; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 48) { //24비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<8; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<8; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 64) { //32비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<6; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<6; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 96) { //48비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<4; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<4; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}else if(array4.length() == 128) { //64비트
								for(int i=0; i<array4.length(); i+=2) {
									if(array4.substring(i, i+1).equals("X")) {
										noteLine4.add("o");
										for(int i13=1; i13<3; i13++) {
											noteLine4.add("x");
										}
									}else {
										noteLine4.add("x");
										for(int i13=1; i13<3; i13++) {
											noteLine4.add("x");
										}
									}
								}
								
							}
/////////////////////// 5번
						}else if(line.substring(4, 6).equals("15")) { //5번줄
							numCount5++;
							
							String array5 = line.substring(7);
							if(array5.length() == 2) {		//라인의 비트 구분
								
								noteLine5.add("o");//일단 하나 등록
								for(int iSCn=1; iSCn<192; iSCn++) {
									noteLine5.add("x"); //나머지
								}
								
							}else if(array5.length() == 4) { //2비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<96; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<96; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 6) { //3비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<64; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<64; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 8) { //4비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<48; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<48; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 12) { //6비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<32; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<32; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 16) { //8비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<24; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<24; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 24) { //12비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<16; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										numCount5++;
										for(int i13=1; i13<16; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 32) { //16비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<12; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<12; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 48) { //24비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<8; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<8; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 64) { //32비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<6; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<6; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 96) { //48비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<4; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<4; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}else if(array5.length() == 128) { //64비트
								for(int i=0; i<array5.length(); i+=2) {
									if(array5.substring(i, i+1).equals("X")) {
										noteLine5.add("o");
										for(int i13=1; i13<3; i13++) {
											noteLine5.add("x");
										}
									}else {
										noteLine5.add("x");
										for(int i13=1; i13<3; i13++) {
											noteLine5.add("x");
										}
									}
								}
								
							}
						}
////////////라인 분석 끝
					}//마디번호 구분
				}//lineNumber
					lineNumber++; //한 줄을 다 읽으면 메모장 라인번호 하나씩 증가
			}
			
//			System.out.println(" SC " + noteLineSC);
//			System.out.println(" 1번 " + noteLine1);
//			System.out.println(" 2번 " + noteLine2);
//			System.out.println(" 3번 " + noteLine3);
//			System.out.println(" 4번 " + noteLine4);
//			System.out.println(" 5번 " + noteLine5);

			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		ArrayList<ArrayList<String>> lines = new ArrayList<>();
		lines.add(noteLine1);
		lines.add(noteLine2);
		lines.add(noteLine3);
		lines.add(noteLine4);
		lines.add(noteLine5);
		
		if(option.equals("1")) { //정배
			model.addAttribute("lines", lines);
			
		}else if(option.equals("2")) { //미러
			Collections.reverse(lines);
			model.addAttribute("lines", lines);
			
		}else if(option.equals("3")) { //랜덤
			Collections.shuffle(lines);
			model.addAttribute("lines", lines);
		}
		
		model.addAttribute("imageName", imageName);
		model.addAttribute("bmsFileName", bmsFileName);
		model.addAttribute("BPM", bpm);
		model.addAttribute("frontSpeed", speed);
		model.addAttribute("keyone", keyone);
		model.addAttribute("keytwo", keytwo);
		model.addAttribute("keythree", keythree);
		model.addAttribute("keyfour", keyfour);
		model.addAttribute("keyfive", keyfive);
		
		if(session.getAttribute("key1") == null) {
			model.addAttribute("key1", "d");
			model.addAttribute("key2", "f");
			model.addAttribute("key3", " ");
			model.addAttribute("key4", "j");
			model.addAttribute("key5", "k");
		}

		return "game/canvas";
	}
	
	@RequestMapping("/updateKey")
	public String updateKey(String ukeyone, String ukeytwo, String ukeythree,
						String ukeyfour, String ukeyfive, HttpSession session) {
		session.removeAttribute("key1");
		session.removeAttribute("key2");
		session.removeAttribute("key3");
		session.removeAttribute("key4");
		session.removeAttribute("key5");
		
		session.setAttribute("key1", ukeyone);
		session.setAttribute("key2", ukeytwo);
		session.setAttribute("key3", ukeythree);
		session.setAttribute("key4", ukeyfour);
		session.setAttribute("key5", ukeyfive);
		
		return "game/keyConfig";
	}
	
	@RequestMapping("/inGame")
	public String inGame() {
		return "game/inGame";
	}
	
	@RequestMapping("/keyConfig")
	public String keyConfig() {
		return "game/keyConfig";
	}
	
	@RequestMapping("/resultPage")
	public String resultPage(String perfectCount, String coolCount,
						String goodCount, String missCount, String scoreCount,
						String musictitledif, Model model) {
		model.addAttribute("perfect", perfectCount);
		model.addAttribute("cool", coolCount);
		model.addAttribute("good", goodCount);
		model.addAttribute("miss", missCount);
		model.addAttribute("score", scoreCount);
		model.addAttribute("musictitledif", musictitledif);
		
		return "game/resultPage";
	}
	
}
