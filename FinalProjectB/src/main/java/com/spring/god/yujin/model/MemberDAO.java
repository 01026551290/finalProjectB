package com.spring.god.yujin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.god.hyein.model.HotelRoomVO;

@Repository
public class MemberDAO implements InterMemberDAO {
	
	 @Autowired
	   private SqlSessionTemplate sqlsession;

	   @Override
	   public int findHeart(HashMap<String, String> paramap) {
		   int n = sqlsession.selectOne("yujindb.findHeart",paramap);
		   return n;
	   }
	   
	   @Override
	   public int addHeart(HashMap<String, String> paramap) {
	      int n = sqlsession.insert("yujindb.addHeart",paramap);
	      return n;
	   }
		
		@Override
		public int delHeart(HashMap<String, String> paramap) {
			int n = sqlsession.update("yujindb.delHeart",paramap);
			return n;
		}
		
		@Override
		public int getTotalCntHotel(SearchVO svo) {
			int cnt = sqlsession.selectOne("yujindb.getTotalCntHeart",svo);
			return cnt;
		}

		@Override
		public List<HotelRoomVO> getHeartList(SearchVO svo) {
			List<HotelRoomVO> list = sqlsession.selectList("yujindb.getHeartList",svo);
			return list;
		}

		@Override
		public int addReview(ReviewVO rvo) {
			int n = sqlsession.insert("yujindb.addReview",rvo);
			return n;
		}

		@Override
		public int add_withFile(ReviewVO rvo) {
			int n = sqlsession.insert("yujindb.addReview_withfile",rvo);
			int m = sqlsession.insert("yujindb.addReviewFile",rvo);
			
			System.out.println(n);
			System.out.println(m);
			return n;
		}

		@Override
		public List<HistoryVO> getHistory(int memberidx) {
			List<HistoryVO> list = sqlsession.selectList("yujindb.getHistory",memberidx);
			return list;
		}

}
