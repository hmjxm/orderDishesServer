<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.caibaobao.bean.JavaBean" %>
<%@ page import="com.caibaobao.bean.SqlBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<style type="text/css">
select{
  width: 10%;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  font-family:楷体;
  }
  input[type="submit"]
{
  font-size: 16px;
  font-weight: 300;
  font-family:楷体;
  cursor: pointer;
  outline: none;
  width:8%;
   background-color:#F2EFE8;
}
#apDiv1 {
	position: absolute;
	left: 18%;
	top: 55px;
	width: 900px;
	height: 70px;
	z-index: 1;
	background-color: #C2D4D8;
	text-align:right;
}
#apDiv2 {
	position: absolute;
	left: 18%;
	top: 2px;
	width: 900px;
	height: 50px;
	z-index: 2;
	background-color: #DBE9D8;
	text-align:center;
	font-weight: bold;
	font-family: 楷体;
	font-size: 40px;
	color: #CC6666;
}
#apDiv3 {
	position: absolute;
	left: 18%;
	top: 128px;
	width: 900px;
	height: 123px;
	z-index: 3;

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
    font-family:楷体;
    font-size:20px;         
}
.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
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
 function checkSelect(){
  if(document.form1.select.value==" "){
   alert("请输入查询种类");
   return false;
  }
  return true;
 }

 </script>
 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单类别查询</title>
</head>

<body class="bodyCSS">
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
<div id="apDiv2">分类查询 </div>

<div id="apDiv1">
<form id="form1" name="form1" method="post" action="SearchDish" onSubmit="return checkSelect()";>
  <p>
    <select name="select" size="1" id="select" >
     <option value=" " selected="selected"> </option>
      <option value="热菜">热菜</option>
      <option value="凉菜" >凉菜</option>
      <option value="甜点" >甜点</option>
      <option value="饮品">饮品</option>
      
    </select>
     &nbsp;
    <input type="submit" name="button" id="button" value="查询"/> &nbsp;
  </p>
  
</form>
</div>

<div class="demo">
    <div class="navbox">
        <ul class="nav">
            <li><a href="AdminMain.jsp">返回主页</a></li>
            <li><a href="UpdateDish.jsp">更新菜品</a></li>
            <li><a href="DeleteDish.jsp">删除菜品</a></li>
            <li><a href="InsertDish.jsp">增加菜品</a></li>
            <li><a href="DataMining.jsp">数据汇总</a></li>
            <li><a href="LogOut.jsp">退出登录</a></li>
        </ul>
    </div>
</div >
<div id="apDiv3">
<%   
    ArrayList<JavaBean> list =(ArrayList<JavaBean>) request.getAttribute("list");
%>

   <%  if(list!=null)  
   {
     for(int i=0; i<list.size(); ++i)
     {
	  JavaBean jBean=list.get(i);
    %>  
      <table width="100%"  cellspacing="0" cellpadding="0" class="bordered">
    <tr>
      <td width="10%" rowspan="4" bgcolor="#EDD9C0"><img src="<%=jBean.getdishespicture() %>" width="200" height="200" /></td>
    </tr>
    <tr>
      <td width="20%" height="40" >名称：</td>
      <td width="80%"><%=jBean.getdishesname() %></td>
    </tr>
    <tr>
      <td height="40" >单价：</td>
      <td><%=jBean.getdishesprice() %>元/份</td>
    </tr>
    <tr>
      <td height="50" >简介：</td>
      <td><%=jBean.getdishesintro() %></td>
    </tr>
  </table>
  </br>
<%
}
     }
%>
</div>
<%} %>
</body>
</html>	

