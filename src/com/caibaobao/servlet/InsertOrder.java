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
		 request.setCharacterEncoding("UTF-8");//���������������
		  response.setContentType("text/html;charset=UTF-8");//���������������
		  
		  //�����򶩵�������в������ݣ����򶩵������޸Ķ�Ӧ�������ܼ�
		   
		  Dao dao=new Dao();
		  //���ǰ̨����Ϣ
		        String orderid=request.getParameter("textfield4"); //������
				String name=request.getParameter("select3");  //����
				String quantity1=request.getParameter("select4"); 
				int quantity=Integer.parseInt(quantity1);    //����
				int price=dao.getdetailprice(name)*quantity;//�м�
				
				//��װ�� OrderDetailBean������ȥ
			   OrderDetailBean odBean=new OrderDetailBean();
			   odBean.setorderid(orderid);
			   odBean.setname(name);
			   odBean.setdetailquantity(quantity);
			   odBean.setdetailprice(price);
			   
			   String sql="insert into orderdetail(OrderID,Name,DetailQuantity,DetailPrice) values(?,?,?,?)";
			   SqlBean sBean=new SqlBean();
				int count=sBean.getInsertorder(sql, odBean);
				
				//�޸Ķ�Ӧ�������ܼ���״̬���޸Ķ�����ԭ�������ϣ�����Ҫ���´�ӡ
				 String sql2="update orders set OrderAmount=OrderAmount+"+price+",OrderState='δ��ӡ' where OrderID='"+orderid+"'";
				 SqlBean sBean2=new SqlBean();
				 int count2=sBean2.getupdateorder(sql2);				 
				 if(count>0 && count2>0)
					 response.sendRedirect("StaffMain.jsp"); 
	}

}
