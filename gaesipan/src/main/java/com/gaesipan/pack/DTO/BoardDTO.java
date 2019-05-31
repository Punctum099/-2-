package com.gaesipan.pack.DTO;

import java.util.Date;

public class BoardDTO {

	private String seq;
	private String title;
	private String contents;
	private String author;
	private String hit;
	private Date time;
	private Date UPtime;
	private String see;
	private String listType;
	private String MTtime;
	
	public BoardDTO(String seq, String title, String contents, String author, String hit, 
			Date time, Date UPtime, String see, String listType, String MTtime) {
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.author = author;
		this.hit = hit;
		this.time = time;
		this.UPtime = UPtime;
		this.see = see;
		this.listType = listType;
		this.MTtime = MTtime;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getHit() {
		return hit;
	}

	public void setHit(String hit) {
		this.hit = hit;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Date getUPtime() {
		return UPtime;
	}

	public void setUPtime(Date UPtime) {
		this.UPtime = UPtime;
	}

	public String getSee() {
		return see;
	}

	public void setSee(String see) {
		this.see = see;
	}
	
	public String getMTtime() {
		return MTtime;
	}

	public void setMTtime(String mTtime) {
		MTtime = mTtime;
	}
}
