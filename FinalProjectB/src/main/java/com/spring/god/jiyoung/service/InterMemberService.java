package com.spring.god.jiyoung.service;

import java.util.HashMap;

import com.spring.god.jiyoung.model.MemberVO;

public interface InterMemberService {

	int register(MemberVO mvo) throws Throwable;//

	boolean isUsememberId(String memberId);//

	boolean isUsenickName(String nickName);
	
	boolean isUseemail(String email);

	//로그인하기
	MemberVO getLoginMember(HashMap<String, String> paraMap);

	String getidFind(HashMap<String, String> paraMap);//아이디찾기

	String getpwdFind(HashMap<String, String> paraMap);//비밀번호찾기

	boolean isUserExists(HashMap<String, String> paraMap);//유저확인하기

	int updatePwdUser(HashMap<String, String> paraMap);

//	MemberVO memberEdit(int idx);


}
