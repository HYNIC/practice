package com.study.demo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.study.demo.dto.MemberDto;

@Repository
public class MemberDao implements IMemberDao{
	
	@Autowired
	JdbcTemplate jt;

	@Override
	public int registMember(String id, String pw, String name) {
		System.out.println("회원등록 실행");
		String sql = "insert into mybbs_user_tbl values (?, ?, ?)";
		
		return jt.update(sql, id, pw, name);
	}

	@Override
	public MemberDto getMember(String id) {
		System.out.println("회원 1명 조회");
		String sql = "select * from mybbs_user_tbl where id='" + id + "'";
		
		MemberDto member = jt.queryForObject(sql, new BeanPropertyRowMapper<MemberDto>(MemberDto.class));
		
		return member;
	}

	@Override
	public int checkPw(String id, String pw) {
		MemberDto member = getMember(id);
		
		if (member.getPw().equals(pw)) {
			System.out.println("로그인 성공");
			return 1;
		} else if (!member.getPw().equals(pw)) {
			System.out.println("로그인 실패(불일치)");
			return 0;
		} else {
			System.out.println("로그인 실패(null)");
			return 0;
		}
	}

	@Override
	public int checkId(String id) {
		String sql = "select count(*) from mybbs_user_tbl where id='" + id + "'";
		int result = 0;
		
		if (id.equals("") || id == null) {
			result = -1; // 미입력
		} else {
			result = jt.queryForObject(sql, Integer.class); // 개수 알아서 카운트됨	
		}
		System.out.println(result);
		return result;
		
	}
	
	
	
}
