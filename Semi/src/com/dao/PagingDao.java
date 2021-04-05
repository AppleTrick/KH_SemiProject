package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.BoardDto;

public class PagingDao extends SqlMapConfig {
	
	String namespace = "boardmapper.";

	// ================= select list with pagination ================= //
	public List<BoardDto> pagingList(int startRow, int endRow) {
		List<BoardDto> list = new ArrayList<BoardDto>();
		endRow += startRow;
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		System.out.println("dao"+map);
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			list = session.selectList(namespace+"paginglist", map);
			System.out.println("dao"+list);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}

	public int getTotalCount(){
		int total = 0;

		SqlSession session = null;
		
		try {
			session = getSqlSessionFactory().openSession(true);
			total = session.selectOne(namespace+"count");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return total;
	}



}
