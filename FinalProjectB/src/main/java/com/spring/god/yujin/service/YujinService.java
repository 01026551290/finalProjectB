package com.spring.god.yujin.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.god.jinsoo.model.InterJinsooDAO;
import com.spring.god.jinsoo.model.JinsooadminVO;
import com.spring.god.yujin.model.InterYujinDAO;

@Service
public class YujinService implements InterYujinService {

	@Autowired
	private InterYujinDAO dao;

	@Override
	public List<String> searchRoom() {
		List<String> list = dao.searchRoom();
		return list;
	}

	
}
