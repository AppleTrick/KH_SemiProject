package com.biz;

import com.dao.LoginDao;
import com.dto.LoginDto;

public class LoginBiz {

	LoginDao dao = new LoginDao();

	public LoginDto login(String mem_id, String mem_pw) {

		return dao.login(mem_id, mem_pw);

	}
	
	public LoginDto snslogin(String mem_email) {

		return dao.snslogin(mem_email);

	}
	
	
	

	public int idCheck(String mem_id) {

		return dao.idCheck(mem_id);
	}

	public int insertMember(LoginDto dto) {

		return dao.insertMember(dto);

	}

	public LoginDto selectMember(int mem_no) {

		return dao.selectMember(mem_no);
	}

	public int updateMember(LoginDto dto) {

		return dao.updateMember(dto);
	}

	public int deleteMember(int mem_no) {

		return dao.deleteMember(mem_no);

	}
	
	public int tokenchk(String mem_email) {
		return dao.tokenchk(mem_email);
	}

}
