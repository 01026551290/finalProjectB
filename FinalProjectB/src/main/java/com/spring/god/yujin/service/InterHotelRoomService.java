package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.SearchVO;

public interface InterHotelRoomService {

	int getTotalCntHotel(SearchVO svo); // 페이징을 위한 목록갯수
	List<HotelRoomVO> getTotalHotelList(SearchVO svo); // 페이징한 호텔목록
	
	
	SearchVO getRangePrice(); // 서브서치를 위한 가격범위
	List<SearchVO> getLargeCategoryCode(); // 서브서치를 위한 숙박유형
	List<SearchVO> getLontion(); // 서브서치를 위한 호텔옵션
	List<SearchVO> getPontion(); // 서브서치를 위한 객실옵션
	
	
	List<HistoryVO> getReviewRList(HashMap<String, String> paramap); //숙박상세페이지 리뷰리스트
	List<HistoryVO> getReviewSList(HashMap<String, String> paramap);
	List<HistoryVO> getReviewsList(HashMap<String, String> paramap);
	int getReviewCnt(HashMap<String, String> paramap); //숙박상세페이지 리뷰갯수
	double getReviewAvg(HashMap<String, String> paramap); //숙박상세페이지 평균별점


}
