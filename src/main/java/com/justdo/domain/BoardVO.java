package com.justdo.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private int bno; 
	private String userId; 
	private String title; 
	private String content; 
	private Date regDate; 
	private Date updateDate; 
	private int replyCount; 
	private String category; 
	private int likeCount; 
	private int unlikeCount; 
	private String location; 
	private int viewCount; 


	
}

