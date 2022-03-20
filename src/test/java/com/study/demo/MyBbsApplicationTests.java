package com.study.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.study.demo.dao.MemberDao;

@SpringBootTest
class MyBbsApplicationTests {

	@Autowired
	public MemberDao mdao;
	
	@Test
	void getMemberTest() {
		assertNotNull(mdao.getMember("gana"));
	}
	
	@Test
	void getPwTest() {
		assertEquals("1111", mdao.getMember("gana").getPw());
	}
	
	@Test
	void checkPwTest() {
		assertEquals(1, mdao.checkPw("gana", "1111"));
	}

}
