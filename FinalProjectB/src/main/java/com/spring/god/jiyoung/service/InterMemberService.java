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


}
