package com.spring.god.bora.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
