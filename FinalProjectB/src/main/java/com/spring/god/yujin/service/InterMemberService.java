package com.spring.god.yujin.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.ReviewVO;
import com.spring.god.yujin.model.SearchVO;

public interface InterMemberService {
	
	int findHeart(HashMap<String, String> paramap); // 찜목록 조회
	int addHeart(HashMap<String, String> paramap); // 찜 추가
	int delHeart(HashMap<String, String> paramap); // 찜 삭제

	int getTotalCntHotel(SearchVO svo); // 찜리스트 페이징을 위한 갯수조회
	List<HotelRoomVO> heartList(SearchVO svo); // 찜리스트 조회
	
	int add(ReviewVO rvo); //리뷰작성
	int add_withFile(ReviewVO rvo); //리뷰 이미지첨부 작성
	
	List<HistoryVO> getHistory(int memberidx); // 여행목록
	List<HistoryVO> getPurchaseHistory(int memberidx); // 구매목록
	
	HistoryVO getCancelPage(String reserveid); //예약취소페이지 뷰단용
	int getReserveCancelResult(String reserveid); //예약취소 결과
	
	int getEarnPoint(HashMap<String, String> paramap); // 포인트 적립
	

}
