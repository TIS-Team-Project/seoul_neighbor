package com.justdo.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	public LoginSuccessHandler() {}
	
	private CustomUserDetailsService loginService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
	
		log.warn("loginhandler - 로그인 성공");
		
		List<String> roleNames = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		}); // 권한 목록 받아옴
		
		log.warn("loginhandler - 역할 이름 : " +roleNames);
		
		// 지역 정보 받아옴
		String username = authentication.getName();
		log.warn("loginhandler - 로그인한 아이디 이름  : " +username);		
		String gu = loginService.loadLocationByUsername(username);
		log.warn("loginhandler - 아이디에서 설정한 지역 이름  : " +gu);		
		
		if (roleNames.contains("ROLE_USER")) {
			response.sendRedirect("board/list?gu="+gu);
			return;
		}
		response.sendRedirect("/"); // 권한 없을시 메인 페이지로 이동
	}
}
