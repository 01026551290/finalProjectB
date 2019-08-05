package com.spring.god.hyein.service;

import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.hyein.model.PhotoVO;

public interface InterAdminService {

	// 숙소 등록하기
	int hotelAdd(HotelRoomVO hotelroomvo);

	// 객실 등록의 숙소명 검색어 자동완성하기
	List<String> wordNameSearchView(String searchWord);

	// 룸 등록하기
	int roomAdd(HotelRoomVO hotelroomvo);

	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
	String getLargeCodeNum(String clickWord);

	int photoaddimg(List<PhotoVO> photovo);
	
}
