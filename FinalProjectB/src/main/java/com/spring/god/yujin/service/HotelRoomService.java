package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.InterHotelRoomDAO;

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

	   @Override
	   public List<HotelRoomVO> getlist(HashMap<String, String> paramap) {
	      List<HotelRoomVO> list = dao.getlist(paramap);
	      return list;
	   }
}
