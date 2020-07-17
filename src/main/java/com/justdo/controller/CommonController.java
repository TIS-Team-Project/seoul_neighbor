package com.justdo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justdo.domain.BoardVO;
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
	 

	
	
	// 목록 페이지 이동 //////////////////////////
	@GetMapping("board/list")
	public String list() {
		return "board/list";
	};
	// 목록 페이지 이동 //
	
	//bno로 상세페이지 부르기   ---이 주석의 오른쪽 설명란은 볼 필요 없음.         board/read 주소 슬래쉬 뒤에 붙는 애들은 이녀석 적용이란 의미 -> httpServletRequest request는 clinet가 주소창에 입력한 요청을 담은 객체로 request.getRequestURI는 클라이언트가 친 주소창이고, 그걸 잘라서 http://localhost:8181/board/read/1의 bno인 1만 따로 bno라는 변수에 저장하고, vo에 bno=1담아서 jsp에 어트리뷰트 속성으로 보내서 jsp는 그 데이터로 클라이언트에게 보여줌/////////////////////
	@GetMapping("board/read/*")
	public String read(Model model, HttpServletRequest request) {
		
		int bno =  Integer.parseInt(request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1));
		   BoardVO vo=service.read(bno);
		      model.addAttribute("board",vo);
		      return "board/read";
	}
	//bno로 상세페이지 부르기  
	
	//좋아요+1 ////////////////////////////////
	@GetMapping(value="/read/plusLike/{bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	   @ResponseBody
	   public ResponseEntity<String> plusLike(@PathVariable("bno") int bno) {
	      
	      String result = Integer.toString(service.likeBoard(bno));
	      return new ResponseEntity<String>(result, HttpStatus.OK);
	   }
	
	//좋아요+1 ////////////////////////////////

	//싫어요+1 ////////////////////////////////
	@GetMapping(value="/read/plusUnlike/{bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	   @ResponseBody
	   public ResponseEntity<String> plusUnlike(@PathVariable("bno") int bno) {
	      
	      String result = Integer.toString(service.unlikeBoard(bno));
	      return new ResponseEntity<String>(result, HttpStatus.OK);
	   }
	//싫어요+1 ////////////////////////////////

}
