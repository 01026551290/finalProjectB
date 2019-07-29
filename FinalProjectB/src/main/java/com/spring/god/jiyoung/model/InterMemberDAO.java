package com.spring.god.jiyoung.model;

import java.util.HashMap;

public interface InterMemberDAO {

	int register(MemberVO mvo) throws Throwable;//등록

	boolean isUsememberId(String memberId);

	boolean isUsenickName(String nickName);

	boolean isUseemail(String email);
		
	MemberVO getLoginMember(HashMap<String, String> paraMap);// 로그인하기

}
