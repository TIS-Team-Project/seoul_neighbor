package com.justdo.domain;

import lombok.Data;

// 회원 테이블 속성을 나타냅니다 ////////////
@Data
public class MemberVO {
	
	private String userId;
	private String nickName;
	private String userPw;
	private String email;
	private String memberLocation;
	private String memberFileName;
	private String enabled;
}
