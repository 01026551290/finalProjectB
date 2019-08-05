package com.spring.god.taehee.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;


public interface InterHotelRoomService {
	
	//  호텔정보 보여주기
//	HotelRoomVO getViewHotel(String LARGECATEGORYONTIONCODE, String FK_LARGECATEGORYCODE);
	HotelRoomVO getViewHotel(String largeCategoryontionCode);
	
	// 객실정보 보여주기
	List<HotelRoomVO> getHotelroomList(String largeCategoryontionCode);
	

	// 체크인 체크아웃
	List<HotelRoomVO> getCheckInOutList(HashMap<String, String> paraMap); 

	
	// 리뷰 보여주기
//	List<ReviewVO> getReviewList(String hotelidx);


}
