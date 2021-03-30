package com.biz;

import java.util.List;
import java.util.Map;

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
}
