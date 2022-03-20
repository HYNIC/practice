package com.study.demo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.study.demo.dto.ReplyDto;

@Mapper
public interface IReplyDao {
	public List<ReplyDto> listDao(int num);
	public int insertDao(int num, String comment, String writer);
}
