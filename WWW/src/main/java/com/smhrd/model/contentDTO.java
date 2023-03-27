package com.smhrd.model;

public class contentDTO {
	
	//content table columns
	private int v_idx;
	private String v_title;
	private String v_genre;
	private int v_year;
	private String v_synopsis;
	private double rating;
	private int v_grade;
	private String v_iframe;
	
	public contentDTO() {
		
	}
	
	public contentDTO(int v_idx, String v_title, String v_genre, int v_year, String v_synopsis, double rating,
			int v_grade, String v_iframe) {
		super();
		this.v_idx = v_idx;
		this.v_title = v_title;
		this.v_genre = v_genre;
		this.v_year = v_year;
		this.v_synopsis = v_synopsis;
		this.rating = rating;
		this.v_grade = v_grade;
		this.v_iframe = v_iframe;
	}

	public int getV_idx() {
		return v_idx;
	}
	public void setV_idx(int v_idx) {
		this.v_idx = v_idx;
	}
	public String getV_title() {
		return v_title;
	}
	public void setV_title(String v_title) {
		this.v_title = v_title;
	}
	public String getV_genre() {
		return v_genre;
	}
	public void setV_genre(String v_genre) {
		this.v_genre = v_genre;
	}
	public int getV_year() {
		return v_year;
	}
	public void setV_year(int v_year) {
		this.v_year = v_year;
	}
	public String getV_synopsis() {
		return v_synopsis;
	}
	public void setV_synopsis(String v_synopsis) {
		this.v_synopsis = v_synopsis;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public int getV_grade() {
		return v_grade;
	}
	public void setV_grade(int v_grade) {
		this.v_grade = v_grade;
	}
	public String getV_iframe() {
		return v_iframe;
	}
	public void setV_iframe(String v_iframe) {
		this.v_iframe = v_iframe;
	}
	
	
	
	
}
