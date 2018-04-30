<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*" %>
<%@ page import="com.caibaobao.bean.Dao" %>
<%@ page import="com.caibaobao.bean.OrderDetailBean" %>

<% 
String orderid = request.getParameter("orderid");

Dao dao=new Dao();
ArrayList<OrderDetailBean> list =(ArrayList<OrderDetailBean>) dao.getOrderDetail(orderid);

StringBuffer sb = new StringBuffer();
//解决中文乱码问题
sb.append("<?xml version='1.0' encoding='gb2312'?>");
sb.append("<orders>");

for(int i=0;i<list.size();i++)
{ 
  sb.append("<order>");
  sb.append("<name>"+list.get(i).getname()+"</name>");
  sb.append("<quantity>"+list.get(i).getdetailquantity()+"</quantity>");
  sb.append("<price>"+list.get(i).getdetailprice()+"</price>");
  sb.append("</order>");
} 
sb.append("</orders>");
response.setContentType("text/xml");
response.getWriter().write(sb.toString()); 
response.getWriter().flush();
response.getWriter().close();
%> 
