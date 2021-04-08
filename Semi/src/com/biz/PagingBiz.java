package com.biz;

import java.util.List;

import com.dao.PagingDao;
import com.dto.BoardDto;

public class PagingBiz {
	
	PagingDao dao = new PagingDao();
	// 공지사항 관련 게시물 리스트 startRow 부터 endRow까지
	public List<BoardDto> pagingList(int startRow, int endRow) {
		return dao.pagingList(startRow, endRow);
	}
	// 공지사항 관련 게시물 갯수
	public int getTotalCount() {
		return dao.getTotalCount();
	}
	
}
