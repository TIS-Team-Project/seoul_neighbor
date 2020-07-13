package com.justdo.serviceImpl;

import org.springframework.stereotype.Service;

import com.justdo.domain.MemberVO;
import com.justdo.mapper.commonMapper;
import com.justdo.service.commonService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service("commonService")
public class commonServiceImpl implements commonService {
	
	private commonMapper mapper;
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) {
		return mapper.login(vo);
	}

	@Override
	public void join(MemberVO vo) {
		System.out.println("회원가입을 처러하기 위한 mapper를 호출합니다.");
		mapper.insertUser(vo);
	}

}
