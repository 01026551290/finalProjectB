package com.spring.god.taehee.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public interface THInterProductDAO {

	// 글 보여주기
	THProductVO getView(String seq);
	
	// === 상세페이지용 이미지 파일을 가져오기 ===
	List<String> getDetailImgList();


	
	
	
	
}
