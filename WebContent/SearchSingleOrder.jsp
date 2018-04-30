<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.caibaobao.bean.Dao" %>
<%@ page import="com.caibaobao.bean.OrderDetailBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% 
String orderid = request.getParameter("orderid");
char deskid=orderid.charAt(0);
Dao dao=new Dao();
ArrayList<OrderDetailBean> list =(ArrayList<OrderDetailBean>) dao.getOrderDetail(orderid);

%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>订单详情</title>
</head>

<style type="text/css">
  
#apDiv1 {
	position: absolute;
	left: 25%;
	top: 50px;
	width: 700px;
	height: 100%;
	z-index: 2;
	background-color:#C2D4D8;
	border: 7px ridge;
	border-color:#EDD9C0;
	font-weight: bold;
	font-family: 楷体;
	font-size:20px;
	color: #CC6666;
}
.bodyCSS {
	background-color: #EDD9C0;
	font-family: 楷体;
}
input[type="text"]
{

	font-family: 楷体;
	font-size:18px;
	color: #CC6666;
}
.demo{
	left:10px;
	top:60px;
	position: absolute;
	width:850px;
	font-size:25px;
	}
	
.navbox{
float:left;
}
ul.nav{
	width:200px;
	padding:60px 0 60px 0;
	background:url() no-repeat;
	}
	
ul.nav li{margin:5px 0 0 0;}
ul.nav li a{
    background:#cbcbcb url() no-repeat;
    color:#174867;
    padding:7px 15px 7px 15px;
    width:100px;
    display: block;
    text-decoration:none;
    -webkit-transition:all 0.3s ease-out;
    -moz-transition:all 0.3s ease-out;
    -o-transition:all 0.3s ease-out;
    -webkit-box-shadow:2px 2px 4px #888;
    -moz-box-shadow:2px 2px 4px #888;
    -o-box-shadow:2px 2px 4px #888;
}
ul.nav li a:hover{
	background: #ebebeb url() no-repeat;
	color: #67a5cd;
	padding: 7px 15px 7px 30px;
	font-family: "楷体";
	font-size: 25px;
	}
</style>
<body class="bodyCSS">
<div class="demo">
    <div class="navbox">
        <ul class="nav">
            <li><a href="StaffMain.jsp">返回</a></li>
       
        </ul>
    </div>
</div >
<div id="apDiv1">
<table width="100%"  cellspacing="0" cellpadding="0">
  
   <tr>
    <td colspan="4" style="text-align:center"><h2>订单详情</h2></td>
  </tr>
   
  <tr>
    <td width="10%" style="text-align:right">桌号:</td>
 
    <td width="30%" style="text-align:left">
    <input type="text" name="textfield1" id="textfield1" style="border:0px;background-color:transparent" value="<%=deskid%>" /></td>
    
    <td width="30%" style="text-align:right">订单编号:</td>
    <td width="30%" style="text-align:left"><input type="text" name="textfield2" id="textfield2" style="border:0px;background-color:transparent" value="<%=orderid%>" /></td>
  </tr>
  
  <tr>
    <td width="10%" style="text-align:right">下单时间:</td>
    <td width="30%" style="text-align:left">
    <input type="text" name="textfield3" id="textfield3" style="border:0px;background-color:transparent" value="<%= dao.getordertime(orderid)%>" /></td>
    
    <td width="30%" ></td>
    <td width="30%" ></td>
  </tr>
  
    <tr>
      <td width="50%" style="text-align:center" >菜品名称</td>
      <td width="20%" style="text-align:center">单位</td>
      <td width="20%"style="text-align:center">数量</td>
      <td width="20%"style="text-align:center">金额</td>
      </tr>
  
     <tr>
      <td height="2" bgcolor="#000000"></td>
      <td height="2" bgcolor="#000000"></td>
      <td height="2" bgcolor="#000000"></td>
      <td height="2" bgcolor="#000000"></td>
    </tr>
   
<%for(int i=0;i<list.size();i++)
{%>
	 <tr>
      <td width="40%" style="text-align:center "><%=list.get(i).getname()%></td>
       <td width="20%" style="text-align:center">份</td>
      <td width="20%" style="text-align:center"><%=list.get(i).getdetailquantity() %></td>
      <td width="20%" style="text-align:center"><%=list.get(i).getdetailprice() %></td>
    </tr>
<%}%>

<tr>
      <td height="2" bgcolor="#000000"></td>
      <td height="2" bgcolor="#000000"></td>
      <td height="2" bgcolor="#000000"></td>
      <td height="2" bgcolor="#000000"></td>
    </tr>
    
   <tr>
    <td colspan="2" style="text-align:right">品项合计:&nbsp;&nbsp;</td>
    <td colspan="2" style="text-align:left">
    <input type="text" name="textfield4" id="textfield4" style="border:0px;background-color:transparent" value="<%= dao.getorderamount(orderid)%>" /></td>
    </td>
  </tr> 
  	
 </table>
 </div>
</body>
</html>