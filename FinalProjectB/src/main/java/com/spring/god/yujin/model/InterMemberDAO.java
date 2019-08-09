package com.spring.god.yujin.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import com.spring.god.hyein.model.HotelRoomVO;

public interface InterMemberDAO {
	
	int findHeart(HashMap<String, String> paramap);
	int addHeart(HashMap<String, String> paramap);
	int delHeart(HashMap<String, String> paramap);

	int getTotalCntHotel(SearchVO svo);
	List<HotelRoomVO> getHeartList(SearchVO svo);

	int addReview(ReviewVO rvo);
	int add_withFile(ReviewVO rvo);

	List<HistoryVO> getHistory(int memberidx);
	List<HistoryVO> getPurchaseHistory(int memberidx);
	
	HistoryVO getCancelPage(String reserveid);
	int getReserveCancelResult(String reserveid);
	
	int getEarnPoint1(HashMap<String, String> paramap);
	int getEarnPoint2(HashMap<String, String> paramap);

}
