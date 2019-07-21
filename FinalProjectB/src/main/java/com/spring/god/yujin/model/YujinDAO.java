package com.spring.god.yujin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class YujinDAO implements InterYujinDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<String> searchRoom() {
		List<String> list = sqlsession.selectList("yujindb.searchRoom"); 
		return list;
	}
	

}
