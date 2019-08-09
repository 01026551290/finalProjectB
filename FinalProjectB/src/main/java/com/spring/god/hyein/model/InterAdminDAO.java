package com.spring.god.hyein.model;

import java.util.HashMap;
import java.util.List;

public interface InterAdminDAO {

	// 숙소 등록하기
	int hotelAdd(HotelRoomVO hotelroomvo);

	
	// 객실 등록의 숙소명 검색어 자동완성하기
	List<String> wordNameSearchView(String searchWord);

	// 이미지 등록하기
	int imgAdd(HashMap<String, String> hashMap); // 제품이미지테이블에 제품이미지파일 등록하기
	// 룸 등록하기
	int roomAdd(HashMap<String, String> productMap);
	

	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
	String getLargeCodeNum(String clickWord);
	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기 2
	String getLargeCategoryNum(String clickWord);

//	int photoaddimg(List<PhotoVO> photovo);

	// 제품번호 체번해오기
	int getProdseq(HashMap<String,String> hashMap);



}
