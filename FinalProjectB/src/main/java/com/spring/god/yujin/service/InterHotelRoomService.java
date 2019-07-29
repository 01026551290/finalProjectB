package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;

public interface InterHotelRoomService {

	int getTotalCntHotel(HashMap<String, String> paramap);

	List<Object> getTotalHotelList(HashMap<String, String> paramap);

	List<HotelRoomVO> getlist(HashMap<String, String> paramap);

}
