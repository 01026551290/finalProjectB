package com.spring.god.hyein.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.hyein.model.InterAdminDAO;
import com.spring.god.hyein.model.PhotoVO;

@Service
public class AdminService implements InterAdminService {
	
	@Autowired
	private InterAdminDAO dao;

	// 숙소 등록하기
	@Override
	public int hotelAdd(HotelRoomVO hotelroomvo) {
		int n = dao.hotelAdd(hotelroomvo);
		return n;
	}
	
	// 객실 등록의 숙소명 검색어 자동완성하기
	@Override
	public List<String> wordNameSearchView(String searchWord) {
		List<String> wordList = dao.wordNameSearchView(searchWord);
		return wordList;
	}

	// 객실 등록하기
	@Override
//	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})  
	public int roomAdd(HashMap<String, String> productMap) {
		int n = dao.roomAdd(productMap);
		return n;
	}
	
	// 객실 이미지 넣기
	@Override
	public int imgAdd(HashMap<String, String> hashMap) {
		int n = dao.imgAdd(hashMap);
		return n;
	}

	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
	@Override
	public String getLargeCodeNum(String clickWord) {
		String largeCodeList = dao.getLargeCodeNum(clickWord);
		return largeCodeList;
	}

//	@Override
//	public int photoaddimg(List<PhotoVO> photovo) {
//		int m = dao.photoaddimg(photovo);
//		return m;
//	}

	// 새로이 입력할 제품번호(시퀀스) 가져오기
	@Override
	public int getProdseq(HashMap<String,String> hashMap) {
			int prodseq = dao.getProdseq(hashMap);
			return prodseq;
	}

	@Override
	public String getLargeCategoryNum(String clickWord) {
		String largeCategoryList = dao.getLargeCategoryNum(clickWord);
		return largeCategoryList;
	}
	
}
