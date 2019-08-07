package com.spring.god.hyein.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.hyein.model.PhotoVO;

public interface InterAdminService {

	// 숙소 등록하기
	int hotelAdd(HotelRoomVO hotelroomvo);

	// 객실 등록의 숙소명 검색어 자동완성하기
	List<String> wordNameSearchView(String searchWord);


	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
	String getLargeCodeNum(String clickWord);
	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기2
	String getLargeCategoryNum(String clickWord);

//	int photoaddimg(List<PhotoVO> photovo);
	
	// 객실 등록하기
	int roomAdd(HashMap<String, String> productMap);

	// 제품일련번호 체번해오기
	int getProdseq(HashMap<String, String> hashMap);

	// 객실 이미지 넣기
	int imgAdd(HashMap<String, String> hashMap);

	

}
