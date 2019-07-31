package com.spring.god.bora.service;

import java.util.List;

import com.spring.god.bora.model.HotelRoomVO;
import com.spring.god.jiyoung.model.MemberVO;

public interface InterHotelRoomService {
	
	// 검색어 입력시 자동글 완성하기(숙박명)
	List<String> wordNameSearchView(String searchWord);
	// 검색어 입력시 자동글 완성하기(지역명)
	List<String> wordAddrSearchView(String searchWord);
	
	// 숙소보여주기(최신숙소)
	List<HotelRoomVO> getlist();
	
	// 예약및결제페이지에서 회원정보 수정하기
	int accomodationInfoMyEditEnd(MemberVO mvo);


}
