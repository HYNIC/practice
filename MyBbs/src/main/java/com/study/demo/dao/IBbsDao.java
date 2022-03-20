package com.study.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.demo.dto.BbsDto;

@Mapper
public interface IBbsDao {
	
	public List<BbsDto> listDao(int page);
	public int countRows();
	public BbsDto viewDao(int num);
	public int writeDao(String title, String writer, String content, String regdate);
	public int updateDao(String title, String content, int num);
	public int replyCountDao(int num);
	public int deleteDao(int num);
	public List<BbsDto> searchDao(String type, String keyword);
	public int countSearch();
	
}
