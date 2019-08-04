package com.spring.god.bora.service;

import com.spring.god.yujin.model.HistoryVO;

public interface InterMemberService {
	
	// 예약유무 조회
	int reserveAddSelect(HistoryVO hvo);
	
	// 예약insert하기
	int reserveAddInsert(HistoryVO hvo);

}
