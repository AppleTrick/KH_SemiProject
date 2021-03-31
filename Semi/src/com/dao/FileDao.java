package com.dao;


import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.FileDto;
import com.dto.LoginDto;

public class FileDao extends SqlMapConfig {
	
	public int updateProfile(LoginDto dto) {
		
	
		int res = 0; 
		
		try(SqlSession session = getSqlSessionFactory().openSession(true);){
			
			res=session.update("filemapper.upload",dto);
		}catch(Exception e) {
			e.printStackTrace();
	
		}
		
		return res;
	}

}
