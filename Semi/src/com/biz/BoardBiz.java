package com.biz;

import java.util.List;

import com.dao.BoardDao;
import com.dto.BoardDto;

public class BoardBiz {

	BoardDao dao = new BoardDao();
	
	public List<BoardDto> selectList(){
		return dao.selectList();
	}
	
	public BoardDto selectOne(int article_no) {
		return dao.selectOne(article_no);
	}
	public int insert(BoardDto dto) {
		return dao.insert(dto);
	}
	
	public int update(BoardDto dto) {
		return dao.update(dto);
	}
	
	public int delete(int article_no) {
		return dao.delete(article_no);
	}

	
	
	
// 페이징 구현중...........	
//	public static BoardBiz getInstance() {
//		return null;
//	}
//
//	public List<SemiDto> selectAllLendingPossibleBook(int offset, int recordsPerPage) {
//		return null;
//	}
//
//	public Object getBookDao() {
//		return null;
//	}

}
