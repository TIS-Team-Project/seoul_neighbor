package com.justdo.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justdo.domain.MemberVO;
import com.justdo.service.commonService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/")
@AllArgsConstructor
public class CommonController {
	
	 private commonService service;
	
	// 메인 이동 //////////////////////////////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	// 메인 이동 //
	 
	
	// 목록 페이지 이동 //////////////////////////
	@GetMapping("list")
	public String list() {
		return "board/list";
	};
	// 목록 페이지 이동 //
	
	
	//회원가입 페이지 호출
	@GetMapping("join")
	public String joinForm() {
		System.out.println("회원가입페이지로 이동합니다.");
		return "joinpage/join";
	}
	
	//회원가입 진행
	@PostMapping("join")
	public String join(MemberVO vo) {
		System.out.println("회원가입 처리 서비스를 호출합니다.");
		System.out.println("받은 회원 정보 : " + vo.toString());
		service.join(vo);
		
		return "redirect: index";
	}
	
	//유저 ID 중복됬는지 체크(ajax처리)
	@GetMapping(value="/checkId/{userId}",
			produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> checkUserId(@PathVariable("userId") String userId){
		if(service.isUniqueID(userId)) {
			return new ResponseEntity<String>("new",HttpStatus.OK);
		}
		return new ResponseEntity<String>("duplicated",HttpStatus.OK);
	}
	
	//유저 닉네임 중복됬는지 체크(ajax처리)
	@GetMapping(value="/checkNickName/{nickName}",
			produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> checkNickName(@PathVariable("nickName") String nickName){
		if(service.isUniqueNickName(nickName)) {
			return new ResponseEntity<String>("new",HttpStatus.OK);
		}
		return new ResponseEntity<String>("duplicated",HttpStatus.OK);
	}
	
	
}
