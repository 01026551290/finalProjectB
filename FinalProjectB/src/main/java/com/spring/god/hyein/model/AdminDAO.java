package com.spring.god.hyein.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 숙소 등록하기
	@Override
	public int hotelAdd(HotelRoomVO hotelroomvo) {
		int n = sqlsession.insert("hyeindb.hotelAdd", hotelroomvo);
		return n;
	}

    // 객실 등록의 숙소명 검색어 자동완성하기
	@Override
	public List<String> wordNameSearchView(String searchWord) {
		List<String> wordList = sqlsession.selectList("hyeindb.wordNameSearchView", searchWord);
		return wordList;
	}

	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기
	@Override
	public String getLargeCodeNum(String clickWord) {
		String largeCodeList = sqlsession.selectOne("hyeindb.getLargeCodeNum", clickWord);
		return largeCodeList;
	}
	
	// 룸 등록하기
	@Override
	public int roomAdd(HashMap<String, String> productMap) {
		int n = sqlsession.insert("hyeindb.roomAdd", productMap);
		return n;
	}

//	@Override
//	public int photoaddimg(List<PhotoVO> photovo) {
//		int n = sqlsession.insert("hyeindb.photoaddimg", photovo);
//		return n;
//	}

	// 새로이 입력할 제품번호(시퀀스) 가져오기
	@Override
	public int getProdseq(HashMap<String,String> hashMap) {
		int prodseq = sqlsession.selectOne("hyeindb.getProdseq", hashMap);
		return prodseq;
	}

	@Override
	public int imgAdd(HashMap<String, String> hashMap) {
		int n = sqlsession.insert("hyeindb.imgAdd", hashMap);
		return n;
	}

	// 자동완성 검색어의 대분류 카테고리 넘버 가져오기 2
	@Override
	public String getLargeCategoryNum(String clickWord) {
		String largeCategoryList = sqlsession.selectOne("hyeindb.getLargeCategoryNum", clickWord);
		return largeCategoryList;
	}
	
}
