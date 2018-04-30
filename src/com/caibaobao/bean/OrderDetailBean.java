package com.caibaobao.bean;

//存储单个订单详情
public class OrderDetailBean {

	private String OrderID;
	private String Name;
	private int DetailQuantity;
	private int DetailPrice;
	private String percent;

	//订单编号
	public String getorderid() {
		return OrderID;
	}
	public void setorderid(String id) {
		this.OrderID=id;
	}
	//菜名
	public String getname() {
		return Name;
	}
	public void setname(String name) {
		this.Name = name;
	}
	//订单单行商品总数
	public int getdetailquantity() {
		return DetailQuantity;
	}
	public void setdetailquantity(int quantity) {
		this.DetailQuantity = quantity;
	}
	//单行价钱
	public int getdetailprice() {
		return DetailPrice;
	}
	public void setdetailprice(int price) {
		this.DetailPrice=price;
	}
	//比率
	public String getpercent() {
		return percent;
	}
	public void setpercent(String percent) {
		this.percent=percent;
	}
}
