package com.spring.god.yujin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.god.hyein.model.HotelRoomVO;
import com.spring.god.yujin.model.SearchVO;

@Repository
public class HotelRoomDAO implements InterHotelRoomDAO {

	   @Autowired
	   private SqlSessionTemplate sqlsession;

	   @Override // 페이징을 위한 목록갯수(키워드있)
	   public int getTotalCntHotel(SearchVO svo) {
	      int cnt = sqlsession.selectOne("yujindb.getTotalCntHotel",svo);
	      return cnt;
	   }

	   @Override // 검색어와 페이징을 포함한 리스트
	   public List<HotelRoomVO> getTotalHotelList(SearchVO svo) {
	      List<HotelRoomVO> list = sqlsession.selectList("yujindb.getTotalHotelList",svo);
	      return list;
	   }

	@Override // 서브서치를 위한 가격범위
	public SearchVO getRangePrice() {
		SearchVO rangePrice = sqlsession.selectOne("yujindb.getRangePrice");
		return rangePrice;
	}

	@Override // 서브서치를 위한 숙박유형
	public List<SearchVO> getLargeCategoryCode() {
		List<SearchVO>  largeCateGoryCode = sqlsession.selectList("yujindb.getLargeCategoryCode");
		return largeCateGoryCode;
	}

	@Override // 서브서치를 위한 숙박옵션
	public List<SearchVO> getLontion() {
		List<SearchVO> lontion = sqlsession.selectList("yujindb.getLontion");
		return lontion;
	}
 
	@Override // 서브서치를 위한 객실옵션
	public List<SearchVO> getPontion() {
		List<SearchVO> pontion = sqlsession.selectList("yujindb.getPontion");
		return pontion;
	}

	@Override
	public List<HistoryVO> getReviewRList(HashMap<String, String> paramap) {
		List<HistoryVO> list = sqlsession.selectList("yujindb.getReviewList",paramap);
		return list;
	}
	
	@Override
	public List<HistoryVO> getReviewSList(HashMap<String, String> paramap) {
		List<HistoryVO> list = sqlsession.selectList("yujindb.getReviewList",paramap);
		return list;
	}
	
	@Override
	public List<HistoryVO> getReviewsList(HashMap<String, String> paramap) {
		List<HistoryVO> list = sqlsession.selectList("yujindb.getReviewList",paramap);
		return list;
	}

	@Override
	public int getReviewCnt(HashMap<String, String> paramap) {
		int cnt = sqlsession.selectOne("yujindb.getReviewCnt",paramap);
		return cnt;
	}


}
