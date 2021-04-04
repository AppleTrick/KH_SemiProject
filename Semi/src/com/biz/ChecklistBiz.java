package com.biz;

import com.dao.ChecklistDao;
import com.dto.ChecklistDto;

public class ChecklistBiz {
	
	ChecklistDao dao = new ChecklistDao();
	
	public int insert(ChecklistDto dto) {
		return dao.insert(dto);
	}

}
