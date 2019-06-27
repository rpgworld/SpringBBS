package com.spring.bbs.dto;

public class PageMaker {
	private int perPage = 10;
	private int pageRange = 10;
	
	private int curPage;
	
	private int bbsCnt;
	private int pageCnt;
	
	private int startPage;
	private int endPage;
	
	private int startIndex;
	private int endIndex;
	
	private boolean prev;
	private boolean next;
	
	public PageMaker(int curPage, int bbsCnt) {
		this.curPage = curPage;
		this.pageCnt = (bbsCnt - 1) / perPage + 1;
		
		getIndex(curPage);
		getPageIndex(curPage, this.pageCnt);
		
		this.prev = curPage == 1 ? false : true;
		this.next = curPage == pageCnt ? false : true;
	}
	
	// 게시글 시작번호, 끝 번호 구하기
	public void getIndex(int curPage) {
		this.startIndex = perPage * (curPage - 1) + 1;
		this.endIndex = perPage * curPage;
	}
	
	// 페이지 시작번호, 끝 번호 구하기
	public void getPageIndex(int curPage, int pageCnt) {
		this.endPage = (int) Math.ceil(curPage / 10.0) * 10;
		this.startPage = this.endPage - perPage + 1;
		
		// 페이지 총 개수보다 endPage가 크다면
		if(this.endPage > pageCnt) {
			this.endPage = pageCnt;
		}
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getPageRange() {
		return pageRange;
	}

	public void setPageRange(int pageRange) {
		this.pageRange = pageRange;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getBbsCnt() {
		return bbsCnt;
	}

	public void setBbsCnt(int bbsCnt) {
		this.bbsCnt = bbsCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
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
