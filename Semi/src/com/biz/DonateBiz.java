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
	public List<DonateDto> pagingList(int startRow, int endRow, String donate_phone) {
		return dao.pagingList(startRow, endRow, donate_phone);
	}
	public String getTotalCount(String donate_phone) {
		return dao.getTotalCount(donate_phone);
	}
}
