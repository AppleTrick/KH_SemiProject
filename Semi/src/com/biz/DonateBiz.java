package com.biz;

import java.util.List;

import com.dao.DonateDao;
import com.dto.DonateDto;

public class DonateBiz {

	DonateDao dao = new DonateDao();
	// 결제 내역 저장
	public int insertDonate(DonateDto dto) {
		
		return dao.insertDonate(dto);
	}
	// 결제 내역 호출
	public List<DonateDto> selectList() {
		return dao.selectList();
	}
	// 페이징
	public List<DonateDto> pagingList(int startRow, int endRow, String donate_phone) {
		return dao.pagingList(startRow, endRow, donate_phone);
	}
	// 페이징을 위해 파라미터 값을 받은 총 갯수
	public String getTotalCount(String donate_phone) {
		return dao.getTotalCount(donate_phone);
	}
}
