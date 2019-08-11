package com.spring.god.jiyoung.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.spring.god.common.AES256;
import com.spring.god.jiyoung.model.InterMemberDAO;
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


	@Override
	public String getidFind(HashMap<String, String> paraMap) {
		
		String idFind = dao.getidFind(paraMap); 
		return idFind;
	}


	@Override
	public String getpwdFind(HashMap<String, String> paraMap) {
		
		String pwdFind = dao.getpwdFind(paraMap); 
		return pwdFind;
	}

	//유저확인하기
	@Override
	public boolean isUserExists(HashMap<String, String> paraMap) {
		boolean isUserExists = dao.isUserExists(paraMap); 
		return isUserExists;
	}


	@Override
	public int updatePwdUser(HashMap<String, String> paraMap) {
		int updatePwdUser = dao.updatePwdUser(paraMap);
		return updatePwdUser;
	}


	@Override
	public MemberVO memberEdit(int idx) {
		MemberVO memberEdit = dao.memberEdit(idx);
		return memberEdit;
	}


	@Override
	public int memberEditEnd(MemberVO vo) {
		int memberEditEnd = dao.memberEditEnd(vo);
		return memberEditEnd;
	}


	@Override
	public int memberout(HashMap<String, String> paraMap) {
		int memberout = dao.memberout(paraMap);
		return memberout;
	}

	@Override
	public int add_withFile(MemberVO membervo) {
		System.out.println("시작service");
		int n = dao.add_withFile(membervo); // 첨부파일이 있는 경우
		return n;
	}


	@Override
	public boolean isUserExist(HashMap<String, String> paraMap) {
		boolean isUserExist = dao.isUserExist(paraMap); 
		return isUserExist;
	}
	
}