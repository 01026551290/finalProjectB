package com.spring.god.bora.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.god.bora.model.InterMemberDAO;
import com.spring.god.yujin.model.HistoryVO;


@Service
public class MemberService implements InterMemberService {
	
	@Autowired
	private InterMemberDAO dao;
	
	// 예약유무 조회
	@Override
	public int reserveAddSelect(HistoryVO hvo) {
		int n = dao.reserveAddSelect(hvo);
		return n;
	}
	
	// 예약insert하기
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int reserveAddInsert(HistoryVO hvo) {
		
		int result = 0;
		int n = 0;
		
		n = dao.reserveAddInsert1(hvo);
		if(n==1) {
			result = dao.reserveAddInsert2(hvo);
		}
		return result;
	}
}
