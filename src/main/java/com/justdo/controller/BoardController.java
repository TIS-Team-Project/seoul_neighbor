package com.justdo.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;
import com.justdo.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;

	//목록
	@GetMapping("/list")
	public void view(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	// 등록화면
	@GetMapping("/register")
	public void register(@RequestParam("userid") String userid,Model model) {
		log.info("/register");
		model.addAttribute("userid", userid.toString());
	}
	
	// 등록처리
	@PostMapping("/register")
		public String register(BoardVO board, RedirectAttributes rttr) {
		log.info("register: " + board);
		System.out.println(board);
		service.register(board);
		
		rttr.addFlashAttribute("result",board.getBno());
		
		return "redirect:/board/list";
	};
	
	// 상세보기
	@GetMapping("/get/{bno}")
	public String get(@PathVariable("bno") Long bno, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(bno));
		return "/board/get";
	}
	
	// 수정화면불러오기
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bno, Model model) {
		log.info("/modify");
		model.addAttribute("board", service.get(bno));
	}
		
	// 수정처리
	@PostMapping("/modify")
	public String modify(BoardVO board, RedirectAttributes rttr) {
		log.info("modify : " + board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	//삭제
	@PostMapping("/remove")
	public String remoce(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("remove..."+ bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/list";
	}
	
	//summernote 이미지 업로드
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + email + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("profileUpload/"+email+"/"+str_filename);
		out.close();
	}
}
