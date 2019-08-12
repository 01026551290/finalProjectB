package com.spring.god.yujin.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.InterMemberDAO;
import com.spring.god.yujin.model.ReviewVO;
import com.spring.god.yujin.model.SearchVO;

@Service
public class MemberService implements InterMemberService {

	  @Autowired
	   private InterMemberDAO dao;
	  
	   @Override
	   public int findHeart(HashMap<String, String> paramap) {
		   int n = dao.findHeart(paramap);
		   return n;
	   }
	   
	   @Override
	   public int addHeart(HashMap<String, String> paramap) {
	      int n = dao.addHeart(paramap);
	      return n;
	   }

		@Override
		public int delHeart(HashMap<String, String> paramap) {
			int n = dao.delHeart(paramap);
			return n;
		}
		
		@Override
		public int getTotalCntHotel(SearchVO svo) {
			int totalCnt = dao.getTotalCntHotel(svo);
		    return totalCnt;
		}

		@Override
		public List<HotelRoomVO> heartList(SearchVO svo) {
			List<HotelRoomVO> list = dao.getHeartList(svo);
			return list;
		}
		

		@Override
		public int add(ReviewVO rvo) {
			int n = dao.addReview(rvo);
			return n;
		}

		@Override
		@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
		public int add_withFile(ReviewVO rvo) {
			int n = dao.add_withFile1(rvo);
			int m = dao.add_withFile2(rvo);
			return n*m;
		}

		@Override
		public List<HistoryVO> getHistory(int memberidx) {
			List<HistoryVO> list = dao.getHistory(memberidx);
			return list;
		}
		
		@Override
		public List<HistoryVO> getPurchaseHistory(HashMap<String, String> paramap) {
			List<HistoryVO> list = dao.getPurchaseHistory(paramap);
			return list;
		}

		@Override
		public HistoryVO getCancelPage(String reserveid) {
			HistoryVO cancel = dao.getCancelPage(reserveid);
			return cancel;
		}

		@Override
		public int getReserveCancelResult(String reserveid) {
			int n = dao.getReserveCancelResult(reserveid);
			return n;
		}

		@Override
		@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
		public int getEarnPoint(HashMap<String, String> paramap){
			int n = dao.getEarnPoint1(paramap);
			int m = dao.getEarnPoint2(paramap);
			return n*m;
		}

		@Override
		public HistoryVO getMyReivew(int idx) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public int getPurchaseCnt(int memberidx) {
			int n = dao.getPurchaseCnt(memberidx);
			return n;
		}
		
}
