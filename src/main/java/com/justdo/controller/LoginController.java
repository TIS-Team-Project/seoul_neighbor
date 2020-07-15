package com.justdo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.justdo.security.CustomUser;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class LoginController {
	
	// 로그인 페이지로 이동 //////////////////////////////////
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	// 로그인 페이지로 이동 //
	
	// 로그인 성공 - 목록 이동 //////////////////////////////////
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, HttpServletRequest request) {
		log.warn("login controller - 로그인 > 목록 페이지로 접속");
		return "board/list";
	}
	// 로그인 성공 - 목록 이동 //

}
