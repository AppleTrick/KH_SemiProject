package com.biz;

import java.util.List;

import com.dao.SemiDao;
import com.dto.Criteria;
import com.dto.SemiDto;

public class SemiBiz {

	SemiDao dao = new SemiDao();
	
	public List<SemiDto> list(Criteria cri){
		return dao.list(cri);
	}
	
	public int listCount() {
		return dao.listCount();
	}
	
	public SemiDto selectOne(int seq) {
		return dao.selectOne(seq);
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

	public static SemiBiz getInstance() {
		return null;
	}

	public List<SemiDto> selectAllLendingPossibleBook(int offset, int recordsPerPage) {
		return null;
	}

	public Object getBookDao() {
		return null;
	}

}
