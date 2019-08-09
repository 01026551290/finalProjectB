package com.spring.god.bora.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.god.jiyoung.model.MemberVO;

@Repository
public class HotelRoomDAO implements InterHotelRoomDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	////////////////////////////////////////////////////////////////////////////////////////////
	// === 검색어 입력시 자동글 완성하기 5 ===
	@Override
	public List<String> wordNameSearchView(String searchWord) {
		List<String> wordList = sqlsession.selectList("boradb.wordNameSearchView", searchWord);
		return wordList;
	}
	@Override
	public List<String> wordAddrSearchView(String searchWord) {
		List<String> wordList = sqlsession.selectList("boradb.wordAddrSearchView", searchWord);
		return wordList;
	}
	////////////////////////////////////////////////////////////////////////////////////////////
	
	// 숙소보여주기(베스트, 최신숙소)
	@Override
	public List<HotelRoomVO> getlistBest() {
		List<HotelRoomVO> hotelList = sqlsession.selectList("boradb.getlistBest");
		return hotelList;
	}
	@Override
	public List<HotelRoomVO> getlistNew() {
		List<HotelRoomVO> hotelList = sqlsession.selectList("boradb.getlistNew");
		return hotelList;
	}
	
	// 호텔조회수에 의한 실시간 검색어
	@Override
	public List<HotelRoomVO> gethotelViewsRealTime() {
		List<HotelRoomVO> hotelView = sqlsession.selectList("boradb.gethotelViewsRealTime");
		return hotelView;
	}
	
	
}
