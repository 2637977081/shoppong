package com.hzyc.shopping.po;


public class Page {

	private int total;//总信息数
	private int currentPage=1;//当前页
	private int size=7;//一页信息数
	private int position;//起始位置
	private int totalPage;//总页数
	
	public void calculatePosition(){
		//更新 起始页=（当前页-1）*页信息数
		setPosition((getCurrentPage() - 1) * getSize());
	}
	
	public void pageUp(int nowPage){
		nowPage = nowPage <= 1 ? 1 : nowPage - 1;
		setCurrentPage(nowPage);
	}
	
	public void pageDown(int nowPage){
		nowPage = nowPage <=getTotalPage() ? getTotalPage():nowPage+1;
		setCurrentPage(nowPage);
	}
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	
}
