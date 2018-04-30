<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.caibaobao.bean.Dao" %>
<%@ page import="com.caibaobao.bean.OrderDetailBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Dao dao=new Dao();
ArrayList<OrderDetailBean> list =(ArrayList<OrderDetailBean>) dao.getdishesamount();
ArrayList<OrderDetailBean> list2 =(ArrayList<OrderDetailBean>) dao.getdishesamount2();
%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据汇总</title>
</head>

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
#apDiv2 {
	position: absolute;
	left: 0px;
	top: 48px;
	width: 100%;
	height: 50px;
	z-index: 1;
	background-color: #C9D8C5;
	font-weight: bold;
	font-family: 楷体;
	text-align: center;
	font-size: 18px;
}
#apDiv3 {
	position: absolute;
	left: 0px;
	top: 98px;
	width: 100%;
	height: 50px;
	z-index: 1;
	background-color: #C9D8C5;
	font-weight: bold;
	font-family: 楷体;
	text-align: center;
	font-size: 18px;
}
#apDiv6 {
	position: absolute;
	left: 320px;
	top: 148px;
	width:200px;
	height: 40px;
	z-index: 1;
	background-color:#EDD9C0;
	font-weight: bold;
	font-family: 楷体;
	text-align: center;
	font-size: 20px;
}
#apDiv4 {
	position: absolute;
	left: 330px;
	top: 190px;
	width: 800px;
	height: 340px;
	z-index: 2;
	display:inline;
}
#apDiv5 {
	position: absolute;
	left: 330px;
	top: 190px;
	width: 800px;
	height: 340px;
	z-index: 2;
	display:none;	
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
	top:130px;
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
</style>
<script type="text/javascript">

function getData(){
	var price=<%=dao.gettotalprice()%>  
	document.getElementById('textfield1').value=price+"元";
}

function change(){
	 document.getElementById('apDiv5').style.display='none';
	 document.getElementById('apDiv4').style.display='inline';
}
function change2(){
	 document.getElementById('apDiv4').style.display='none';
	 document.getElementById('apDiv5').style.display='inline';
}
</script>
<body class="bodyCSS" onload="getData()">
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
 {%>
 <div id="apDiv1">数据汇总</div>
 
 <div id="apDiv2">
  <script>
        document.getElementById('apDiv2').innerHTML = new Date().toLocaleString()+ ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
        setInterval( "document.getElementById('apDiv2').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());", 1000);
    </script>
</div>
 
  <div id="apDiv3">
 当前总营业额为：<input type="text" name="textfield1" id="textfield1" style="border:0px;background-color:transparent" />
</div>

 <div class="demo">
    <div class="navbox">
        <ul class="nav">
            <li><a href="AdminMain.jsp">返回主页</a></li>
            <li><a href="LogOut.jsp">退出登录</a></li>  
        </ul>
    </div>
</div >

<div id="apDiv6">
<form id="form1" name="form1" method="post" action="">
  <p>
      <input name="RadioGroup1" type="radio" id="RadioGroup1_0" value="单选" checked="checked" onclick='change()' />
  按价格
      <input type="radio" name="RadioGroup1" value="单选" id="RadioGroup1_1" onclick='change2()' />
按销量
  </p>
</form>
 </div>
 
 <div id="apDiv4">
<table width="100%"  cellspacing="0" cellpadding="0" class="bordered">
    <tr>
      <td width="30%" height="40" >名称：</td>
      <td width="20%" height="40" >销量(份)：</td>
      <td width="20%" height="40" >价格(元)：</td>
      <td width="20%" height="40" >销售额比率：</td>
    </tr>
    
    <%for(Iterator it=list.iterator();it.hasNext();)
    {
	//获得JavaBean的一个对象   
	  OrderDetailBean oBean=(com.caibaobao.bean.OrderDetailBean)it.next();%>
   <tr >
      <td width="30%" ><%=oBean.getname()%></td>
      <td width="20%"><%=oBean.getdetailquantity() %></td>
      <td width="20%"><%=oBean.getdetailprice()%></td>
      <td width="20%"><%=oBean.getpercent() %></td>
    </tr>
  <%
 }  %>
  </table>
</div>


<div id="apDiv5">


<table width="100%"  cellspacing="0" cellpadding="0" class="bordered">
    <tr>
      <td width="30%" height="40" >名称：</td>
      <td width="20%" height="40" >销量(份)：</td>
      <td width="20%" height="40" >价格(元)：</td>
      <td width="20%" height="40" >销售额比率：</td>
    </tr>
    
    <%for(Iterator it=list2.iterator();it.hasNext();)
    {
	//获得JavaBean的一个对象   
	  OrderDetailBean oBean=(com.caibaobao.bean.OrderDetailBean)it.next();%>
   <tr >
      <td width="30%" ><%=oBean.getname()%></td>
      <td width="20%"><%=oBean.getdetailquantity() %></td>
      <td width="20%"><%=oBean.getdetailprice()%></td>
      <td width="20%"><%=oBean.getpercent() %></td>
    </tr>
  <%
 }  %>
  </table>
</div>
<%
}
%>
</body>
</html>