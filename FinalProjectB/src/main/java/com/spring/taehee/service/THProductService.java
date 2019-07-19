package com.spring.taehee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.taehee.model.THInterProductDAO;

@Service
public class THProductService<AES256> implements THInterProductService {

	// === 의존객체 주입하기(DI: Dependency Injection) ===
		@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
		private THInterProductDAO dao;


	
			// === 상세페이지용 이미지 파일을 가져오기 ===
			@Override
			public List<String> getDetailImgList() {
				List<String> DetailImgList = dao.getDetailImgList();		
				return DetailImgList;
			}
	
	
	
}
