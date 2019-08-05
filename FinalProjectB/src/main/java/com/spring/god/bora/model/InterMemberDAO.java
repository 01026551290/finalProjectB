package com.spring.god.bora.model;

import com.spring.god.yujin.model.HistoryVO;

public interface InterMemberDAO {
	
	// 예약유무 조회
	int reserveAddSelect(HistoryVO hvo);
	
	/////////////////////////////////////////////////////////////
	// 예약insert하기(reserve1)
	int reserveAddInsert1(HistoryVO hvo);
	// 예약insert하기(reserve2)
	int reserveAddInsert2(HistoryVO hvo);
	/////////////////////////////////////////////////////////////
}
