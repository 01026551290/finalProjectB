package com.spring.god.yujin.model;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;

public interface InterHotelRoomDAO {

	int getTotalCntHotel(HashMap<String, String> paramap); // 페이징을 위한 총갯수
	List<HotelRoomVO> getTotalHotelList(HashMap<String, String> paramap); // 페이징 처리한 리스트
	
	SubSearchVO getRangePrice(); // 서브서치를 위한 가격범위
	List<SubSearchVO> getLargeCategoryCode(); // 서브서치를 위한 숙박유형
	List<SubSearchVO> getLontion(); // 서브서치를 위한 숙소옵션
	List<SubSearchVO> getPontion(); // 서브서치를 위한 객실옵션


}
