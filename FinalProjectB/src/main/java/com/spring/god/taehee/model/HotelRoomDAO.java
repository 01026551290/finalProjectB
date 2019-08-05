package com.spring.god.taehee.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;



@Repository
public class HotelRoomDAO implements InterHotelRoomDAO{

	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private SqlSessionTemplate sqlsession;

	// 숙소정보 보여주기
	@Override
	public HotelRoomVO getViewHotel(String largeCategoryontionCode) {
		HotelRoomVO hotelroomvo = sqlsession.selectOne("taeheedb.getViewHotel", largeCategoryontionCode);
		return hotelroomvo;
	}


	// 객실정보 보여주기
	@Override
	public List<HotelRoomVO> getHotelroomList(String largeCategoryontionCode) {
		List<HotelRoomVO> hotelroomList = sqlsession.selectList("taeheedb.getHotelroomList", largeCategoryontionCode);
		return hotelroomList;
	}


	// 체크인 체크아웃
	@Override
	public List<HotelRoomVO> getCheckInOutList(HashMap<String, String> paraMap) {
		List<HotelRoomVO> checkinoutList = sqlsession.selectList("taeheedb.getCheckInOutList", paraMap);
		return checkinoutList;
	}


		




	
	// 리뷰 보여주기
	/*@Override
	public List<ReviewVO> getReviewList(String hotelidx) {
		List<ReviewVO> reviewList = sqlsession.selectList("taehee.getReviewList", hotelidx);
		return reviewList;
	}*/









}



