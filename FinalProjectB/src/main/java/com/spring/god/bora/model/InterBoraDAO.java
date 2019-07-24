package com.spring.god.bora.model;

import java.util.HashMap;
import java.util.List;

public interface InterBoraDAO {
	
	// 검색어 입력시 자동글 완성하기(숙박명)
	List<String> wordNameSearchView(String searchWord);
	// 검색어 입력시 자동글 완성하기(지역명)
	List<String> wordAddrSearchView(String searchWord);


}
