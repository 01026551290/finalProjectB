package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.HistoryVO;
import com.spring.god.yujin.model.InterMemberDAO;
import com.spring.god.yujin.model.ReviewVO;

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
		public List<HotelRoomVO> heartList(String memberId) {
			List<HotelRoomVO> list = dao.getHeartList(memberId);
			return list;
		}

		@Override
		public List<String> heartNo(String memberId) {
			List<String> list = dao.getHeartNo(memberId);
			return list;
		}

		@Override
		public int add(ReviewVO rvo) {
			int n = dao.addReview(rvo);
			return n;
		}

		@Override
		public int add_withFile(ReviewVO rvo) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public List<HistoryVO> getHistory(int memberidx) {
			List<HistoryVO> list = dao.getHistory(memberidx);
			return list;
		}
}
