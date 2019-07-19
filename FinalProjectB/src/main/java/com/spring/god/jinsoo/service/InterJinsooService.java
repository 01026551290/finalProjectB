package com.spring.god.jinsoo.service;

import java.util.HashMap;
import java.util.List;

import com.spring.god.jinsoo.model.JinsooadminVO;

public interface InterJinsooService {

	// 차트:  성별 JSON으로 얻어오기
	List<HashMap<String, String>> getGenderCntList();

	// 관리자 로그인하기
	JinsooadminVO adminLogin(HashMap<String, String> adminmap);

}
