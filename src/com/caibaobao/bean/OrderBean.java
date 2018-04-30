package com.caibaobao.bean;
import java.util.Date;
//构建订单类
public class OrderBean {

		private String OrderID;
		private Date OrderDate;
		private  int OrderAmount;
		private String OrderState;
		private int DeskID;
	
		//订单编号
		public String getorderid() {
			return OrderID;
		}
		public void setorderid(String id) {
			this.OrderID=id;
		}
		//下单日期
		public Date getorderdate() {
			return OrderDate;
		}
		public void setorderdate(Date date) {
			this.OrderDate = date;
		}
		//订单商品总数
		public int getorderamount() {
			return OrderAmount;
		}
		public void setorderamount(int amount) {
			this.OrderAmount = amount;
		}
		//订单状态
		public String getorderstate() {
			return OrderState;
		}
		public void setorderstate(String state) {
			this.OrderState = state;
		}
		//桌台号
		public int getdeskid() {
			return DeskID;
		}
		public void setdeskid(int id) {
			this.DeskID=id;
		}
	
		
	
}
