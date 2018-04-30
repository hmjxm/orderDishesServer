package com.caibaobao.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.caibaobao.bean.Dao;
import com.caibaobao.bean.OrderDetailBean;
import com.caibaobao.bean.SqlBean;

/**
 * Servlet implementation class InsertOrder
 */
@WebServlet("/InsertOrder")
public class InsertOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");//解决中文乱码问题
		  response.setContentType("text/html;charset=UTF-8");//解决中文乱码问题
		  
		  //首先向订单详情表中插入数据，再向订单表中修改对应订单的总价
		   
		  Dao dao=new Dao();
		  //获得前台表单信息
		        String orderid=request.getParameter("textfield4"); //订单号
				String name=request.getParameter("select3");  //菜名
				String quantity1=request.getParameter("select4"); 
				int quantity=Integer.parseInt(quantity1);    //数量
				int price=dao.getdetailprice(name)*quantity;//行价
				
				//封装到 OrderDetailBean对象中去
			   OrderDetailBean odBean=new OrderDetailBean();
			   odBean.setorderid(orderid);
			   odBean.setname(name);
			   odBean.setdetailquantity(quantity);
			   odBean.setdetailprice(price);
			   
			   String sql="insert into orderdetail(OrderID,Name,DetailQuantity,DetailPrice) values(?,?,?,?)";
			   SqlBean sBean=new SqlBean();
				int count=sBean.getInsertorder(sql, odBean);
				
				//修改对应订单的总价与状态，修改订单后原订单作废，订单要重新打印
				 String sql2="update orders set OrderAmount=OrderAmount+"+price+",OrderState='未打印' where OrderID='"+orderid+"'";
				 SqlBean sBean2=new SqlBean();
				 int count2=sBean2.getupdateorder(sql2);				 
				 if(count>0 && count2>0)
					 response.sendRedirect("StaffMain.jsp"); 
	}

}
