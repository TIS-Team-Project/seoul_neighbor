package com.justdo.mapper;

import java.util.List;

import com.justdo.domain.BoardVO;
import com.justdo.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	
	public List<BoardVO> getLocationList(Criteria cri);
	
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
}
