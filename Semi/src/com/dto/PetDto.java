package com.dto;

import java.sql.Date;

public class PetDto {
	
	private int brd_no;
	private int article_no;
	private String mem_writer;
	private String title;
	private String content;
	private Date regdate;
	private int hit;
	
	public PetDto() {
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

	public String getMem_writer() {
		return mem_writer;
	}

	public void setMem_writer(String mem_writer) {
		this.mem_writer = mem_writer;
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
