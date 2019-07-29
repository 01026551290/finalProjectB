package com.spring.god.yujin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.god.hyein.model.HotelRoomVO;

@Repository
public class HotelRoomDAO implements InterHotelRoomDAO {

	   @Autowired
	   private SqlSessionTemplate sqlsession;

	   @Override // 페이징을 위한 목록갯수(키워드있)
	   public int getTotalCntHotel(HashMap<String, String> paramap) {
	      int cnt = sqlsession.selectOne("yujindb.getTotalCntHotel",paramap);
	      return cnt;
	   }

	   @Override // 검색어와 페이징을 포함한 리스트
	   public List<Object> getTotalHotelList(HashMap<String, String> paramap) {
	      List<Object> list = sqlsession.selectList("yujindb.getTotalHotelList",paramap);
	      return list;
	   }

	   @Override
	   public List<HotelRoomVO> getlist(HashMap<String, String> paramap) {
	      List<HotelRoomVO> list = sqlsession.selectList("yujindb.getlist",paramap);
	      return list;
	   }

}
