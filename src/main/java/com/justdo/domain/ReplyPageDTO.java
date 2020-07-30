package com.justdo.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {
	private int replyCount;
	private List<ReplyVO> replyList;
	private List<ReReplyVO> reReplyList;
}
