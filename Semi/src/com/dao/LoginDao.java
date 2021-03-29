package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.LoginDto;

//상속 필수 !! 

public class LoginDao extends SqlMapConfig {

	//사용자 로그인 기능 
	
	public LoginDto login(String mem_id, String mem_pw) {
		SqlSession session = null; 
		LoginDto dto = new LoginDto();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mem_id", mem_id);
		map.put("mem_pw", mem_pw);
		
		try {
			session = getSqlSessionFactory().openSession(true);
			
			dto = session.selectOne("loginmapper.login",map);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		
		
		return dto;
		
	}
	
	public LoginDto snslogin(String mem_email) {
		SqlSession session = null; 
		LoginDto dto = new LoginDto();
		
		
		
		
		try {
			session = getSqlSessionFactory().openSession(true);
			
			dto = session.selectOne("loginmapper.snslogin",mem_email);
			System.out.println(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
		
	}
	
	
	
	
	//id  중복체크
	public int idCheck(String mem_id) {
		
		SqlSession session = null; 
		//LoginDto dto = new LoginDto();
		int res = 0 ;
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			res = session.selectOne("loginmapper.idchk",mem_id);
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
	}
	
	//회원 가입
	public int insertMember(LoginDto dto) {
		int res = 0 ; 
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.insert("loginmapper.insertUser",dto);
			System.out.println(res);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
		
	}
		
	
	//정보 조회 
	public LoginDto selectMember(int mem_no) {
		
		SqlSession session = null; 
		LoginDto dto = new LoginDto();
		//int res = 0 ; 
		
		
		
		try {
			
			session = getSqlSessionFactory().openSession(true);
			System.out.println(mem_no);
			dto = session.selectOne("loginmapper.selectUser",mem_no);
			
			System.out.println("logindao. selectone"+dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return dto;
		
	}
	
	
	//정보 수정 
	public int updateMember(LoginDto dto) {
		int res = 0; 
		
		try(SqlSession session = getSqlSessionFactory().openSession(false);){
			
			
			res = session.update("loginmapper.updateMember",dto);
			if(res>0){
				session.commit();
				}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res; 
	}
	
	//탈퇴
	public int deleteMember(int mem_no) {
		int res = 0; 
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			res = session.insert("loginmapper.deleteUser",mem_no);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return res;
		
	}
	
	
	//sns login token check
	public int tokenchk(String mem_email) {
		
		SqlSession session = null; 
		//LoginDto dto = new LoginDto();
		int res = 0 ; 
		
		try {
			
			session = getSqlSessionFactory().openSession(false);
			res = session.selectOne("loginmapper.tokenchk",mem_email);
			if(res>0) {
				session.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res;
		
	}
	
	}
