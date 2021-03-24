package com.dao;

import java.util.HashMap;
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
			System.out.println("잘 나오니....? ");
			dto = session.selectOne("loginmapper.login",map);
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
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
		
		
	}
		
	
	//정보 조회 
	public LoginDto selectMember(int mem_no) {
		
		return null;
	}
	
	
	//정보 수정 
	public int updateMember(LoginDto dto) {
		
		
		
		return 0; 
	}
	
	//탈퇴
	public int deleteMember(int mem_no) {
		
		return 0;
		
	}
		
	
	}
