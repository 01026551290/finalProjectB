package com.spring.god.taehee.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class THProductDAO implements THInterProductDAO{

	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private SqlSessionTemplate sqlsession;
	
	// 글 보여주기
	@Override
	public THProductVO getView(String seq) {
		THProductVO productvo = sqlsession.selectOne("product.getview", seq);
				return productvo;
	}

	@Override
	public List<String> getDetailImgList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
