package org.jsp.project;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.project.dao.MemberDAO;
import org.jsp.project.vo.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberControl {
	
	@Inject
	private MemberDAO dao;
	
	@RequestMapping("/y")
	public String y() {
		return "member/y";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping("/idCheck")
	public String idCheck() {
		return "member/idCheck";
	}
	
	@RequestMapping("/nicnameCheck")
	public String nicnameCheck() {
		return "member/nicnameCheck";
	}
	
	@RequestMapping("/idConfirm")
	public String idConfirm(String id, Model model) {
		
		Member idConfirm = dao.idCheck(id);
		
		int checkNumber = 0;
		
		if(idConfirm == null) { //입력한 아이디가 없으면
			checkNumber = 1;	//사용가능
		}else {					//입력한 아이디가 있으면
			checkNumber = 2;	//사용불가
		}
		
		model.addAttribute("useId", id);
		model.addAttribute("checkNumber", checkNumber);
		
		return "member/idCheck";
	}
	
	@RequestMapping("/nicnameConfirm")
	public String nicnameConfirm(String nicname, Model model) {
		
		Member nicnameConfirm = dao.nicnameCheck(nicname);
		
		int checkNumber = 0;
		
		if(nicnameConfirm == null) { //입력한 닉네임이 없으면
			checkNumber = 1;	//사용가능
		}else {						//입력한 닉네임이 있으면
			checkNumber = 2;	//사용불가
		}
		
		model.addAttribute("useNicname", nicname);
		model.addAttribute("checkNumber", checkNumber);
		
		return "member/nicnameCheck";
	}
	
	@RequestMapping("/join")
	public String join(Member member) {
		dao.insertMember(member);
		
		return "redirect:./";
	}
	
	@RequestMapping("/loginMember")
	public String loginMember(Member member, HttpSession session, Model model) {
		Member login = dao.login(member);
		
		if(login == null) {
			model.addAttribute("loginErr", "로그인 정보가 일치하지 않습니다");
			
			return "home";
		}else {
			session.setAttribute("loginId", login.getId());
			session.setAttribute("loginNicname", login.getNicname());
		}
		return "redirect:./";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("loginNicname");
		
		return "redirect:./";
	}
	
	@RequestMapping("/updateUserInfo")
	public String updateUserInfo() {
		
		return "member/updateUserInfo";
	}
	
	@RequestMapping("/updateUserForm")
	public String updateUserForm(String id, String password, Model model) {
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		Member userInfo = dao.login(member);
	
		if(userInfo == null) {
			model.addAttribute("errMessage", "비밀번호가 일치하지 않습니다");
			return "member/updateUserInfo";
		}else {
			model.addAttribute("userInfo", userInfo);
		}
		
		return "member/updateUserForm";
	}
	
	@RequestMapping("/infoUpdateComplite")
	public String infoUpdateComplite(Member member, HttpSession session) {
		dao.updateMember(member);
		session.removeAttribute("loginNicname");
		session.setAttribute("loginNicname", member.getNicname());
		
		return "redirect:./";
	}
	
	@RequestMapping("/deleteMember")
	public String deleteMember() {
		
		return "member/deletePage";
	}
	
	
	@RequestMapping("/deleteUser")
	public String deleteUser(Member member, Model model, HttpSession session) {
		int deleteCheck = dao.deleteMember(member);
		
		if(deleteCheck == 0) {
			model.addAttribute("errMessage", "비밀번호가 일치하지 않습니다");
			return "member/deletePage";
		}
		
		session.removeAttribute("loginId");
		session.removeAttribute("loginNicname");
		
		return "redirect:./";
	}
	
	@RequestMapping("/goLoginForm") ////로그인 안하고 글쓰려 할 때 인터셉터 걸리면 여기로 옴
	public String goLoginForm() {
		
		return "member/goLoginForm";
	}
	
	@RequestMapping("/anotherLogin") //인터셉터 로그인
	public String writeFormInterceptor(Member member, HttpSession session, Model model) {
		Member login = dao.login(member);
		
		if(login == null) {
			model.addAttribute("loginErr", "로그인 정보가 일치하지 않습니다");
			return "member/goLoginForm";
		}else {
			session.setAttribute("loginId", login.getId());
			session.setAttribute("loginNicname", login.getNicname());
		}
		return "redirect:./";
	}
	
	
}
