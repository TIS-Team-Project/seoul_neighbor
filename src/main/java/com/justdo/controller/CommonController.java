package com.justdo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.MemberVO;
import com.justdo.service.commonService;
import com.justdo.util.JoinValidator;

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
	@PostMapping("login")
	public String login(Model model,MemberVO vo,RedirectAttributes rttr) {
	
		try { 
			vo = service.login(vo);
			rttr.addFlashAttribute("userid",vo.getUserid());
			return "redirect:/board/list";
		}catch(Exception e) {
		  rttr.addFlashAttribute("result","fail");
		  return"redirect:/"; 
		  }
	}
	// 로그인 //	
	
	//회원가입 페이지 호출
		@GetMapping("join")
		public String joinForm() {
			System.out.println("회원가입페이지로 이동합니다.");
			return "joinpage/join";
		}
		
		//회원가입 진행
		@PostMapping("/join")
		public String join(MemberVO vo, BindingResult result, RedirectAttributes rttr) {
			System.out.println("회원가입 처리 서비스를 호출합니다.");
			System.out.println("받은 회원 정보 : " + vo.toString());
			
			boolean isDuplicated = 
					service.isUniqueID(vo.getUserid()) && service.isUniqueNickName(vo.getNickname());
			System.out.println(isDuplicated);
			
			try {
				if(!isDuplicated) {
					System.out.println("아이디 or 닉네임 뭔가가 중복되었다");
					rttr.addFlashAttribute("warning", "회원가입에 실패하였습니다.");
					return "redirect:/join";
				} else {
					JoinValidator validator = new JoinValidator();
					validator.validate(vo, result);
					if(result.hasErrors()) {
						System.out.println("유호성검사 실패");
						rttr.addFlashAttribute("warning", "당신은 거절당했습니다. 가입불가");
						return "redirect:/join";
					}
				}
				String encodedPassword = pwdEncoder.encode(vo.getUserpw());
				vo.setUserpw(encodedPassword);
				service.join(vo);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			return "redirect:/";
		}
}
