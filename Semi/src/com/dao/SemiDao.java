package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.SemiDto;

public class SemiDao extends SqlMapConfig {
	
	public List<SemiDto> selectList(){
		SqlSession session = null;
		List<SemiDto> list = new ArrayList<SemiDto>();
		
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
	
	public SemiDto selectOne(int seq) {
		SqlSession session = null;
		SemiDto dto = new SemiDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("boardmapper.selectOne", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}session.close();
		
		return dto;
	}
	
	public int insert(SemiDto dto) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("boardmapper.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int update(SemiDto dto) {
		
		int res=0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("boardmapper.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return res;
	}
		
	public int delete(int seq) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.delete("boardmapper.delete", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	

}
