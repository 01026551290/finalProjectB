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
	
	// 숙소보여주기(최신숙소)
	@Override
	public List<HotelRoomVO> getlist() {
		List<HotelRoomVO> hotelList = sqlsession.selectList("boradb.getlist");
		return hotelList;
	}
	
	// 예약및결제페이지에서 회원정보 수정하기
	@Override
	public int accomodationInfoMyEditEnd(MemberVO mvo) {
		int n = sqlsession.update("boradb.accomodationInfoMyEditEnd", mvo);
		return n;
	}
	
}
