package com.dto;

import java.util.Date;

public class DonateDto {

	private int donate_no;
	private String donate_name;
	private String donate_phone;
	private String donate_type;
	private int donate_pay;
	private Date donate_date;
	
	public DonateDto() {

	}

	public DonateDto(int donate_no, String donate_phone, String donate_name, String donate_type, int donate_pay, Date donate_date) {
		this.donate_no = donate_no;
		this.donate_name = donate_name;
		this.donate_phone = donate_phone;
		this.donate_type = donate_type;
		this.donate_pay = donate_pay;
		this.donate_date = donate_date;
	}

	public String getDonate_phone() {
		return donate_phone;
	}

	public void setDonate_phone(String donate_phone) {
		this.donate_phone = donate_phone;
	}

	public int getDonate_no() {
		return donate_no;
	}

	public void setDonate_no(int donate_no) {
		this.donate_no = donate_no;
	}

	public String getDonate_name() {
		return donate_name;
	}

	public void setDonate_name(String donate_name) {
		this.donate_name = donate_name;
	}

	public String getDonate_type() {
		return donate_type;
	}

	public void setDonate_type(String donate_type) {
		this.donate_type = donate_type;
	}

	public int getDonate_pay() {
		return donate_pay;
	}

	public void setDonate_pay(int donate_pay) {
		this.donate_pay = donate_pay;
	}

	public Date getDonate_date() {
		return donate_date;
	}

	public void setDonate_date(Date donate_date) {
		this.donate_date = donate_date;
	}
	
	
}
