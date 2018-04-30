package com.caibaobao.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.caibaobao.bean.Dao;

/**
 * Servlet implementation class CheckLogin
 */
@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		  response.setContentType("text/html;charset=UTF-8");//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
		  PrintWriter out = response.getWriter();
		  //get value
		  String username = request.getParameter("username").trim();
		  String userpassword = request.getParameter("userpassword").trim();
		  String usertype=request.getParameter("usertype").trim();
		  
		   Dao dao = new Dao();
		   boolean flag = dao.validateLogin(username, userpassword,usertype);
		   if(flag)
		   {
		     //锟斤拷证锟缴癸拷锟侥伙拷,锟斤拷锟矫伙拷锟斤拷锟脚碉拷session锟斤拷
		    HttpSession session = request.getSession();
		    session.setAttribute("username", username);
		    //然锟斤拷锟斤拷锟斤拷没锟斤拷锟斤拷锟阶拷锟酵拷某晒锟揭筹拷锟�
		    System.out.println("类型"+usertype);
		    if(usertype.equals("管理员"))
		     response.sendRedirect("AdminMain.jsp");
		    else
		     response.sendRedirect("StaffMain.jsp");	   
		    }
		   else
		    response.sendRedirect("failure.jsp");	 
		  out.flush();
		  out.close();
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
