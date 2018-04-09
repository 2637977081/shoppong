package com.hzyc.shopping.po;

public class Adv {
	private String id;
	private String mark;
	private String path;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMark() {
		return mark;
	}
	
	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	@Override
	public String toString() {
		return "Adv [id=" + id + ", mark=" + mark + ", path=" + path + "]";
	}
	
	
}
