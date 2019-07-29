package com.spring.god.jiyoung.service;


import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.god.common.AES256;
import com.spring.god.jiyoung.model.InterMemberDAO;
import com.spring.god.jiyoung.model.MemberDAO;
import com.spring.god.jiyoung.model.MemberVO;



@Service
public class MemberService implements InterMemberService {

	@Autowired
	private InterMemberDAO dao;
	
	//===== #45. 양방향 암호화 알고리즘인 AES256 를 사용하여 암호화/복호화 하기위한 클래스 의존객체 주입하기(DI: Dependency Injection) =====
			@Autowired
			private AES256 aes;
	
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})  
	public int register(MemberVO mvo) throws Throwable {
		int n = dao.register(mvo);
		return n;
	}


	@Override
	public boolean isUsememberId(String memberId) {
		boolean n = dao.isUsememberId(memberId);
		return n;
	}


	@Override
	public boolean isUsenickName(String nickName) {
		boolean n = dao.isUsenickName(nickName);
		return n;
	}


	@Override
	public boolean isUseemail(String email) {
		boolean n = dao.isUseemail(email);
		return n;
	}


	@Override
	public MemberVO getLoginMember(HashMap<String, String> paraMap) {
		
		MemberVO loginuser = dao.getLoginMember(paraMap);
		return loginuser;
	}
	
}