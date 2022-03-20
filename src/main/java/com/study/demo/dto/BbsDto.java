package com.study.demo.dto;

import lombok.Data;

@Data
public class BbsDto {
	private int num;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int replycnt;
}
