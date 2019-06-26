package com.spring.bbs;

public class PageMaker {
	public static final int WRITING_PER_PAGE = 10;
	
	private int pageCnt; // 총 페이지 개수
	private int startIndex; // 게시글 시작 번호
	private int endIndex;
	private int startPage; // 페이지 시작 번호
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
	
	// 게시글 시작번호, 끝 번호 구하기
	public void getIndex(int curPage) {
		this.startIndex = WRITING_PER_PAGE * (curPage - 1) + 1;
		this.endIndex = WRITING_PER_PAGE * curPage;
	}
	
	// 페이지 시작번호, 끝 번호 구하기
	public void getPageIndex(int curPage, int pageCnt) {
		this.endPage = (int) Math.ceil(curPage / 10.0) * 10;
		this.startPage = this.endPage - WRITING_PER_PAGE + 1;
		
		// 페이지 총 개수보다 endPage가 크다면
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
