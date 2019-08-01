package com.spring.god.hyein.model;

import java.util.List;

public interface InterAdminDAO {

	// 숙소 등록하기
	int hotelAdd(HotelRoomVO hotelroomvo);

	// 이미지 등록하기
	int imgAdd(HotelRoomVO hotelroomvo);
	
	// 객실 등록의 숙소명 검색어 자동완성하기
	List<String> wordNameSearchView(String searchWord);

	// 룸 등록하기
	int roomAdd(HotelRoomVO hotelroomvo);
	

	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
	String getLargeCodeNum(String clickWord);

	int photoaddimg(List<PhotoVO> photovo);


}
