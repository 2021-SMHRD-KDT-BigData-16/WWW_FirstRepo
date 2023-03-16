package com.smhrd.model;

public class contentDTO {
	
	//content table columns
	private String content_index;
	private String title;
	private String genre;
	private int year;
	private String stove;
	private int c_score;
	private String age_class;
	
	// 기본 생성자
	public contentDTO() {
		
	}

	public contentDTO(String content_index, String title, String genre, int year, String stove, int c_score,
			String age_class) {
		super();
		this.content_index = content_index;
		this.title = title;
		this.genre = genre;
		this.year = year;
		this.stove = stove;
		this.c_score = c_score;
		this.age_class = age_class;
	}
	// Getter/Setter Method

	public String getContent_index() {
		return content_index;
	}

	public void setContent_index(String content_index) {
		this.content_index = content_index;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getStove() {
		return stove;
	}

	public void setStove(String stove) {
		this.stove = stove;
	}

	public int getC_score() {
		return c_score;
	}

	public void setC_score(int c_score) {
		this.c_score = c_score;
	}

	public String getAge_class() {
		return age_class;
	}

	public void setAge_class(String age_class) {
		this.age_class = age_class;
	}
	
	
	
	
}
