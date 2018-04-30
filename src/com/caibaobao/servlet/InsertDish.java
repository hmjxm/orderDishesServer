package com.caibaobao.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.caibaobao.bean.SqlBean;
import com.caibaobao.bean.JavaBean;
/**
 * Servlet implementation class InsertDish
 */
@WebServlet("/InsertDish")
public class InsertDish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDish() {
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
		  
		String dishtype = request.getParameter("select");//��ȡ��������type
		String dishname=request.getParameter("txtname");
		String dp=request.getParameter("txtprice");
		int dishprice=Integer.parseInt(dp);  //String ת���� int
		String dishURL=request.getParameter("txtURL");
		String dishintro=request.getParameter("txtintro");
		String str="��";
		
				//��װ��JavaBean������
				JavaBean jBean=new JavaBean();
				jBean.setdishestype(dishtype);
				jBean.setdishesname(dishname);
				jBean.setdishesprice(dishprice);
				jBean.setdishespicture(dishURL);
				jBean.setdishesintro(dishintro);
	            jBean.setdishesflag(str);
	            
				//����ģ�Ͳ�
				String sql="insert into dishes(DishesName,DishesType,DishesPrice,DishesPicture,DishesIntro,DishesFlag) values(?,?,?,?,?,?)";
				SqlBean sBean=new SqlBean();
				int count=sBean.getInsert(sql, jBean);
		
				if(count>0){
		        response.sendRedirect("SearchSingleDish.jsp");
				}
				//ת��
				
	}

}
