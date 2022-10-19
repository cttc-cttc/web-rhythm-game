package org.jsp.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		
		//로그인 안했거나 세션 만료된 경우
		if(loginId == null) {
			response.sendRedirect(request.getContextPath() + "/goLoginForm"); //기본 url에 붙임
			return false;
		}

		
		return super.preHandle(request, response, handler);
	}
}
