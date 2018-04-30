<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.caibaobao.bean.JavaBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员主界面</title>
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
	height: 70px;
	z-index: 1;
	background-color: #C9D8C5;
	font-weight: bold;
	font-family: 楷体;
	text-align: center;
	font-size: 18px;
}
#apDiv4 {
	position: absolute;
	left: 350px;
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
 {
    %>
    <jsp:useBean id="sBean" class="com.caibaobao.bean.SqlBean"/>
  
 <%
List<JavaBean> list=sBean.getSearch();
int all = 0;
int curPage = 1;
int pageTotal = 0;
int pageCount = 5;
if(list!=null)
{
   all = list.size();
   pageTotal = (all%pageCount)==0?all/pageCount:(all/pageCount+1);
   String strCurPage = request.getParameter("page");
   if(strCurPage!=null)
		curPage = Integer.parseInt(strCurPage);

   int start = (curPage-1)*pageCount;
   int end = curPage*pageCount>all?all:curPage*pageCount;
%>
  
<div id="apDiv1">菜品信息</div>

<div id="apDiv2">
 <a href="AdminMain.jsp?page=1"> <img src="imgs/first.png" width="26" height="26" /></a>  &nbsp;&nbsp;
 <a href="AdminMain.jsp?page=<%=curPage-1>0?curPage-1:1 %>"> <img src="imgs/back.png" width="25" height="25" /></a> &nbsp;&nbsp;
 <a href="AdminMain.jsp?page=<%=curPage+1<pageTotal?curPage+1:pageTotal %>"> <img src="imgs/next.jpg" width="25" height="25" /></a>
 <p>共<%=all %>条记录，当前第<%=curPage %>/<%=pageTotal %>页，每页<%=pageCount %>条记录</p>
</div>

<div class="demo">
    <div class="navbox">
        <ul class="nav">
            <li><a href="SearchSingleDish.jsp">分类查询</a></li>
            <li><a href="UpdateDish.jsp">更新菜品</a></li>
            <li><a href="DeleteDish.jsp">删除菜品</a></li>
            <li><a href="InsertDish.jsp">增加菜品</a></li>
            <li><a href="LogOut.jsp">退出登录</a></li>
            <li><a href="DataMining.jsp">数据汇总</a></li>
        </ul>
    </div>
</div >


<div id="apDiv4">
<%
   for(int i=start;i<end;i++)
   {
   JavaBean jBean = list.get(i);
%>  

<table width="100%"  cellspacing="0" cellpadding="0" class="bordered">
    <tr>
      <td width="10%" rowspan="4" bgcolor="#EDD9C0"><img src="<%=jBean.getdishespicture() %>" width="200" height="200" /></td>
      
      <td width="10%" height="40" >类别：</td>
      <td width="80%"><%=jBean.getdishestype() %></td>
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
%>
</div>
  <%
}
%>

<% 
 }
 %>
   
</body>
</html>