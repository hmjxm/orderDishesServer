<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="java.util.*" %>
<%@ page import="com.caibaobao.bean.Dao" %>

<% 
String stDepart = request.getParameter("desk");

int deskid=Integer.parseInt(stDepart);

Dao dao=new Dao();
ArrayList<String> list =(ArrayList<String>) dao.getorderid(deskid);

StringBuffer sb = new StringBuffer();
//���������������
sb.append("<?xml version='1.0' encoding='gb2312'?>");
sb.append("<orders>");
sb.append("<order>");
sb.append("<id>"+"������"+"</id>");
sb.append("</order>");

for(int i=0;i<list.size();i++)
{ sb.append("<order>");
  sb.append("<id>"+list.get(i)+"</id>");
  sb.append("</order>");
} 
sb.append("</orders>");
response.setContentType("text/xml");
response.getWriter().write(sb.toString()); 
response.getWriter().flush();
response.getWriter().close();
%> 
