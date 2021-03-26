package com.dto;

import java.sql.Date;

public class SemiDto {
	
	private int brd_no;
	private int article_no;
	private String admin_writer;
	private String notice_title;
	private String notice_content;
	private Date notice_regdate;
	private int notice_hit;
	
	public SemiDto() {
		
	}

	public SemiDto(int brd_no, int article_no, String admin_writer, String notice_title, String notice_content,
			Date notice_regdate, int notice_hit) {
		this.brd_no = brd_no;
		this.article_no = article_no;
		this.admin_writer = admin_writer;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_regdate = notice_regdate;
		this.notice_hit = notice_hit;
	}

	public int getBrd_no() {
		return brd_no;
	}

	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}

	public int getArticle_no() {
		return article_no;
	}

	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}

	public String getAdmin_writer() {
		return admin_writer;
	}

	public void setAdmin_writer(String admin_writer) {
		this.admin_writer = admin_writer;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public Date getNotice_regdate() {
		return notice_regdate;
	}

	public void setNotice_regdate(Date notice_regdate) {
		this.notice_regdate = notice_regdate;
	}

	public int getNotice_hit() {
		return notice_hit;
	}

	public void setNotice_hit(int notice_hit) {
		this.notice_hit = notice_hit;
	}
	
	

}
