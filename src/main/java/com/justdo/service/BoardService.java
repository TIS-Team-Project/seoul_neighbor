package com.justdo.service;

import java.util.List;

import com.justdo.domain.BoardVO;

public interface BoardService {
	
	//등록
	public void register(BoardVO board);
	
	//상세보기
	public BoardVO get(Long bno);
	
	//수정
	public boolean modify(BoardVO board);
	
	//삭제
	public boolean remove(Long bno);
	
	//목록
	public List<BoardVO> getList();

}