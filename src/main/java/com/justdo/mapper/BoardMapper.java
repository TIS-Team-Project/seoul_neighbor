package com.justdo.mapper;

import java.util.List;

import com.justdo.domain.BoardVO;

public interface BoardMapper {
	//목록
	public List<BoardVO> getList();
	//등록
	public void insert(BoardVO board);
	//조회
	public BoardVO read(Long bno);
	//삭제
	public int delete(Long bno);
	//수정
	public int update(BoardVO board);
	
}