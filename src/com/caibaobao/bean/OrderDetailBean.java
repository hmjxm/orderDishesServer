package com.caibaobao.bean;

//�洢������������
public class OrderDetailBean {

	private String OrderID;
	private String Name;
	private int DetailQuantity;
	private int DetailPrice;
	private String percent;

	//�������
	public String getorderid() {
		return OrderID;
	}
	public void setorderid(String id) {
		this.OrderID=id;
	}
	//����
	public String getname() {
		return Name;
	}
	public void setname(String name) {
		this.Name = name;
	}
	//����������Ʒ����
	public int getdetailquantity() {
		return DetailQuantity;
	}
	public void setdetailquantity(int quantity) {
		this.DetailQuantity = quantity;
	}
	//���м�Ǯ
	public int getdetailprice() {
		return DetailPrice;
	}
	public void setdetailprice(int price) {
		this.DetailPrice=price;
	}
	//����
	public String getpercent() {
		return percent;
	}
	public void setpercent(String percent) {
		this.percent=percent;
	}
}
