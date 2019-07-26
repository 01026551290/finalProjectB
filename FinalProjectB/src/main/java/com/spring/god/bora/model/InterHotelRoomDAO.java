package com.spring.god.bora.model;

import java.util.List;

public interface InterHotelRoomDAO {
	
	// 검색어 입력시 자동글 완성하기(숙박명)
	List<String> wordNameSearchView(String searchWord);
	// 검색어 입력시 자동글 완성하기(지역명)
	List<String> wordAddrSearchView(String searchWord);
	
	// 숙소보여주기(최신숙소)
	List<HotelRoomVO> getlist();


}
