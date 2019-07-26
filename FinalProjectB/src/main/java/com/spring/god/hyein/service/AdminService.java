package com.spring.god.hyein.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.hyein.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService {
	
	@Autowired
	private InterAdminDAO dao;

	@Override
	public int hotelAdd(HotelRoomVO hotelroomvo) {
		
		int n = dao.hotelAdd(hotelroomvo);
		return n;
		
	}
}
