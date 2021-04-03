package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.BoardDto;

public class BoardDao extends SqlMapConfig {

	
	
	public List<BoardDto> selectList(){
		SqlSession session = null;
		List<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList("boardmapper.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
		session.close();
		}
		
		return list;
	}
	
	public BoardDto selectOne(int article_no) {
		SqlSession session = null;
		BoardDto dto = new BoardDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("boardmapper.selectOne", article_no);
		} catch (Exception e) {
			e.printStackTrace();
		}session.close();
		
		return dto;
	}
	
	public int insert(BoardDto dto) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("boardmapper.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int update(BoardDto dto) {
		
		int res=0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("boardmapper.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return res;
	}
		
	public int delete(int article_no) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.delete("boardmapper.delete", article_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
}
