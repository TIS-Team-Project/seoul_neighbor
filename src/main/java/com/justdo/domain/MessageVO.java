package com.justdo.domain;


import lombok.Data;

@Data
public class MessageVO {
	int mno;
	String sender;
	String receiver;
	String writedate;
	String message_content;
	String nickname;
	char read_check;
}