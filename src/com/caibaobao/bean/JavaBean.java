package com.caibaobao.bean;

public class JavaBean {
	private String DishesName;
	private String DishesType;
	private  int   DishesPrice;
	private String DishesPicture;
	private String DishesIntro;
	private String DishesFlag;
	
	public String getdishesname() {
		return DishesName;
	}
	public void setdishesname(String name) {
		this.DishesName=name;
	}
	
	public String getdishestype() {
		return DishesType;
	}
	public void setdishestype(String type) {
		this.DishesType = type;
	}
	
	public int getdishesprice() {
		return DishesPrice;
	}
	public void setdishesprice(int price) {
		this.DishesPrice = price;
	}
	
	public String getdishespicture() {
		return DishesPicture;
	}
	public void setdishespicture(String picture) {
		this.DishesPicture = picture;
	}
	public String getdishesintro() {
		return DishesIntro;
	}
	public void setdishesintro(String intro) {
		this.DishesIntro=intro;
	}
	public String getdishesflag() {
		return DishesFlag;
	}
	public void setdishesflag(String flag) {
		this.DishesFlag=flag;
	}
	
}
