package com.spring.god.jiyoung.model;

import java.rmi.server.SocketSecurityException;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.god.hyein.model.PhotoVO;


@Repository
public class MemberDAO implements InterMemberDAO {
	@Autowired			
	private SqlSessionTemplate sqlsession;
	
	// 회원가입
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})  
	public int register(MemberVO mvo) throws Throwable {
		int n = sqlsession.insert("jiyoungdb.register", mvo);
		int m = sqlsession.insert("jiyoungdb.register1", mvo);
		return m+n;
	}
	
	@Override
	public boolean isUsememberId(String memberId) {
		boolean bool = false;
		int select = sqlsession.selectOne("jiyoungdb.isUseMEMBERID", memberId);
		if(select!=1) 
			bool = true;
		return bool;
	}
	
	@Override
	public boolean isUsenickName(String nickName) {
		boolean bool = false;
		int select = sqlsession.selectOne("jiyoungdb.isUseNICKNAME", nickName);
		if(select!=1) 
			bool = true;
		return bool;
	}
	
	@Override
	public boolean isUseemail(String email) {
		boolean bool = false;
		int select = sqlsession.selectOne("jiyoungdb.isUseEMAIL", email);
		if(select!=1) 
			bool = true;
		return bool;
	}

	@Override
	public MemberVO getLoginMember(HashMap<String, String> paraMap) {
		MemberVO loginuser = sqlsession.selectOne("jiyoungdb.getLoginMember",paraMap);
		return loginuser;
	}

	@Override
	public String getidFind(HashMap<String, String> paraMap) {
		String idFind =sqlsession.selectOne("jiyoungdb.getidFind",paraMap);				
		return idFind;
	}

	@Override
	public String getpwdFind(HashMap<String, String> paraMap) {
		String pwdFind =sqlsession.selectOne("jiyoungdb.getpwdFind",paraMap);				
		return pwdFind;
	}

	@Override
	public boolean isUserExists(HashMap<String, String> paraMap) {
		boolean isUserExists = false;
		int n = sqlsession.selectOne("jiyoungdb.isUserExists",paraMap);
		if(n==1)
			isUserExists=true;
		
		return isUserExists;
	}

	@Override
	public int updatePwdUser(HashMap<String, String> paraMap) {
		
		int updatePwdUser = sqlsession.update("jiyoungdb.updatePwdUser",paraMap);			
		return updatePwdUser;
	}

	@Override
	public MemberVO memberEdit(int idx) {
		MemberVO memberEdit = sqlsession.selectOne("jiyoungdb.memberEdit",idx);			
		return memberEdit;
	}

	@Override
	public int memberEditEnd(MemberVO vo) {
		
		int memberEditEnd = sqlsession.update("jiyoungdb.memberEditEnd",vo);	
		
		return memberEditEnd;
	}

	@Override
	public int memberout(HashMap<String, String> paraMap) {
		
		int memberout = sqlsession.update("jiyoungdb.memberout",paraMap);	
		
		return memberout;
	}

	@Override
	public int add_withFile(MemberVO membervo) {
		System.out.println("시작dao");
		int n = sqlsession.update("jiyoungdb.add_withFile", membervo);
		return n;
	}




	
		
}
