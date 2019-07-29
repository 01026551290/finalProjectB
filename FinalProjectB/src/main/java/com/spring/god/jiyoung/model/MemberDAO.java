package com.spring.god.jiyoung.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


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




	
		
}
