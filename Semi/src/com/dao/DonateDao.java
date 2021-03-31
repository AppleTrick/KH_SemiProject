package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.db.SqlMapConfig;
import com.dto.DonateDto;

public class DonateDao extends SqlMapConfig {

	private String namespace = "donatemapper.";
	// 결제정보 db저장
	public int insertDonate(DonateDto dto) {
		
		int res = 0;
		System.out.println(dto);
		
		try (SqlSession session = getSqlSessionFactory().openSession(false)) {
			res = session.insert(namespace + "insert", dto);
			if (res > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	// 결제 내역 호출
	public List<DonateDto> selectList() {
		
		List<DonateDto> list = new ArrayList<DonateDto>();
		
		try (SqlSession session = getSqlSessionFactory().openSession(true);) {
			list = session.selectList(namespace + "selectOne");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
