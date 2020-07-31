package com.justdo.controller;



import java.io.IOException;
<<<<<<< Updated upstream
=======
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.HashMap;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
>>>>>>> Stashed changes

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.BoardVO;
import com.justdo.domain.Criteria;
import com.justdo.domain.MemberVO;
<<<<<<< Updated upstream
=======
import com.justdo.security.CustomUserDetailsService;
import com.justdo.service.BoardService;
>>>>>>> Stashed changes
import com.justdo.service.commonService;
import com.justdo.service.myPageService;
import com.justdo.util.JoinValidator;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class CommonController {
	
	 private commonService service;
	 private myPageService myPageService;
	 private BCryptPasswordEncoder pwdEncoder;
<<<<<<< Updated upstream
	// test //
	// 메인 이동 //////////////////////////////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() throws IOException {
		service.getWeather();
=======
	 private JavaMailSender mailSender;
	 private BoardService boardService;
	 
	// test //
	// 메인 이동 //////////////////////////////////
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model,Principal principal) throws IOException {
		
		// 로그인 한 상태일 때는 principal 정보 담아서 board/list로 전송
		if (principal != null) {
			String username = principal.getName();
			String gu = loginService.loadLocationByUsername(username);
			String encodedGu = URLEncoder.encode(gu, "UTF-8");
			return "redirect:/board/list?gu="+encodedGu;
		}

		
>>>>>>> Stashed changes
		return "index";
	}
	// 메인 이동 //
	
	// 목록 페이지 이동 //////////////////////////
	@GetMapping("list")
	public String list() {
		return "board/list";
	};
	// 목록 페이지 이동 //
	
	// 프로필 페이지 이동 ////////////////////////
	@GetMapping("profile")
	public String profile(Model model, MemberVO vo) {
		model.addAttribute("member", myPageService.selectUser("test")); //test -> 동적으로 바꿔야함
		return "mypage/profile";
	}
	// 프로필 페이지 이동 //
	
<<<<<<< Updated upstream
	//bno로 상세페이지 부르기/////////////////////
	@GetMapping("read")
	public String read(@RequestParam("bno") int bno, Model model) {
		BoardVO vo=service.read(bno);
		model.addAttribute("board",vo);
		return "board/read";
=======
	//bno로 상세페이지 부르기   ---이 주석의 오른쪽 설명란은 볼 필요 없음.         board/read/*란 주소 board/read슬래쉬 뒤에 붙는 애들은 이녀석 적용이란 의미 -> httpServletRequest request는 clinet가 주소창에 입력한 요청을 담은 객체로 request.getRequestURI는 클라이언트가 친 주소창이고, 그걸 잘라서 http://localhost:8181/board/read/1의 bno인 1만 따로 bno라는 변수에 저장하고, vo에 bno=1담아서 jsp에 어트리뷰트 속성으로 보내서 jsp는 그 데이터로 클라이언트에게 보여줌/////////////////////
	@GetMapping("board/read/*")
	public String read(Model model, HttpServletRequest request,HttpServletResponse response,Principal principal,Criteria cri) {
		
		int bno =  Integer.parseInt(request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/")+1));
		BoardVO vo = service.read(bno);
		
		HttpSession sessions = request.getSession();
		
        // 비교하기 위해 새로운 쿠키
        String viewSession = null;

        
        // 쿠키가 있을 경우 
        if (sessions != null) {
        	System.out.println("세션있음");
        	if(sessions.getAttribute("readSession"+vo.getBno().toString()) != null) {
        		viewSession = sessions.getAttribute("readSession"+vo.getBno()).toString();
        	}
        }
		
		if(vo != null) {
		      model.addAttribute("board",vo);
		      model.addAttribute("fileName",boardService.selectWriterProfile(vo.getNickname()));
		      model.addAttribute("hotList",boardService.selectHotListFromRead(cri));
		      System.out.println(boardService.selectHotListFromRead(cri));
				if(principal != null) {
					String username = principal.getName();
					model.addAttribute("member", myPageService.selectUser(username));
					String weatherData[]=null;
					try {
						weatherData = service.getWeather(service.selectGuForWeather(principal.getName()));
					} catch (IOException e) {
						e.printStackTrace();
					}
					model.addAttribute("weather",weatherData[0]);
					model.addAttribute("temperature",weatherData[1]);
					model.addAttribute("weatherGu",weatherData[2]);
					
					  // 만일 viewCookie가 null일 경우 세션을 생성해서 조회수 증가 로직을 처리함.
					if (viewSession == null) {
					  // 세션 생성(이름, 값) 
					  sessions.setAttribute("readSession"+vo.getBno(), "test");
					  // 세션을 추가 시키고 조회수 증가시킴 
					  boardService.updateViewCount(vo.getBno());
					  }
				}
		      return "board/read";  
		}else {
			return "redirect:/board/list";
		}
>>>>>>> Stashed changes
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
	
	//회원가입 페이지 호출
	@GetMapping("join")
	public String joinForm() {
		System.out.println("회원가입페이지로 이동합니다.");
		return "joinpage/join";
	}
	
	//회원가입 진행
	@PostMapping("join")
	public String join(MemberVO vo, BindingResult result, RedirectAttributes rttr) {
		System.out.println("회원가입 처리 서비스를 호출합니다.");
		System.out.println("받은 회원 정보 : " + vo.toString());
		
		boolean isDuplicated = 
				service.isUniqueID(vo.getUserid()) && service.isUniqueNickName(vo.getNickname());
		System.out.println(isDuplicated);
		
		try {
			if(!isDuplicated) {
				System.out.println("아이디 or 닉네임 뭔가가 중복되었다");
				rttr.addFlashAttribute("warning", "아이디 혹은 닉네임이 중복되었습니다.");
				return "redirect:/join";
			} else {
				JoinValidator validator = new JoinValidator();
				validator.validate(vo, result);
				if(result.hasErrors()) {
					System.out.println("유호성검사 실패");
					rttr.addFlashAttribute("warning", "올바른 형식이 아닙니다.");
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
	
	//유저 ID 중복됬는지 체크
	@GetMapping(value="/checkId/{userId}",
			produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> checkUserId(@PathVariable("userId") String userId){
		if(service.isUniqueID(userId)) {
			return new ResponseEntity<String>("new",HttpStatus.OK);
		}
		return new ResponseEntity<String>("duplicated",HttpStatus.OK);
	}
	
	//유저 닉네임 중복됬는지 체크
	@GetMapping(value="/checkNickName/{nickName}",
			produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> checkNickName(@PathVariable("nickName") String nickName){
		if(service.isUniqueNickName(nickName)) {
			return new ResponseEntity<String>("new",HttpStatus.OK);
		}
		return new ResponseEntity<String>("duplicated",HttpStatus.OK);
	}
	
	// 안읽은 메시지 개수 가져오기 /////////////
	@GetMapping("getMessageCountAjax")
	@ResponseBody
	public int getMessageCountAjax(String userid) {
		return service.selectMessageReadCount(userid);
	}
	// 안읽은 메시지 개수 가져오기
	
}
