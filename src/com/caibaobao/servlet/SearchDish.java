package com.caibaobao.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.caibaobao.bean.JavaBean;
import com.caibaobao.bean.SqlBean;

/**
 * Servlet implementation class SearchDish
 */
@WebServlet("/SearchDish")
public class SearchDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 request.setCharacterEncoding("UTF-8");//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		  response.setContentType("text/html;charset=UTF-8");//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		  
		  String type = request.getParameter("select");//锟斤拷取锟斤拷锟斤拷锟斤拷锟斤拷type
		  System.out.println(type);
		  
		     /*锟斤拷装锟斤拷JavaBean锟斤拷锟斤拷锟斤拷
				com.caibaobao.bean.JavaBean jBean=new com.caibaobao.bean.JavaBean();
				jBean.setdishestype(type);*/
				
				//锟斤拷锟斤拷模锟酵诧拷
				SqlBean sBean=new SqlBean();
				String sql="select *from dishes where DishesType=? and DishesFlag='有'";
				List<JavaBean> list = null;
				try {
					list = sBean.getSingleSearch(sql, type);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}   
	             request.setAttribute("list", list);
	             request.getRequestDispatcher("SearchSingleDish.jsp").forward(request, response);
	    		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
