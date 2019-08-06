package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.SubSearchVO;

public interface InterHotelRoomService {

	int getTotalCntHotel(HashMap<String, String> paramap); // 페이징을 위한 목록갯수
	List<HotelRoomVO> getTotalHotelList(HashMap<String, String> paramap); // 페이징한 호텔목록
	
	
	SubSearchVO getRangePrice(); // 서브서치를 위한 가격범위
	List<SubSearchVO> getLargeCategoryCode(); // 서브서치를 위한 숙박유형
	List<SubSearchVO> getLontion(); // 서브서치를 위한 호텔옵션
	List<SubSearchVO> getPontion(); // 서브서치를 위한 객실옵션


}
