package com.justdo.serviceImpl;

import org.springframework.stereotype.Service;

import com.justdo.domain.BoardVO;
import com.justdo.domain.MemberVO;
import com.justdo.mapper.boardMapper;
import com.justdo.mapper.commonMapper;
import com.justdo.service.commonService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("commonService")
public class commonServiceImpl implements commonService {
	
	private commonMapper mapper;
	private boardMapper boardMapper;
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}

	@Override
	public BoardVO read(int bno) {
		// TODO Auto-generated method stub
		mapper.plusCount(bno);
		return mapper.selectBoard(bno);
	}

	@Override
	public int likeBoard(int bno) {
		// TODO Auto-generated method stub
		boardMapper.like(bno);
	      return boardMapper.selectLikeCount(bno);
      }

	@Override
	public int unlikeBoard(int bno) {
		// TODO Auto-generated method stub
		boardMapper.unlike(bno);
	      return boardMapper.selectUnlikeCount(bno);
	}

	@Override
	public boolean remove(int bno) {
		
		return boardMapper.delete(bno)==1;
	}






}
