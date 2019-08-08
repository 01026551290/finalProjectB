package com.spring.god.jiyoung.service;

import java.util.HashMap;

import com.spring.god.hyein.model.PhotoVO;
import com.spring.god.jiyoung.model.MemberVO;

public interface InterMemberService {

	int register(MemberVO mvo) throws Throwable;//

	boolean isUsememberId(String memberId);//

	boolean isUsenickName(String nickName);
	
	boolean isUseemail(String email);
	
	MemberVO getLoginMember(HashMap<String, String> paraMap);//로그인하기

	String getidFind(HashMap<String, String> paraMap);//아이디찾기

	String getpwdFind(HashMap<String, String> paraMap);//비밀번호찾기

	boolean isUserExists(HashMap<String, String> paraMap);//유저확인하기

	int updatePwdUser(HashMap<String, String> paraMap);

	MemberVO memberEdit(int idx);

	int memberEditEnd(MemberVO vo);

	int memberout(HashMap<String, String> paraMap);

	int add_withFile(MemberVO membervo); // 멤버 사진 추가





	


}
