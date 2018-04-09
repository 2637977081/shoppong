package com.hzyc.shopping.po;

public class UserRegister {
	private String Id;
	private String username;
	private String password;
	private String email;
	private String bankCard;
	private String name;
	private String idCard;
	private String indentity;
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmaild() {
		return email;
	}
	public void setEmaild(String email) {
		this.email = email;
	}
	public String getBankCard() {
		return bankCard;
	}
	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getIndentity() {
		return indentity;
	}
	public void setIndentity(String indentity) {
		this.indentity = indentity;
	}
	@Override
	public String toString() {
		return "UserRegister [Id=" + Id + ", bankCard=" + bankCard
				+ ", email=" + email + ", idCard=" + idCard + ", indentity="
				+ indentity + ", name=" + name + ", password=" + password
				+ ", username=" + username + "]";
	}
	
	
	
	
	
}
