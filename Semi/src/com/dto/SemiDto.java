package com.dto;

import java.sql.Date;

public class SemiDto {
	
	private int brd_no;
	private int article_no;
	private String admin_writer;
	private String title;
	private String content;
	private Date regdate;
	private int hit;
	
	public SemiDto() {
		
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}


}
