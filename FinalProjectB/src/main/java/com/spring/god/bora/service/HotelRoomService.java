package com.spring.god.bora.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.bora.model.HotelRoomVO;
import com.spring.god.bora.model.InterHotelRoomDAO;
import com.spring.god.jiyoung.model.MemberVO;


@Service
public class HotelRoomService implements InterHotelRoomService {
	
	@Autowired
	private InterHotelRoomDAO dao;
	
	
	// === 검색어 입력시 자동글 완성하기 4 ===
	@Override
	public List<String> wordNameSearchView(String searchWord) {
		List<String> wordList = dao.wordNameSearchView(searchWord);
		return wordList;
	}
	@Override
	public List<String> wordAddrSearchView(String searchWord) {
		List<String> wordList = dao.wordAddrSearchView(searchWord);
		return wordList;
	}
	
	// 숙소보여주기(최신숙소)
	@Override
	public List<HotelRoomVO> getlist() {
		List<HotelRoomVO> hotelList = dao.getlist();
		return hotelList;
	}
	
	// 호텔조회수에 의한 실시간 검색어
	@Override
	public List<HotelRoomVO> gethotelViewsRealTime() {
		List<HotelRoomVO> hotelView = dao.gethotelViewsRealTime();
		return hotelView;
	}
	
	
}
