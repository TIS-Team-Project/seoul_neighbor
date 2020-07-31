package com.justdo.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.justdo.domain.MemberVO;
import com.justdo.security.CustomUserDetailsService;
import com.justdo.serviceImpl.commonServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/*")
@AllArgsConstructor
public class LoginController {
	
	private CustomUserDetailsService loginService;
	private commonServiceImpl service;
	private JavaMailSender mailSender;
	private BCryptPasswordEncoder pwEncoder;
	
	// 메인 로그인 페이지로 이동 //////////////////////////////////
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String mainLogin() {
		// 로그인 실패시 LoginFailureHandler 작동
		return "index";
	}
	// 메인 로그인 페이지로 이동 //
	
	// 서브 로그인 페이지로 이동 //////////////////////////////////
	@RequestMapping(value = "subLogin", method = RequestMethod.GET)
	public String subLogin() {
		return "/login/subLogin";
	}
	// 서브 로그인 페이지로 이동 //
	
	// 로그인 성공 - 목록 이동 //////////////////////////////////
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public String loginSuccess(HttpSession session, HttpServletRequest request) {
		log.warn("login controller - 로그인 > 목록 페이지로 접속");
		return "board/list";
	}
	// 로그인 성공 - 목록 이동 //
	
	// 권한 없음 페이지로 이동  ///////////////////////////////////
    @RequestMapping(value = "access_denied", method = RequestMethod.GET)
    public String accessDeniedPage() throws Exception {
        return "/login/access_denied";
    }
    // 아이디/비밀번호 찾기 페이지로 이동 //////////////////////////////
    @RequestMapping(value = "find_id_pw", method = RequestMethod.GET)
    public String find_id_pw() throws Exception {
    	return "/login/find_id_pw";
    }
    // 아이디/비밀번호 찾기 페이지로 이동 //
    
    
    // 아이디 찾기 form //////////////////////////////
    @RequestMapping(value = "find_id_form", method = RequestMethod.POST)
    @ResponseBody
    public String find_id_form(String email, Model model) throws Exception {
    	log.warn("----------------------------[아이디 찾기]------------------------------");
    	log.warn(email);
    	
		String username = service.findIdByEmail(email);
		log.warn("이메일과 매칭된 아이디 : " + username);
		
		if (username != null) {
			return username;
		} else {
			return "null";
		}

    }
    // 아이디 찾기 form //
    
    // 비밀번호 찾기 form //////////////////////////////
	@RequestMapping(value = "find_pw_form", method = RequestMethod.POST, produces = "application/text; charset=utf-8")
    @ResponseBody
    public String find_pw_form(String username, String email, Model model) throws Exception {
    	log.warn("----------------------------[비밀번호 찾기]------------------------------");
    	log.warn("작성한 아이디 + 메일 : "+username+"+"+email);

    	MemberVO idVO = loginService.loadInfoByUsername(username);
    	MemberVO emailVO = loginService.loadInfoByEmail(email);
    	
    	log.warn("idVO"+idVO);
    	log.warn("emailVO"+emailVO);
    	
    	// 아이디로 정보 확인하기
    	if (idVO == null) {
    		if (emailVO == null) {
    			log.warn("[결과 1] 아이디 없음 + 이메일 없음");
    			return "fail_noUser";
			} else {
    			log.warn("[결과 2] 아이디 없음 + 이메일 있음");
				return "fail_noID";
			}
			
		} else if (idVO != null) {
			if (emailVO == null) {
				
    			log.warn("[결과 3] 아이디 있음 + 이메일 없음");
				return "fail_noEmail";
			} else {
				
				if (!idVO.equals(emailVO)) {
					log.warn("[결과 4] 아이디 있음 + 이메일 있음 + 두 정보가 다름");
					return "fail_diffrentInfo";
					
				} else {
					
					log.warn("[결과 5] 아이디 있음 + 이메일 있음 + 두 정보가 같음");
					// 임시비밀번호 생성하기
					String new_password = "";
					for (int i = 0; i < 12; i++) {
						new_password += (char) ((Math.random() * 26) + 97);
					}
					log.warn("임시비밀번호 : "+new_password);
					
					String encoded_pw = pwEncoder.encode(new_password);
					
					// 입력한 아이디와 이메일을 가진 회원 비밀번호 변경하기
					String result = "false";
					result = service.changePassword(username, email, encoded_pw);
					
					// 메일 정보 설정하기
					String setfrom = "justdo0812@gmail.com";
					String tomail = email;
					String title = "[서울이웃 비밀번호 변경] 임시비밀번호가 발송되었습니다.";
					String content = "서울이웃 임시비밀번호입니다. [ "+ new_password +" ] 로그인 후 비밀번호를 변경해주세요.";
					
					// 생성한 임시비밀번호로 이메일 발송하고 /login/find_id_pw에 발송 완료되었다는 결과값 던져주기
					if (result == "true") {
						log.warn("비밀번호 변경 완료");
						
						try {
							MimeMessage message = mailSender.createMimeMessage();
							MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
							
							messageHelper.setFrom(setfrom);
							messageHelper.setTo(tomail);
							messageHelper.setSubject(title);
							messageHelper.setText(content);
							
							mailSender.send(message);
						} catch(Exception e) {
							e.printStackTrace();
						}
						log.warn("메일 전송 완료");
						return "success_send";
					} else {
						log.warn("비밀번호 변경 실패");
						return "fail_send";
					}
				}
			}
		}
		return "end"; 
    }
    // 비밀번호 찾기 form //
}