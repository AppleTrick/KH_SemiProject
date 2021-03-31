package com.dto;

import java.sql.Date;

public class PetDto {
	
	private int brd_no;
	private int article_no;
	private String mem_writer;
	private String pet_title;
	private String pet_content;
	private Date pet_regdate;
	private int pet_hit;
	
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

	public String getPet_title() {
		return pet_title;
	}

	public void setPet_title(String pet_title) {
		this.pet_title = pet_title;
	}

	public String getPet_content() {
		return pet_content;
	}

	public void setPet_content(String pet_content) {
		this.pet_content = pet_content;
	}

	public Date getPet_regdate() {
		return pet_regdate;
	}

	public void setPet_regdate(Date pet_regdate) {
		this.pet_regdate = pet_regdate;
	}

	public int getPet_hit() {
		return pet_hit;
	}

	public void setPet_hit(int pet_hit) {
		this.pet_hit = pet_hit;
	}
	
}
