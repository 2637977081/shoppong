package com.hzyc.shopping.po;

public class Goods {
	private String gId;
	private String gName;
	private String gKind;
	private String gNumber;
	private String gPrice;
	private String gBusiness;
	private String gImg;
	private String discount;
	private String descibe;
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getgName() {
		return gName;
	}
	public void setgName(String gName) {
		this.gName = gName;
	}
	public String getgKind() {
		return gKind;
	}
	public void setgKind(String gKind) {
		this.gKind = gKind;
	}
	public String getgNumber() {
		return gNumber;
	}
	public void setgNumber(String gNumber) {
		this.gNumber = gNumber;
	}
	public String getgPrice() {
		return gPrice;
	}
	public void setgPrice(String gPrice) {
		this.gPrice = gPrice;
	}
	public String getgBusiness() {
		return gBusiness;
	}
	public void setgBusiness(String gBusiness) {
		this.gBusiness = gBusiness;
	}
	public String getgImg() {
		return gImg;
	}
	public void setgImg(String gImg) {
		this.gImg = gImg;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public String getDescibe() {
		return descibe;
	}
	public void setDescibe(String descibe) {
		this.descibe = descibe;
	}
	@Override
	public String toString() {
		return "Goods [descibe=" + descibe + ", discount=" + discount
				+ ", gBusiness=" + gBusiness + ", gId=" + gId + ", gImg="
				+ gImg + ", gKind=" + gKind + ", gName=" + gName + ", gNumber="
				+ gNumber + ", gPrice=" + gPrice + "]";
	}
	
	
}
