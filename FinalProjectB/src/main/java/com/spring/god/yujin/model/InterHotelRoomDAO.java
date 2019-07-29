package com.spring.god.yujin.model;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;

public interface InterHotelRoomDAO {

	int getTotalCntHotel(HashMap<String, String> paramap); // 페이징을 위한 총갯수
	List<Object> getTotalHotelList(HashMap<String, String> paramap); // 페이징 처리한 리스트

	List<HotelRoomVO> getlist(HashMap<String, String> paramap); // 페이징 처리안한 리스트

}
