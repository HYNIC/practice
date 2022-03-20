package com.study.demo.dao;

import com.study.demo.dto.MemberDto;

public interface IMemberDao {
	
	public int registMember(String id, String pw, String name);
	public MemberDto getMember(String id);
	public int checkPw(String id, String pw);
	public int checkId(String id);
}
