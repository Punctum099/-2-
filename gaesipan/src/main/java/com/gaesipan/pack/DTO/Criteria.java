package com.gaesipan.pack.DTO;

//�Խ��� ����¡ �� �˻� ���� Ŭ����
//Criteria : ������ �ǹ̷δ� �˻�����, �з�����
public class Criteria {

	private int page;  		    // ������ ������ ��ȣ
	private int perPageNum;   // �������� ������ �Խñ��� ����
	private String option;   // �������� ������ �Խñ��� ����
	private String search;   // �������� ������ �Խñ��� ����
	
	
	public Criteria() {
		//���� �Խ��ǿ� ������ ���� ���ؼ� �⺻ ���� ���� �ؾ� �Ѵ�.
		this.page = 1;
		this.perPageNum = 18;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		
		this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	/* limit �������� ���� ��ġ�� ������ �� ���ȴ�. ���� ��� 10���� ����ϴ� ��� 3�������� �����ʹ� linit 20, 10 �� ���� ���°� �Ǿ�� �Ѵ�. */
	/* this.page �� 1�̸� 0�� �Ǿ�� �Ѵ� mysql limit 0, 10 �ؾ� ó������ 10���� ���´�. */
/* ���̹�Ƽ�� ��ȸ������ #{pageStart}�� ���޵ȴ�. */
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}
	
	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	@Override
	public String toString() {
		return "Criteria [page = " + page + ", perPageNum = " + perPageNum + ", option = " + option + ", search = " + search + "]";
	}
}
