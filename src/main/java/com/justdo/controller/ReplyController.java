package com.justdo.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.justdo.domain.Criteria;
import com.justdo.domain.ReReplyVO;
import com.justdo.domain.ReplyVO;
import com.justdo.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply/")
@AllArgsConstructor
@Log4j
public class ReplyController {
	private ReplyService service;
	
	//댓글 등록
	@PostMapping(value = "/new", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO vo) {
		System.out.println("댓글 insert 컨트롤러 발동");
		System.out.println(vo);
		
		int insertCount = service.register(vo);
		
		return insertCount == 1 ? 
				new ResponseEntity<String>("success", HttpStatus.OK) :
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//대댓글 등록
	@PostMapping(value = "/newRe", consumes = "application/json", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> createRe(@RequestBody ReReplyVO vo) {
		int insertCount = service.reRegister(vo);
		System.out.println(vo);
		
		return insertCount == 1 ? 
				new ResponseEntity<String>("success", HttpStatus.OK) :
				new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 한개 조회
	@GetMapping(value="/{rno}" , produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyVO> get(@PathVariable("rno") int rno) {
		return new ResponseEntity<ReplyVO>(service.get(rno), HttpStatus.OK);
	}
	
	//댓글 삭제
	@DeleteMapping(value="/delete/{no}/{type}/{exist}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<String> remove(@PathVariable("no") int no, @PathVariable("type") int type, @PathVariable("exist") int exist) {
		
		System.out.println("댓글 삭제를 진행합니다.");
		System.out.println(no);
		System.out.println(type);
		System.out.println(exist);
		
		
		int result = 0;
		
		if(type == 1) {
			System.out.println("대댓글입니다. 대댓글 삭제 진행....");
			result = service.removeRe(no); 
			System.out.println(result);
		} else if(type == 0) {
			
			if(exist == 0) {
				System.out.println("댓글입니다. 댓글 삭제 진행....");
				result = service.remove(no);
				System.out.println(result);
			} else if(exist == 1) {
				System.out.println("댓글인데 대댓글이 달린 댓글이네요....");
				result = service.removeExist(no);
				System.out.println("결과는 " + result);
			}
			

		}
		return result == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 수정
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH}, 
			value = "/update/{no}/{type}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody ReplyVO vo, @PathVariable("no") int no, @PathVariable("type") int type){
		vo.setRno(no);
		
		int result = 0;
		
		if(type == 1) {
			System.out.println("대댓글입니다. 대댓글 수정 진행....");
			result = service.modifyRe(vo);
			System.out.println(result);
		} else if(type == 0) {
			System.out.println("댓글입니다. 댓글 수정 진행....");
			result = service.modify(vo);
			System.out.println(result);
		}
		
		
		return result == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 목록 조회
	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Map<String, Object>> getList(@PathVariable("page") int page, @PathVariable("bno") int bno){
		
		System.out.println("받은 bno : " + bno + " 받은 page : " + page);
		
		Map<String, Object> map = new HashMap<>();
		
		if(page <0) {
			map.put("replyCount", service.getReplyCount(bno));
			return new ResponseEntity<>(map, HttpStatus.OK);
		}
		
		Criteria cri = new Criteria();
		cri.setAmount(10);
		cri.setPageNum(page);
		
		
		System.out.println(cri);
		
		map.put("replyCount", service.getReplyCount(bno));
		map.put("replyList", service.getList(cri, bno));
		map.put("reReplyList", service.getReList(cri, bno));
		map.put("displayCommentCount", service.getAllReplyCount(bno));
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	//댓글 총 개수 구하기 (tbl_reply 에서만 rno 개수를 셈, 페이징을 위한 갯수)
	@GetMapping(value = "/getCount/{bno}")
	public ResponseEntity<String> getCount(@PathVariable("bno") int bno) {
		int replyCount = service.getReplyCount(bno);
		
		return new ResponseEntity<>(Integer.toString(replyCount), HttpStatus.OK);
	}
	
	
}
