package com.spring.god.bora.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.bora.model.InterBoraDAO;


@Service
public class BoraService implements InterBoraService {
	
	@Autowired
	private InterBoraDAO dao;
	
	
	// === 검색어 입력시 자동글 완성하기 4 ===
	@Override
	public List<String> wordNameSearchView(String searchWord) {
		List<String> wordList = dao.wordNameSearchView(searchWord);
		return wordList;
	}
	@Override
	public List<String> wordAddrSearchView(String searchWord) {
		List<String> wordList = dao.wordAddrSearchView(searchWord);
		return wordList;
	}
	
}
