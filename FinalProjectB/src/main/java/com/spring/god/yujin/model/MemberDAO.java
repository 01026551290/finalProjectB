package com.spring.god.yujin.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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
		public int add_withFile1(ReviewVO rvo) {
			int n = sqlsession.insert("yujindb.addReview_withfile",rvo);
			return n;
		}
		@Override
		public int add_withFile2(ReviewVO rvo) {
			int m = 0;
			for(int i=0;i<rvo.getImgList().size();i++) {
				m+=sqlsession.insert("yujindb.addReviewFile",rvo.getImgList().get(i));
			}
			int n = m/rvo.getImgList().size();
			return n;
		}

		@Override
		public List<HistoryVO> getHistory(int memberidx) {
			List<HistoryVO> list = sqlsession.selectList("yujindb.getHistory",memberidx);
			return list;
		}

		@Override
		public List<HistoryVO> getPurchaseHistory(HashMap<String, String> paramap) {
			List<HistoryVO> list = sqlsession.selectList("yujindb.getPurchaseHistory",paramap);
			return list;
		}

		@Override
		public HistoryVO getCancelPage(String reserveid) {
			HistoryVO cancel = sqlsession.selectOne("yujindb.getCancelPage",reserveid);
			return cancel;
		}

		@Override
		public int getReserveCancelResult(String reserveid) {
			int n = sqlsession.update("yujindb.getReserveCancelResult",reserveid);
			return n;
		}

		@Override
		public int getEarnPoint1(HashMap<String, String> paramap) {
			int n = sqlsession.update("yujindb.getEarnPoint1",paramap);
			return n;
		}
		
		@Override
		public int getEarnPoint2(HashMap<String, String> paramap) {
			int n = sqlsession.update("yujindb.getEarnPoint2",paramap);
			return n;
		}

		@Override
		public int getPurchaseCnt(int memberidx) {
			int n = sqlsession.selectOne("yujindb.getPurchaseCnt",memberidx);
			return n;
		}

}
