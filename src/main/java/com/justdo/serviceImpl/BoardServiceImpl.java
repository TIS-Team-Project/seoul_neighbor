package com.justdo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justdo.domain.BoardVO;
import com.justdo.mapper.BoardMapper;
import com.justdo.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	// 등록
	@Override
	public void register(BoardVO board) {
		log.info("register......" + board);
		mapper.insert(board);
	}
	
	//상세보기
	@Override
	public BoardVO get(Long bno) {
		log.info("get......" + bno);
		return mapper.read(bno);
	}

	//수정
	@Override
	public boolean modify(BoardVO board) {
		log.info("modify......" + board);
		return mapper.update(board)==1;
	}

	//삭제
	@Override
	public boolean remove(Long bno) {
		log.info("remove......" + bno);
		return mapper.delete(bno)==1;
	}

	//목록
	@Override
	public List<BoardVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}
}