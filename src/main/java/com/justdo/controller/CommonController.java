package com.justdo.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.BoardVO;
import com.justdo.service.commonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


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
	
	//bno로 상세페이지 부르기   ---이 주석의 오른쪽 설명란은 볼 필요 없음.         board/read/*란 주소 board/read슬래쉬 뒤에 붙는 애들은 이녀석 적용이란 의미 -> httpServletRequest request는 clinet가 주소창에 입력한 요청을 담은 객체로 request.getRequestURI는 클라이언트가 친 주소창이고, 그걸 잘라서 http://localhost:8181/board/read/1의 bno인 1만 따로 bno라는 변수에 저장하고, vo에 bno=1담아서 jsp에 어트리뷰트 속성으로 보내서 jsp는 그 데이터로 클라이언트에게 보여줌/////////////////////
	@GetMapping("board/read/*")
	public String read(Model model, HttpServletRequest request) {
		
		
		int bno =  Integer.parseInt(request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1));
		BoardVO vo=service.read(bno);
		
		if(vo != null) {										//client가 주소창에 board/read/3해서 bno가 3짜리인 boardVO를 부르면 bno가 3짜리인 vo 데이터를 받는데 만약 삭제를해서 없다면 데이터가 null인 상세페이지 말고, list 페이지로 보낸다.
		      System.out.println(vo);
		      model.addAttribute("board",vo);
		      System.out.println(vo);
		      return "board/read";  
		}else {
			return "redirect:/board/list";
		}
		      
	}
	//bno로 상세페이지 부르기  
	
	//좋아요+1 ////////////////////////////////	싫어요와 좋아요의 원리 같음.
	@GetMapping(value="/read/plusLike/{bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	   @ResponseBody
	   public ResponseEntity<String> plusLike(@PathVariable("bno") int bno) {
	      
	      String result = Integer.toString(service.likeBoard(bno));
	      return new ResponseEntity<String>(result, HttpStatus.OK);
	   }
	
	//좋아요+1 ////////////////////////////////

	//싫어요+1 ////////////////////////////////		board/read에서 싫어요 버튼 누르면 ajax로  url: "/read/plusUnlike/" + bno, 경로에 get 타입으로 요청하면 밑 GetMapping이 적용되서 service.unlikeBoard(bno)가 실행되어 해당 bno의  싫어요 1증가 후 싫어요 개수를 int로 result에 반환(컨트롤러는 할거다한거고) read.jsp가 그 result를 받아서 비동기적으로 싫어요 갯수를 리로딩.
	@GetMapping(value="/read/plusUnlike/{bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	   @ResponseBody
	   public ResponseEntity<String> plusUnlike(@PathVariable("bno") int bno) {
	      
	      String result = Integer.toString(service.unlikeBoard(bno));
	      return new ResponseEntity<String>(result, HttpStatus.OK);
	   }
	//싫어요+1 ////////////////////////////////
	
	
	
	//해당 bno의 board 삭제/////////////////////////////////////////////
	@PostMapping("/board/remove/{bno}")
	public String remove(@PathVariable("bno") int bno, RedirectAttributes rttr) {  
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirect:/board/list";
	}
	
	//해당 bno의 board 삭제/////////////////////////////////////////////
	
	
	
}
