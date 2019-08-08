package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.InterHotelRoomDAO;
import com.spring.god.yujin.model.SearchVO;

@Service
public class HotelRoomService implements InterHotelRoomService {

   @Autowired
   private InterHotelRoomDAO dao;
   

   @Override // 페이징을 위한 목록갯수(키워드있)
   public int getTotalCntHotel(SearchVO svo) {
      int totalCnt = dao.getTotalCntHotel(svo);
      return totalCnt;
   }

   @Override // 검색어와 페이징을 포함한 리스트
   public List<HotelRoomVO> getTotalHotelList(SearchVO svo) {
      List<HotelRoomVO> hotelList = dao.getTotalHotelList(svo);
      return hotelList;
   }

	@Override // 서브서치를 위한 가격범위
	public SearchVO getRangePrice() {
		SearchVO rangePrice = dao.getRangePrice();
		return rangePrice;
	}

	@Override // 서브서치를 위한 숙박유형
	public List<SearchVO> getLargeCategoryCode() {
		List<SearchVO>  largeCateGoryCode = dao.getLargeCategoryCode();
		return largeCateGoryCode;
	}

	@Override // 서브서치를 위한 호텔옵션
	public List<SearchVO> getLontion() {
		List<SearchVO> lontion = dao.getLontion();
		return lontion;
	}

	@Override // 서브서치를 위한 객실옵션
	public List<SearchVO> getPontion() {
		List<SearchVO> pontion = dao.getPontion();
		return pontion;
	}

	@Override
	public List<HistoryVO> getReviewRList(HashMap<String, String> paramap) {
		List<HistoryVO> list = dao.getReviewRList(paramap);
		return list;
	}
	
	@Override
	public List<HistoryVO> getReviewSList(HashMap<String, String> paramap) {
		List<HistoryVO> list = dao.getReviewSList(paramap);
		return list;
	}
	
	@Override
	public List<HistoryVO> getReviewsList(HashMap<String, String> paramap) {
		List<HistoryVO> list = dao.getReviewsList(paramap);
		return list;
	}

	@Override
	public int getReviewCnt(HashMap<String, String> paramap) {
		int cnt = dao.getReviewCnt(paramap);
		return cnt;
	}
	   
	   
}
