package com.gaesipan.pack.DTO;

import java.util.Date;

public class CommentDTO {

	private String seq;
	private String board_seq;
	private String group_seq;
	private int level;
	private String contents;
	private String author;
	private Date time;
	private String see;
	
	public CommentDTO(String seq, String board_seq, String group_seq, int level, String contents, String author, Date time, String see) {
		this.seq = seq;
		this.board_seq = board_seq;
		this.group_seq = group_seq;
		this.level = level;
		this.contents = contents;
		this.author = author;
		this.time = time;
		this.see = see;
	}
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}
	public String getgroup_seq() {
		return group_seq;
	}
	public void setgroup_seq(String group_seq) {
		this.group_seq = group_seq;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getSee() {
		return see;
	}
	public void setSee(String see) {
		this.see = see;
	}
}
