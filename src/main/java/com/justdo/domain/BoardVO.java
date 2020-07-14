package com.justdo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long bno;
	private String userid;
	private String title;
	private String content;
	private Date regdate;
	private Date updatedate;
	private int replycnt;
	private String category;
	private int likecount;
	private int unlikecount;
	private String location;
	private int viewcount;
}
