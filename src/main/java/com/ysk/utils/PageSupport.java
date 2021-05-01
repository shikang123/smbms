package com.ysk.utils;

public class PageSupport {
	//当前页码
	private int currentPageNo = 1;
	//总记录数
	private int totalCount;
	//页面容量
	private int pageSize = 6;
	//总页数（通过totalCount 与 pageSize 计算得来）
	private int totalPageCount;


	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		if(currentPageNo > 0 && currentPageNo <= totalPageCount){
			this.currentPageNo = currentPageNo;
		}
	}

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {	//设置总记录数，并计算出总页数
		if(totalCount > 0){
			this.totalCount = totalCount;
			this.setTotalPageCountByRs();
		}
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		if(pageSize > 0){
			this.pageSize = pageSize;
		}
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}
	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}
	public void setTotalPageCountByRs(){
		if(this.totalCount % this.pageSize == 0){
			this.totalPageCount = this.totalCount / this.pageSize;
		}else if(this.totalCount % this.pageSize > 0){
			this.totalPageCount = this.totalCount / this.pageSize + 1;
		}else{
			this.totalPageCount = 0;
		}
	}

	@Override
	public String toString() {
		return "PageSupport{" +
				"currentPageNo=" + currentPageNo +
				", totalCount=" + totalCount +
				", pageSize=" + pageSize +
				", totalPageCount=" + totalPageCount +
				'}';
	}
}