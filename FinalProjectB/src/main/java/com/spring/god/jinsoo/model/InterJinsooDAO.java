package com.spring.god.jinsoo.model;

import java.util.HashMap;
import java.util.List;

public interface InterJinsooDAO {

	// 차트:  성별 JSON으로 얻어오기
	List<HashMap<String, String>> getGenderCntList();

	// 관리자 로그인하기
	JinsooadminVO adminLogin(HashMap<String, String> adminmap);
	
}
