package com.smhrd.model;

public class boardDTO {
	private int no_number;
	private String user_id;
	
	public int getNo_number() {
		return no_number;
	}
	
	public boardDTO(){
		
	}
	public boardDTO(int no_number, String user_id) {
		super();
		this.no_number = no_number;
		this.user_id = user_id;
	}

	public void setNo_number(int no_number) {
		this.no_number = no_number;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	

}
