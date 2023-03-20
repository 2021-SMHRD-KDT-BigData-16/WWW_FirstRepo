package com.smhrd.model;

public class communityDTO {
	private int c_index;
	private String nickname;
	private String content;
	private String hashtag;
	private int like_count;
	private String cdate;
	
	// 기본 생성자
	
	public communityDTO() {
		
	}
	// 생성자

	public communityDTO(int c_index, String nickname, String content, String hashtag, int like_count, String cdate) {
		super();
		this.c_index = c_index;
		this.nickname = nickname;
		this.content = content;
		this.hashtag = hashtag;
		this.like_count = like_count;
		this.cdate = cdate;
	}

	// getter, setter method
	public int getC_index() {
		return c_index;
	}

	public void setC_index(int c_index) {
		this.c_index = c_index;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	

}
