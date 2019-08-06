package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.InterHotelRoomDAO;
import com.spring.god.yujin.model.SubSearchVO;

@Service
public class HotelRoomService implements InterHotelRoomService {

   @Autowired
   private InterHotelRoomDAO dao;
   

   @Override // 페이징을 위한 목록갯수(키워드있)
   public int getTotalCntHotel(HashMap<String, String> paramap) {
      int totalCnt = dao.getTotalCntHotel(paramap);
      return totalCnt;
   }

   @Override // 검색어와 페이징을 포함한 리스트
   public List<HotelRoomVO> getTotalHotelList(HashMap<String, String> paramap) {
      List<HotelRoomVO> hotelList = dao.getTotalHotelList(paramap);
      return hotelList;
   }

	@Override // 서브서치를 위한 가격범위
	public SubSearchVO getRangePrice() {
		SubSearchVO rangePrice = dao.getRangePrice();
		return rangePrice;
	}

	@Override // 서브서치를 위한 숙박유형
	public List<SubSearchVO> getLargeCategoryCode() {
		List<SubSearchVO>  largeCateGoryCode = dao.getLargeCategoryCode();
		return largeCateGoryCode;
	}

	@Override // 서브서치를 위한 호텔옵션
	public List<SubSearchVO> getLontion() {
		List<SubSearchVO> lontion = dao.getLontion();
		return lontion;
	}

	@Override // 서브서치를 위한 객실옵션
	public List<SubSearchVO> getPontion() {
		List<SubSearchVO> pontion = dao.getPontion();
		return pontion;
	}
	   
	   
}
