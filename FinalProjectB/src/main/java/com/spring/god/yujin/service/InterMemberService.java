package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;

public interface InterMemberService {
	
	int findHeart(HashMap<String, String> paramap); // 찜목록 조회
	int addHeart(HashMap<String, String> paramap); // 찜 추가
	int delHeart(HashMap<String, String> paramap); // 찜 삭제

	List<HotelRoomVO> heartList(String memberid); // 찜리스트 조회
	List<String> heartNo(String memberid); // 찜하트 채워줄 리스트조회(호텔번호)
	
	int add(ReviewVO rvo);
	int add_withFile(ReviewVO rvo);
	
	List<HistoryVO> getHistory(int memberidx);

}
