package com.spring.god.jiyoung.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MemberDAO {
	@Autowired			
	private SqlSessionTemplate sqlsession;
	
	// 회원가입
		public int register(MemberVO mvo) {
			int n = sqlsession.insert("jiyoungdb.register", mvo);
			return n;
		}
}
