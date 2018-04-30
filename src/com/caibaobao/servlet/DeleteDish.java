package com.caibaobao.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.caibaobao.bean.JavaBean;
import com.caibaobao.bean.SqlBean;

/**
 * Servlet implementation class DeleteDish
 */
@WebServlet("/DeleteDish")
public class DeleteDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDish() {
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
		  
		  String name = request.getParameter("textfield4");//获取传过来的name
		  System.out.println(name);
				
				//调用模型层
				SqlBean sBean=new SqlBean();
				String sql="delete from dishes where DishesName=?";
				
				int count=sBean.getDelete(sql, name); 
				String url="";
				
				if(count>0){
					response.sendRedirect("SearchSingleDish.jsp");
				System.out.println("删除成功!");
				}
				
	}
}
