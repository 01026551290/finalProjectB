package com.spring.god.hyein.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.hyein.model.InterBoardDAO;
import com.spring.god.common.AES256;

@Service
public class BoardService implements InterBoardService {

	// === #34. 의존객체 주입하기(DI: Dependency Injection) ===
	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private InterBoardDAO dao;
	
	//===== #45. 양방향 암호화 알고리즘인 AES256 를 사용하여 암호화/복호화 하기위한 클래스 의존객체 주입하기(DI: Dependency Injection) =====
	@Autowired
	private AES256 aes;
	
}
