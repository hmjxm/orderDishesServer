package com.caibaobao.bean;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class SqlBean {
	Connection con;
	PreparedStatement pre;
	ResultSet rs;  
	public SqlBean(){
        //连接数据库
		Dao dao = new Dao();
		con=dao.getConn();
	}

	//single search
	public ArrayList<JavaBean> getSingleSearch(String sql,String dishestype) throws Exception{
		
		ArrayList<JavaBean> list=new ArrayList<JavaBean>();
		//获得prepareStatement对象
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, dishestype);
			rs=pre.executeQuery();
			while(rs.next()){
				JavaBean jBean=new JavaBean();		
				jBean.setdishesname(rs.getString("DishesName"));		
               // jBean.setdishestype(rs.getString("DishesType"));
                jBean.setdishesprice(rs.getInt("DishesPrice"));
                String picture=rs.getString("DishesPicture");
                System.out.println("图片为："+picture);
                String url="http://10.169.162.122:8080/cbb+book/"+picture;
                jBean.setdishespicture(url);
                jBean.setdishesintro(rs.getString("DishesIntro"));
				list.add(jBean);
			}	
		} catch (SQLException e) {
			// TODO 自动生成 catch �?
			e.printStackTrace();
		}
		finally{
			try{
				pre.close();
				con.close();
			}catch (SQLException e) {
				// TODO 自动生成 catch �?
				e.printStackTrace();
			}
			
		}
      return list;
	}
	
	
	//insert
	public int getInsert(String sql,JavaBean jBean){
		int count=0;
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1,jBean.getdishesname());
			pre.setString(2,jBean.getdishestype());
			pre.setInt(3, jBean.getdishesprice());
			pre.setString(4, jBean.getdishespicture());
			pre.setString(5, jBean.getdishesintro());
			pre.setString(6, jBean.getdishesflag());
			count=pre.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try{
				pre.close();
				con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return count;
	}
	
	//delete
	public int getDelete(String sql,String dishesname){
		int count=0;
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, dishesname);
			count=pre.executeUpdate();
			
		} catch (SQLException e) {
			// TODO 自动生成 catch �?
			e.printStackTrace();
		}
		finally{
			try{
				pre.close();
				con.close();
			}catch (SQLException e) {
				// TODO 自动生成 catch �?
				e.printStackTrace();
			}
			
		}
		return count;
	}
	
	//update
	public int getUpdate(String sql,JavaBean jBean){
		int count=0;
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, jBean.getdishesname());
			pre.setInt(2, jBean.getdishesprice());
			pre.setString(3, jBean.getdishespicture());
			pre.setString(4, jBean.getdishesflag());
			
			count=pre.executeUpdate();		
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			try{
				pre.close();
				con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return count;
	}

	
	
	//查询所有的菜品
	public ArrayList<JavaBean> getSearch(){
		String sql="select * from dishes";
		ArrayList<JavaBean> list=new ArrayList<JavaBean>();
		//获得prepareStatement对象
		try {
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){
				JavaBean jBean=new JavaBean();		
				jBean.setdishesname(rs.getString("DishesName"));		
                jBean.setdishestype(rs.getString("DishesType"));
                jBean.setdishesprice(rs.getInt("DishesPrice"));
                String picture=rs.getString("DishesPicture");
                String url="http://10.169.162.122:8080/cbb+book/"+picture;
                jBean.setdishespicture(url);
                jBean.setdishesintro(rs.getString("DishesIntro"));
				list.add(jBean);
			}	
		} catch (SQLException e) {
			// TODO 自动生成 catch �?
			e.printStackTrace();
		}
		finally{
			try{
				pre.close();
				con.close();
			}catch (SQLException e) {
				// TODO 自动生成 catch �?
				e.printStackTrace();
			}
			
		}
		
		return list;
	}
	

	//查询所有的订单
	public ArrayList<OrderBean> getSearchOrder(){
		String sql="select * from orders";
		ArrayList<OrderBean> list=new ArrayList<OrderBean>();
		//获得prepareStatement对象
		try {
			pre=con.prepareStatement(sql);
			rs=pre.executeQuery();
			while(rs.next()){
				OrderBean oBean=new OrderBean();		
				oBean.setorderid(rs.getString("OrderID"));	
                oBean.setdeskid(rs.getInt("DeskID"));
                oBean.setorderamount(rs.getInt("OrderAmount"));
                oBean.setorderdate(rs.getTimestamp("OrderDate")); 
                oBean.setorderstate(rs.getString("OrderState"));
				list.add(oBean);
			}	
		} catch (SQLException e) {
			// TODO 自动生成 catch �?
			e.printStackTrace();
		}
		finally{
			try{
				pre.close();
				con.close();
			}catch (SQLException e) {
				// TODO 自动生成 catch �?
				e.printStackTrace();
			}
			
		}
		return list;
	}
	
	//单个订单增加菜品
		public int getInsertorder(String sql,OrderDetailBean odBean){
			int count=0;
			try {
				pre=con.prepareStatement(sql);
				pre.setString(1,odBean.getorderid());
				pre.setString(2,odBean.getname());
				pre.setInt(3, odBean.getdetailquantity());
				pre.setInt(4, odBean.getdetailprice());
				count=pre.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			finally{
				try{
					pre.close();
					con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			return count;
		}
		//单个订单增加总价修改状态
				public int getupdateorder(String sql){
					int count=0;
					try {
						pre=con.prepareStatement(sql);
						count=pre.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					}
					finally{
						try{
							pre.close();
							con.close();
						}catch (SQLException e) {
							e.printStackTrace();
						}
						
					}
					return count;
				}
	
	
}
