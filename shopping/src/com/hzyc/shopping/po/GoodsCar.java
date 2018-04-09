package com.hzyc.shopping.po;

public class GoodsCar {
	private int id;
	private String userName;
	private String goodId;
	private String number;
	private String money;
	private String mark;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}
	public String getMark() {
		return mark;
	}
	@Override
	public String toString() {
		return "GoodsCar [goodId=" + goodId + ", id=" + id + ", mark=" + mark
				+ ", money=" + money + ", number=" + number + ", userName="
				+ userName + "]";
	}
	
	
}
