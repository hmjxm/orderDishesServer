package com.caibaobao.bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Dao {
	private Connection conn = null;
	 private ResultSet rs = null;
	 private PreparedStatement pstmt = null;

	 public Connection getConn() { //连接数据库
	  try {
	   Class.forName("com.mysql.jdbc.Driver");
	   String test = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
	     conn= DriverManager.getConnection(test, "root", "1234");
	  } catch (ClassNotFoundException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  } catch (SQLException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  }
	  return conn;
	 }

	 public boolean validateLogin(String username, String userpassword, String usertype) {
	  boolean flag = false;
	  String sql = "select * from logininfo where LoginID =? and Password =? and Type=?";
	  conn = getConn(); 
	  try {
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, username);
	   pstmt.setString(2, userpassword);
	   pstmt.setString(3,usertype);
	   
	   rs = pstmt.executeQuery();
	   if (rs.next()) {
	    flag = true;  //验证成功
	   }
	  } catch (SQLException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  } finally {
	   if (rs != null)
	    try {
	     rs.close();
	    } catch (SQLException e) {
	     // TODO Auto-generated catch block
	     e.printStackTrace();
	    } finally {
	     rs = null;
	    }
	   if (pstmt != null)
	    try {
	     pstmt.close();
	    } catch (SQLException e) {
	     // TODO Auto-generated catch block
	     e.printStackTrace();
	    } finally {
	     pstmt = null;
	    }
	   if (conn != null)
	    try {
	     conn.close();
	    } catch (SQLException e) {
	     // TODO Auto-genserated catch block
	     e.printStackTrace();
	    } finally {
	     conn = null;
	    }
	  }
	  return flag;
	 }
	 
	 //一级下拉列表中的内容
	 public ArrayList<String> getType(){
		 
		 ArrayList<String> TypeList=new ArrayList<String>();
		
		 String sql = "select distinct DishesType from dishes";
		 conn = getConn(); 
			//获得prepareStatement对象
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
	                TypeList.add(rs.getString("DishesType"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				try{
					pstmt.close();
					conn.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
	      return TypeList;
		}
	
 //获取所有菜名
public ArrayList<String> getName(){
		 
		 ArrayList<String> NameList=new ArrayList<String>();
		
		 String sql = "select DishesName from dishes";
		 conn = getConn(); 
			//获得prepareStatement对象
			try {
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				while(rs.next()){
	                NameList.add(rs.getString("DishesName"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				try{
					pstmt.close();
					conn.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
	      return NameList;
		}

	 
	 //二级下拉列表中的内容
	 
	 public ArrayList<JavaBean> getItem(String type){

		 ArrayList<JavaBean> list=new ArrayList<JavaBean>();

		 String sql = "select * from dishes where DishesType=?";
		 conn = getConn(); 
			//获得prepareStatement对象
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, type);
				rs=pstmt.executeQuery();
				
				while(rs.next()){
					JavaBean jBean=new JavaBean();		
					jBean.setdishesname(rs.getString("DishesName"));		
					list.add(jBean);			
				}	

			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				try{
					pstmt.close();
					conn.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
	      return list;
		}
	 
	 //获取单个菜品信息
	 public JavaBean getDishInfo(String dishname){

		JavaBean jBean=new JavaBean();

		 String sql = "select * from dishes where DishesName=?";
		 conn = getConn(); 
			//获得prepareStatement对象
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dishname);
				rs=pstmt.executeQuery();
				
				while(rs.next()){	
					jBean.setdishesname(rs.getString("DishesName"));		
		            jBean.setdishesprice(rs.getInt("DishesPrice"));
		            jBean.setdishespicture(rs.getString("DishesPicture"));
		            jBean.setdishesintro(rs.getString("DishesIntro"));
		            jBean.setdishesflag(rs.getString("DishesFlag"));
				}
			

			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				try{
					pstmt.close();
					conn.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
	      return jBean;
		}
	 
	 
	 
	//订单页面下拉列表中的内容 
		 public ArrayList<String> getorderid(int deskid){
			 ArrayList<String> list=new ArrayList<String>();

			 String sql = "select OrderID from orders where DeskID=?";
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, deskid);
					rs=pstmt.executeQuery();
					
					while(rs.next()){		
						list.add(rs.getString("OrderID"));			
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
		      return list;
			}
		 
		 //订单页面订单详情
		 public ArrayList<OrderDetailBean> getOrderDetail(String orderid){
			 ArrayList<OrderDetailBean> list=new ArrayList<OrderDetailBean>();

			 String sql = "select * from orderdetail where OrderID=?";
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, orderid);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						OrderDetailBean oBean=new OrderDetailBean();		
						oBean.setname(rs.getString("Name"));
						oBean.setdetailquantity(rs.getInt("DetailQuantity"));
						oBean.setdetailprice(rs.getInt("DetailPrice"));
						list.add(oBean);			
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
			
		      return list;
			}
		 //根据菜品名称得到单价
		 //订单页面订单详情
		 public int getdetailprice(String dishesname){
			 String sql = "select DishesPrice from dishes where DishesName=?";
			 int price=0;
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, dishesname);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
					price=rs.getInt("DishesPrice");		
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
				return price;
			}
		 
		 //获取总营业额
		 public int gettotalprice(){
			 
			 //获取当前月日
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MMdd");
			 java.util.Date currTime = new java.util.Date();
			 String curTime = formatter.format(currTime);

			 String sql = "select sum(OrderAmount) from orders where OrderID like '_"+curTime+"%'";
			 int price=0;
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
					price=rs.getInt(1);		
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
				return price;
			}
		 
		 
		 //获取商品销售详情,按照价格排序
		 public ArrayList<OrderDetailBean> getdishesamount(){
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MMdd");
			 java.util.Date currTime = new java.util.Date();
			 String curTime = formatter.format(currTime);
			 ArrayList<OrderDetailBean> list=new ArrayList<OrderDetailBean>();
			 Dao dao=new Dao();
             int totalprice=dao.gettotalprice();
			 String sql = "select Name,sum(DetailQuantity),sum(DetailPrice) as total from orderdetail where OrderID like '_"+curTime+"%' group by Name order by total desc";
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						OrderDetailBean oBean=new OrderDetailBean();		
						oBean.setname(rs.getString("Name"));
						oBean.setdetailquantity(rs.getInt(2));
						int per=rs.getInt(3);
						NumberFormat numberFormat = NumberFormat.getInstance();  
					    numberFormat.setMaximumFractionDigits(2);  
			         String result = numberFormat.format((float) per / (float)totalprice  * 100);   
						oBean.setdetailprice(rs.getInt(3));
						oBean.setpercent("" + result + "%");
						list.add(oBean);			
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}	
				}
		      return list;
			}
		 //获取商品销售详情,按照销量排序
		 public ArrayList<OrderDetailBean> getdishesamount2(){
			 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("MMdd");
			 java.util.Date currTime = new java.util.Date();
			 String curTime = formatter.format(currTime);
			 ArrayList<OrderDetailBean> list=new ArrayList<OrderDetailBean>();
			 Dao dao=new Dao();
             int totalprice=dao.gettotalprice();
			 String sql = "select Name,sum(DetailQuantity) as total,sum(DetailPrice) from orderdetail where OrderID like '_"+curTime+"%' group by Name order by total desc";
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
						OrderDetailBean oBean=new OrderDetailBean();		
						oBean.setname(rs.getString("Name"));
						oBean.setdetailquantity(rs.getInt(2));
						int per=rs.getInt(3);
						NumberFormat numberFormat = NumberFormat.getInstance();  
					    numberFormat.setMaximumFractionDigits(2);  
			         String result = numberFormat.format((float) per / (float)totalprice  * 100);   
						oBean.setdetailprice(rs.getInt(3));
						oBean.setpercent("" + result + "%");
						list.add(oBean);			
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}	
				}
		      return list;
			}
		 
		 //得到下单时间
		 public Timestamp getordertime(String orderid){
			 String sql = "select OrderDate from orders where OrderID=?";
			 Timestamp date = null;
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, orderid);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
				     date=rs.getTimestamp(1);		     
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
				return date;
			}
		 //得到下单时间
		 public int  getorderamount(String orderid){
			 String sql = "select OrderAmount from orders where OrderID=?";
			 int price=0;
			 conn = getConn(); 
				//获得prepareStatement对象
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, orderid);
					rs=pstmt.executeQuery();
					
					while(rs.next()){
				     price=rs.getInt(1);	     
					}	

				} catch (SQLException e) {
					e.printStackTrace();
				}
				finally{
					try{
						pstmt.close();
						conn.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
				}
				return price;
			}
		
		 
}
