package com.spring.god.jinsoo.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.jinsoo.model.InterJinsooDAO;
import com.spring.god.jinsoo.model.JinsooadminVO;

@Service
public class JinsooService implements InterJinsooService {

	@Autowired
	private InterJinsooDAO dao;

	// 차트:  성별 JSON으로 얻어오기
	@Override
	public List<HashMap<String, String>> getGenderCntList() {
		
		List<HashMap<String, String>> genderList = dao.getGenderCntList();
		return genderList;
	}

	// 관리자 로그인하기
	@Override
	public JinsooadminVO adminLogin(HashMap<String, String> adminmap) {
		JinsooadminVO adminvo = dao.adminLogin(adminmap);
		return adminvo;
	}
	
}
