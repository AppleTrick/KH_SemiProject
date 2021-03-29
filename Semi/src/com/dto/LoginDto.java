package com.dto;

public class LoginDto {
	
	//MEM_NO, MEM_ID, MEM_PW, MEM_NAME,MEM_NICKNAME , MEM_PHONE, MEM_ADDR, MEM_EMAIL, MEM_ENABLED,MEM_ROLE, MEM_IMAGE
	private int mem_no; 
	private String mem_id;
	private String mem_pw;
	private String mem_name; 
	private String mem_nickname;
	private String mem_phone;
	private String mem_addr;
	private String mem_email;
	private String mem_enabled;
	private String mem_role;
	private String mem_image;
	
	

	
	
	

	public LoginDto() {

	}
	
	


	public LoginDto(int mem_no, String mem_id, String mem_pw, String mem_name, String mem_nickname, String mem_phone,
			String mem_addr, String mem_email, String mem_enabled, String mem_role, String mem_image) {
		this.mem_no = mem_no;
		this.mem_id = mem_id;
		this.mem_pw = mem_pw;
		this.mem_name = mem_name;
		this.mem_nickname = mem_nickname;
		this.mem_phone = mem_phone;
		this.mem_addr = mem_addr;
		this.mem_email = mem_email;
		this.mem_enabled = mem_enabled;
		this.mem_role = mem_role;
		this.mem_image = mem_image;
	}


	public int getMem_no() {
		return mem_no;
	}


	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}


	public String getMem_id() {
		return mem_id;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public String getMem_pw() {
		return mem_pw;
	}


	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}


	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public String getMem_nickname() {
		return mem_nickname;
	}


	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}


	public String getMem_phone() {
		return mem_phone;
	}


	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}


	public String getMem_addr() {
		return mem_addr;
	}


	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}


	public String getMem_email() {
		return mem_email;
	}


	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}


	public String getMem_enabled() {
		return mem_enabled;
	}


	public void setMem_enabled(String mem_enabled) {
		this.mem_enabled = mem_enabled;
	}


	public String getMem_role() {
		return mem_role;
	}


	public void setMem_role(String mem_role) {
		this.mem_role = mem_role;
	}


	public String getMem_image() {
		return mem_image;
	}


	public void setMem_image(String mem_image) {
		this.mem_image = mem_image;
	}
	
	

	
	
	

}
