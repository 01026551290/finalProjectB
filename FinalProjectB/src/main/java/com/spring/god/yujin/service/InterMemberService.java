package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;
import com.spring.god.yujin.model.SearchVO;

public interface InterMemberService {
	
	int findHeart(HashMap<String, String> paramap); // 찜목록 조회
	int addHeart(HashMap<String, String> paramap); // 찜 추가
	int delHeart(HashMap<String, String> paramap); // 찜 삭제

	int getTotalCntHotel(SearchVO svo); // 찜리스트 페이징을 위한 갯수조회
	List<HotelRoomVO> heartList(SearchVO svo); // 찜리스트 조회
	
	int add(ReviewVO rvo);
	int add_withFile(ReviewVO rvo);
	
	List<HistoryVO> getHistory(int memberidx);
	List<HistoryVO> getPurchaseHistory(int memberidx);
	

}
