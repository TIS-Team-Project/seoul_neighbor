package com.justdo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.justdo.security.CustomUser;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class LoginController {
	
	// 로그인 성공 - 목록 이동 //////////////////////////////////
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, HttpServletRequest request) {

		return "board/list";
	}
	// 로그인 성공 - 목록 이동 //
}
