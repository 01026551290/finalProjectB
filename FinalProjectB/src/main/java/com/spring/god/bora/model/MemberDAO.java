package com.spring.god.bora.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.god.yujin.model.HistoryVO;

@Repository
public class MemberDAO implements InterMemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 예약유무 조회
	@Override
	public int reserveAddSelect(HistoryVO hvo) {
		int n = sqlsession.selectOne("boradb.reserveAddSelect", hvo);
		return n;
	}

	@Override
	public int reserveAddInsert1(HistoryVO hvo) {
		int n = sqlsession.insert("boradb.reserveAddInsert1", hvo);
		return n;
	}

	@Override
	public int reserveAddInsert2(HistoryVO hvo) {
		int n = sqlsession.insert("boradb.reserveAddInsert2", hvo);
		return n;
	}
	
	
	
	
}
