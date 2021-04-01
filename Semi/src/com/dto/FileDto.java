package com.dto;

public class FileDto {

	private String file_name; 
	private String file_realname;
	
	
	public FileDto() {
		
	}


	public FileDto(String file_name, String file_realname) {
		this.file_name = file_name;
		this.file_realname = file_realname;
	}


	public String getFile_name() {
		return file_name;
	}


	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}


	public String getFile_realname() {
		return file_realname;
	}


	public void setFile_realname(String file_realname) {
		this.file_realname = file_realname;
	}
	
	
	
	
	
	
	
}
