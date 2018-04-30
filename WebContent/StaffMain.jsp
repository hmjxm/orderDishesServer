<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.caibaobao.bean.OrderBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% response.setHeader("refresh","20"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作人员主界面</title>
<style type="text/css">

#apDiv1 { 
	position: absolute;
	left: 0px;
	top: 1px;
	width: 100%;
	height: 45px;
	z-index: 1;
	background-color: #E3E3E3;
	font-weight: bold;
	font-family: 楷体;
	text-align: center;
	font-size: 40px;
	color: #CC6666;
}

#apDiv4 {
	position: absolute;
	left: 300px;
	top: 140px;
	width: 800px;
	height: 340px;
	z-index: 2;
}

*{
	margin:0;
	padding:0;
	list-style-type:none;
}
a,img{border:0;}
body{
	font:20px/180% "楷体";
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
.bodyCSS {
	background-color: #EDD9C0;
}

.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;    
   text-align:center; 
   position: absolute;
	top:35px;   
}   
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
}
  input[type="submit"]
{
  font-size: 20px;
  font-weight: 300;
  font-family:楷体;
  cursor: pointer;
  outline: none;
  width:10%;
   position: absolute;
	right: 5px;
	top:7px;
	height:25px;
  background-color:#F2EFE8;  
}
a {
	font-family: "楷体";
	color: #000;
	text-decoration: none;
}
</style>

<script language="javascript">      
  function allCheck(check)
  {
    var checkbox=document.getElementsByName("checkbox2");
    if(checkbox.length==0){
    	alert("当前订单已全部打印!没有选中的未打印订单！");
    	check.checked="";
    	var btn=document.getElementsByName("button");
    	btn.disabled="disabled";  //打印按钮不可用
    }
    else
   {
     if(check.checked)
     {  //全选
	 for(var i=0;i<checkbox.length;i++)
	   checkbox[i].checked="checked";   	
	 }
	else{  //全不选
		for(var i=0;i<checkbox.length;i++)
	     checkbox[i].checked="";
	}
    	}
  }
  
  function check(){
	  var checkbox=document.getElementsByName("checkbox2");   //获得未打印订单列表
	  
	    if(checkbox.length==0){   //没有未打印订单
	    	alert("当前订单已全部打印!");
	    	 return false;
	    }
	    else
	    	{    //有未打印订单，判断是否有选中
	    	 var i=0;
	    	while(i<checkbox.length && checkbox[i].checked=="" )
	    	       ++i;
	    	 if(i==checkbox.length)
	    		 {
	    	   alert("请选择要打印的订单！");
               return false;
             }
	    }
}
 </script>  
</head>

<body class="bodyCSS" >
 <%
 if(session.getAttribute("username")==null)
 {
 %>
  <font size="3" color="red" ><b>请先登录
  后再访问本页!</b></font> <br><br>
   <a href="Login.jsp"><font size="3" color="red"><b>点我返回登录</b></font></a> 
<%
 }
 else
 {
 %>   
<div id="apDiv1">订单列表</div>

 <div class="demo">
     <div class="navbox">
         <ul class="nav">
             <li><a href="LogOut.jsp">退出登录</a></li>
              <li><a href="OperateOrder.jsp">操作订单</a></li>
         </ul>
     </div>
 </div >
 
<jsp:useBean id="sBean" class="com.caibaobao.bean.SqlBean"/>
<jsp:useBean id="oBean" class="com.caibaobao.bean.OrderBean"/>
<div id="apDiv4">
<% 
 List<OrderBean> list=sBean.getSearchOrder();%>
 
 <form id="form1" name="form1" method="post" action="PrintOrder" onSubmit="return check()">  
 
  <input name="checkbox3" type="checkbox" id="checkbox3" onclick="allCheck(this)"/>全选 
   <input type="submit" name="button" id="button" value="打印"  />
<table width="100%"  cellspacing="0" cellpadding="0" class="bordered">
   <tr >
	  <td width="10%" height="40" >&nbsp; </td>
      <td width="20%" >订单编号</td>
      <td width="10%">桌号</td>
      <td width="30%">下单时间</td>
      <td width="10%">总价</td>
      <td width="20%">订单状态</td>
    </tr>

<%for(Iterator it=list.iterator();it.hasNext();)
{
	//获得JavaBean的一个对象   
	oBean=(com.caibaobao.bean.OrderBean)it.next();
	
	if(oBean.getorderstate().equals("已打印"))
	{ %>
	
   <tr bgcolor="#E6CF8B">
	  <td width="10%" height="40"> 
	  <input name="checkbox1" type="checkbox" id="checkbox1" checked="checked"  disabled="disabled"  />
	  </td>
      <td width="20%" ><a href="SearchSingleOrder.jsp?orderid=<%=oBean.getorderid()%>"><%=oBean.getorderid() %></a></td>
      <td width="10%"><%=oBean.getdeskid() %></td>
      <td width="30%"><%=oBean.getorderdate() %></td>
      <td width="10%"><%=oBean.getorderamount() %></td>
      <td width="20%"><%=oBean.getorderstate()%></td>
    </tr>
  <%
 } 	
 else
 {   //未打印
 %>   
     <tr bgcolor="#B56969">
      <td  width="10%" height="40" > 
      <input name="checkbox2" type="checkbox" id="checkbox2" value="<%=oBean.getorderid() %>"/></td>
      <td width="20%"><a href="SearchSingleOrder.jsp?orderid=<%=oBean.getorderid()%>"><%=oBean.getorderid() %></td>
      <td width="10%"><%=oBean.getdeskid() %></td>
      <td width="30%"><%=oBean.getorderdate() %></td>
      <td width="10%"><%=oBean.getorderamount() %></td>
      <td width="20%"><%=oBean.getorderstate()%></td>
    </tr>
    <%} %>
   
<%
}
%>
  </table>
 
  </form>
</div>
 <%
}
%>
   
</body>
</html>