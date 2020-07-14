package com.justdo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.MemberVO;
import com.justdo.service.commonService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class CommonController {
	
	 private commonService service;
	
	// 메인 이동 //////////////////////////////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	// 메인 이동 //
	 
	// 로그인 ////////////////////////////////////
//	@PostMapping("login")
//	public String login(Model model,MemberVO vo,RedirectAttributes rttr) {
//	
//		try { 
//			vo = service.login(vo);
//			rttr.addFlashAttribute("id",vo.getId());
//			return "redirect:/list";
//		}catch(Exception e) {
//		  rttr.addFlashAttribute("result","fail");
//		  return"redirect:/"; 
//		  }
//	}
	// 로그인 //
	
	
	// 목록 페이지 이동 //////////////////////////
	@GetMapping("list")
	public String list() {
		return "board/list";
	};
	// 목록 페이지 이동 //
	
	@GetMapping("join")
	public String join() {
		System.out.println("회원가입페이지로 이동합니다.");
		return "joinpage/join";
	}
	
	@PostMapping("join")
	public void plzJoin(MemberVO vo) {
		System.out.println("회원가입 처리 서비스를 호출합니다.");
		System.out.println("받은 회원 정보 : " + vo.toString());
		service.join(vo);
	}
	
	
	
}
