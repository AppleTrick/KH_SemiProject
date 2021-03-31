package com.biz;

import java.util.List;

import com.dao.PetDao;
import com.dto.PetDto;

public class PetBiz {
	PetDao dao = new PetDao();
	
	public List<PetDto> selectList(){
		return dao.selectList();
	}
	
	public PetDto selectOne(int seq) {
		return dao.selectOne(seq);
	}
	public int insert(PetDto dto) {
		return dao.insert(dto);
	}
	
	public int update(PetDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int seq) {
		return dao.delete(seq);
	}

}
