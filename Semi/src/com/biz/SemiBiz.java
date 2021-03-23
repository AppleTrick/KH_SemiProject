package com.biz;

import java.util.List;

import com.dao.SemiDao;
import com.dto.SemiDto;

public class SemiBiz {

	SemiDao dao = new SemiDao();
	
	public List<SemiDto> selectList(){
		return dao.selectList();
	}
	
	public SemiDto selectOne(int boardseq) {
		return dao.selectOne(boardseq);
	}
	public int insert(SemiDto dto) {
		return dao.insert(dto);
	}
	
	public int update(SemiDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int seq) {
		return dao.delete(seq);
	}

}
