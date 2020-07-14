package com.justdo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justdo.domain.BoardVO;
import com.justdo.domain.Criteria;
import com.justdo.mapper.BoardMapper;
import com.justdo.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class BoardServicelmpl implements BoardService{
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;//자동주입
	
	
//	@Override
//	public List<BoardVO> getList() {
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}


	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
