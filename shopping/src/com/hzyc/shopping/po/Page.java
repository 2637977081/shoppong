package com.hzyc.shopping.po;


public class Page {

	private int total;//����Ϣ��
	private int currentPage=1;//��ǰҳ
	private int size=7;//һҳ��Ϣ��
	private int position;//��ʼλ��
	private int totalPage;//��ҳ��
	
	public void calculatePosition(){
		//���� ��ʼҳ=����ǰҳ-1��*ҳ��Ϣ��
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
