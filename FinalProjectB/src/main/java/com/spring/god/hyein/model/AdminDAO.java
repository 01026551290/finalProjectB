package com.spring.god.hyein.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public int hotelAdd(HotelRoomVO hotelroomvo) {
		int n = sqlsession.insert("hyein.hotelAdd", hotelroomvo);
		return n;
	}
	
	
	
	
}
