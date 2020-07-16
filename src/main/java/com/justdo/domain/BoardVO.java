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
	private int reply_count;
	private String category;
	private int like_count;
	private int unlike_count;
	private String location;
	private int view_count;
}
