package com.spring.god.bora.model;

import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;

public interface InterHotelRoomDAO {
	
	// 검색어 입력시 자동글 완성하기(숙박명)
	List<String> wordNameSearchView(String searchWord);
	// 검색어 입력시 자동글 완성하기(지역명)
	List<String> wordAddrSearchView(String searchWord);
	
	// 숙소보여주기(베스트, 최신숙소)
	List<HotelRoomVO> getlistBest();
	List<HotelRoomVO> getlistNew();
	
	// 호텔조회수에 의한 실시간 검색어
	List<HotelRoomVO> gethotelViewsRealTime();
	

}
