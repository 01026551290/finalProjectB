﻿package com.spring.god.jiyoung.model;

import java.util.HashMap;

import com.spring.god.hyein.model.PhotoVO;

public interface InterMemberDAO {

	int register(MemberVO mvo) throws Throwable;//등록

	boolean isUsememberId(String memberId);

	boolean isUsenickName(String nickName);

	boolean isUseemail(String email);
		
	MemberVO getLoginMember(HashMap<String, String> paraMap);// 로그인하기

	String getidFind(HashMap<String, String> paraMap);//아이디 찾기

	String getpwdFind(HashMap<String, String> paraMap);//비밀번호 찾기

	boolean isUserExists(HashMap<String, String> paraMap);//유저확인하기

	int updatePwdUser(HashMap<String, String> paraMap);

	MemberVO memberEdit(int idx);

	int memberEditEnd(MemberVO vo);

	int memberout(HashMap<String, String> paraMap);

	int add_withFile(MemberVO membervo); // 멤버 사진 추가





	

}
