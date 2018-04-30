package com.caibaobao.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.caibaobao.bean.JavaBean;
import com.caibaobao.bean.SqlBean;

/**
 * Servlet implementation class UpdateDish
 */
@WebServlet("/UpdateDish")
public class UpdateDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDish() {
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
		//获得前台表单信息
		        String pastname=request.getParameter("textfield4");  //原菜名
		        
				String picture=request.getParameter("textfield");
				String name=request.getParameter("textfield2");
				String price1=request.getParameter("textfield3");
				int price=Integer.parseInt(price1);    //String转换成int
				String flag=request.getParameter("select3");
				
				//封装到JavaBean对象中去
				JavaBean jBean=new JavaBean();
		       jBean.setdishesname(name);
		       jBean.setdishespicture(picture);
		       jBean.setdishesprice(price);
			   jBean.setdishesflag(flag);
			   
				String sql="update dishes set DishesName=?,DishesPrice=?,DishesPicture=?,DishesFlag=? where DishesName='"+pastname+"'";
				SqlBean sBean=new SqlBean();
				
				int count=sBean.getUpdate(sql, jBean);
			
				if(count>0){
				    response.sendRedirect("SearchSingleDish.jsp");
				}
				
	}

}
