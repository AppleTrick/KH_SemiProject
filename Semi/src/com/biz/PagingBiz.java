package com.biz;

import java.util.List;

import com.dao.PagingDao;
import com.dto.BoardDto;

public class PagingBiz {
	
	PagingDao dao = new PagingDao();

	public List<BoardDto> pagingList(int startRow, int endRow) {
		return dao.pagingList(startRow, endRow);
	}
	public int getTotalCount() {
		return dao.getTotalCount();
	}
	
}
