package com.caibaobao.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.caibaobao.bean.Dao;


/**
 * Servlet implementation class PrintOrder
 */
@WebServlet("/PrintOrder")
public class PrintOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrintOrder() {
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
		  request.setCharacterEncoding("UTF-8");//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		  response.setContentType("text/html;charset=UTF-8");//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		  Connection con;
		  PreparedStatement pre;
		  String sql;
		  int count=0;
		  //锟斤拷锟斤拷锟斤拷锟捷匡拷
		  Dao dao = new Dao();
		  con=dao.getConn();
		  
		  String str[] = request.getParameterValues("checkbox2");  //锟矫碉拷前台锟窖撅拷锟斤拷选要锟斤拷印锟侥讹拷锟斤拷锟斤拷锟�
          for(int i=0;i<str.length;++i)
          {      
             sql="update orders set OrderState='已打印' where OrderID='"+str[i]+"'";
             try {
     			pre=con.prepareStatement(sql);
     			count=pre.executeUpdate();		
     		 } catch (SQLException e) {
     			e.printStackTrace();
     		 }		
		  }
          
          if(count>0){ 
			    response.sendRedirect("StaffMain.jsp");
			}
	}

}
