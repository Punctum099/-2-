package com.gaesipan.pack.DTO;

import java.util.List;

public class bdtoCri {

	private String seq;
	private String see;
	private String listType;
	private int page;  		    // 보여줄 페이지 번호
	private int perPageNum;   // 페이지당 보여줄 게시글의 개수
	private List<bdtoCri> list;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSee() {
		return see;
	}
	public void setSee(String see) {
		this.see = see;
	}
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public List<bdtoCri> getList() {
		return list;
	}
	public void setList(List<bdtoCri> list) {
		this.list = list;
	}

}
