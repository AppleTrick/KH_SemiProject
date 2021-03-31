package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.PetDto;

public class PetDao extends SqlMapConfig {
	
	public List<PetDto> selectList(){
		SqlSession session = null;
		List<PetDto> list = new ArrayList<PetDto>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList("petmapper.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
		session.close();
		}
		
		return list;
	}
	
	public List<PetDto> select2(){
		SqlSession session = null;
		List<PetDto> list = new ArrayList<PetDto>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList("petmapper.select2");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
		session.close();
		}
		
		return list;
	}
	
	public List<PetDto> select3(){
		SqlSession session = null;
		List<PetDto> list = new ArrayList<PetDto>();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			list = session.selectList("petmapper.select3");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		
		session.close();
		}
		
		return list;
	}
	
	public PetDto selectOne(int seq) {
		SqlSession session = null;
		PetDto dto = new PetDto();
		
		try {
			session = getSqlSessionFactory().openSession(true);
			dto = session.selectOne("petmapper.selectOne", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}session.close();
		
		return dto;
	}
	
	public int insert(PetDto dto) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("petmapper.insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int insertWait(PetDto dto) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("petmapper.insertWait", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	public int update(PetDto dto) {
		
		int res=0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.insert("petmapper.update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return res;
	}
		
	public int delete(int seq) {
		
		int res = 0;
		
		try {
			SqlSession session = getSqlSessionFactory().openSession(true);
			res = session.delete("petmapper.delete", seq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

}
