package com.spring.god.bora.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoraDAO implements InterBoraDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	
	// === 검색어 입력시 자동글 완성하기 5 ===
	@Override
	public List<String> wordNameSearchView(String searchWord) {
		List<String> wordList = sqlsession.selectList("boradb.wordNameSearchView", searchWord);
		return wordList;
	}
	@Override
	public List<String> wordAddrSearchView(String searchWord) {
		List<String> wordList = sqlsession.selectList("boradb.wordAddrSearchView", searchWord);
		return wordList;
	}
	
}
