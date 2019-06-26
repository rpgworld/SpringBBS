package com.spring.bbs;

public class PageMaker {
	public static final int WRITING_PER_PAGE = 10;
	
	private int pageCnt; // �� ������ ����
	private int startIndex; // �Խñ� ���� ��ȣ
	private int endIndex;
	private int startPage; // ������ ���� ��ȣ
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public PageMaker() {}
	
	public PageMaker(int curPage, int bbsCnt) {
		this.pageCnt = (bbsCnt - 1) / WRITING_PER_PAGE + 1;
		
		getIndex(curPage);
		getPageIndex(curPage, this.pageCnt);
		
		this.prev = curPage == 1 ? false : true;
		this.next = curPage == pageCnt ? false : true;
	}
	
	// �Խñ� ���۹�ȣ, �� ��ȣ ���ϱ�
	public void getIndex(int curPage) {
		this.startIndex = WRITING_PER_PAGE * (curPage - 1) + 1;
		this.endIndex = WRITING_PER_PAGE * curPage;
	}
	
	// ������ ���۹�ȣ, �� ��ȣ ���ϱ�
	public void getPageIndex(int curPage, int pageCnt) {
		this.endPage = (int) Math.ceil(curPage / 10.0) * 10;
		this.startPage = this.endPage - WRITING_PER_PAGE + 1;
		
		// ������ �� �������� endPage�� ũ�ٸ�
		if(this.endPage > pageCnt) {
			this.endPage = pageCnt;
		}
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	

}
