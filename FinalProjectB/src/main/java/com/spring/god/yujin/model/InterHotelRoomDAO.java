package com.spring.god.yujin.model;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.SearchVO;

public interface InterHotelRoomDAO {

	int getTotalCntHotel(SearchVO svo); // 페이징을 위한 총갯수
	List<HotelRoomVO> getTotalHotelList(SearchVO svo); // 페이징 처리한 리스트
	
	SearchVO getRangePrice(); // 서브서치를 위한 가격범위
	List<SearchVO> getLargeCategoryCode(); // 서브서치를 위한 숙박유형
	List<SearchVO> getLontion(); // 서브서치를 위한 숙소옵션
	List<SearchVO> getPontion(); // 서브서치를 위한 객실옵션
	
	List<HistoryVO> getReviewRList(HashMap<String, String> paramap); //숙박상세페이지 리뷰리스트
	List<HistoryVO> getReviewSList(HashMap<String, String> paramap);
	List<HistoryVO> getReviewsList(HashMap<String, String> paramap);
	int getReviewCnt(HashMap<String, String> paramap); //숙박상세페이지 리뷰갯수
	double getReviewAvg(HashMap<String, String> paramap); //숙박상세페이지 평균별점


}
