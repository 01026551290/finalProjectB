package com.spring.god.jinsoo.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class JinsooDAO implements InterJinsooDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 차트:  성별 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> getGenderCntList() {
		
		List<HashMap<String, String>> genderList = sqlsession.selectList("jinsoodb.getGenderCntList");
		return genderList;
	}

	// 관리자 로그인하기
	@Override
	public JinsooadminVO adminLogin(HashMap<String, String> adminmap) {
		JinsooadminVO adminvo = sqlsession.selectOne("jinsoodb.adminLogin", adminmap);
		return adminvo;
	}

}
