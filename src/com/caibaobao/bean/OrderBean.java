package com.caibaobao.bean;
import java.util.Date;
//����������
public class OrderBean {

		private String OrderID;
		private Date OrderDate;
		private  int OrderAmount;
		private String OrderState;
		private int DeskID;
	
		//�������
		public String getorderid() {
			return OrderID;
		}
		public void setorderid(String id) {
			this.OrderID=id;
		}
		//�µ�����
		public Date getorderdate() {
			return OrderDate;
		}
		public void setorderdate(Date date) {
			this.OrderDate = date;
		}
		//������Ʒ����
		public int getorderamount() {
			return OrderAmount;
		}
		public void setorderamount(int amount) {
			this.OrderAmount = amount;
		}
		//����״̬
		public String getorderstate() {
			return OrderState;
		}
		public void setorderstate(String state) {
			this.OrderState = state;
		}
		//��̨��
		public int getdeskid() {
			return DeskID;
		}
		public void setdeskid(int id) {
			this.DeskID=id;
		}
	
		
	
}
