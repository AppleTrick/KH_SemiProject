package com.biz;

import com.dao.FileDao;
import com.dto.FileDto;
import com.dto.LoginDto;

public class FileBiz {
	FileDao dao = new FileDao();
	
	public int updateProfile(LoginDto dto) {
		return dao.updateProfile(dto);
	}

}
