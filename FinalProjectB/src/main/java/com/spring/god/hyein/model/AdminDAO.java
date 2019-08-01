package com.spring.god.hyein.model;

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
	public int roomAdd(HotelRoomVO hotelroomvo) {
		int n = sqlsession.insert("hyeindb.roomAdd", hotelroomvo);
		return n;
	}

	// 이미지 등록하기
	@Override
	public int imgAdd(HotelRoomVO hotelroomvo) {
		int n = sqlsession.insert("hyeindb.imgAdd", hotelroomvo);
		return n;
	}

	@Override
	public int photoaddimg(List<PhotoVO> photovo) {
		int n = sqlsession.insert("hyeindb.photoaddimg", photovo);
		return n;
	}

	
	
	
	
}
