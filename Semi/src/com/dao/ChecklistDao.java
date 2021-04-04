package com.dao;

import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.ChecklistDto;

public class ChecklistDao extends SqlMapConfig{
	
	public int insert(ChecklistDto dto) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("checklist.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
