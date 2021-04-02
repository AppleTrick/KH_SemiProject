package com.dto;

import java.util.Date;

public class BoardDto {
	
	private int article_no; 
	private int brd_no; 
	private int mem_no; 
	private String title; 
	private String content;
	private Date regdate; 
	private int hit; 
	private String image; 
	private String mem_name;
	
	
	public BoardDto() {
		
	}


	public BoardDto(int article_no, int brd_no, int mem_no, String title, String content, Date regdate, int hit,
			String image, String mem_name) {
		super();
		this.article_no = article_no;
		this.brd_no = brd_no;
		this.mem_no = mem_no;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.hit = hit;
		this.image = image;
		this.mem_name= mem_name;
	}

	
	public String getMem_name() {
		return mem_name;
	}


	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}


	public int getArticle_no() {
		return article_no;
	}


	public void setArticle_no(int article_no) {
		this.article_no = article_no;
	}


	public int getBrd_no() {
		return brd_no;
	}


	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}


	public int getMem_no() {
		return mem_no;
	}


	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
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


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}
	
	

}
