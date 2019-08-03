package com.spring.god.taehee.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.taehee.model.HotelRoomDAO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;



@Service
public class HotelRoomService implements InterHotelRoomService {
	// === #34. 의존객체 주입하기(DI: Dependency Injection) ===
		@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
		private HotelRoomDAO dao;
	
	// 숙소정보 보여주기
		@Override
		public HotelRoomVO getViewHotel(String largeCategoryontionCode) {
			HotelRoomVO hotelroomvo = dao.getViewHotel(largeCategoryontionCode);
					return hotelroomvo;
		}
		

	    // 객실정보 보여주기
		@Override
		public List<HotelRoomVO> getHotelroomList(String largeCategoryontionCode) {
			List<HotelRoomVO> getHotelroomList = dao.getHotelroomList(largeCategoryontionCode);
			return getHotelroomList;
		}

		// 객실
		
		// 체크인 체크아웃
		@Override
		public List<HotelRoomVO> getCheckInOutList(HashMap<String, String> paraMap) {
			List<HotelRoomVO> getCheckInOutList = dao.getCheckInOutList(paraMap);
			return getCheckInOutList;
		}


	





	// 리뷰 보여주기
		/*@Override
		public List<ReviewVO> getReviewList(String hotelidx) {
			List<ReviewVO> getReviewList = dao.getReviewList(hotelidx);
			return getReviewList;
		}*/
		


	
	
	
	
}