<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.caibaobao.bean.OrderBean" %>
<%@ page import="com.caibaobao.bean.JavaBean" %>
<%@ page import="com.caibaobao.bean.Dao" %>
<%@ page import="com.caibaobao.bean.OrderDetailBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Dao dao=new Dao();
ArrayList<String> fatherlist =(ArrayList<String>) dao.getType();
ArrayList<String> namelist =(ArrayList<String>) dao.getName();
%>
<html>
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>操作订单</title>
</head>

<style type="text/css">
.bodyCSS {
	background-color: #EDD9C0;
	font:20px/180% "楷体";
}

select{
  width: 10%;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  font-family:楷体;
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
#apDiv1 {
	position: absolute;
	left: 18%;
	top: 53px;
	width: 900px;
	height: 70px;
	z-index: 1;
	background-color: #C2D4D8;
	text-align:right;
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
    background-color: #EECBAD;      
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
.buttonCSS {
	width: 40px;
	height: 40px;
	border: 0px;
	cursor: pointer;
	background-image: url(imgs/jiahao.png);
	background-size:cover;
	background-color:transparent;
}
#apDiv3 {
	position: absolute;
	left: 500px;
	top: 123px;
	width: 418px;
	height: 273px;
	z-index: 1;
	border: 7px ridge;
	border-color:#E6C0B3;
}

.fromCSS {
	font-family: "楷体";
	font-size: 22px;
	text-align: center;
}
input[type="submit"]
{
  font-size: 19px;
  font-weight: 300;
  font-family:楷体;
  cursor: pointer;
  outline: none;
  width:15%;
  background-color:#F2EFE8;
}
.buttonCSS2
{
  font-size: 19px;
  font-weight: 300;
  font-family:楷体;
  cursor: pointer;
  outline: none;
  width:15%;
  background-color:#F2EFE8;
}
.selectCSS2{
  width: 20%;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  font-family:楷体;
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
 
<script type="text/javascript">

var xmlHttp;
function createXMLHttpRequest()
{
if(window.ActiveXObject)
{
   xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
}
else
{
   if(window.XMLHttpRequest)
   {
    xmlHttp = new XMLHttpRequest();
   }
}
}

function selectChnge()
{
  //清空table
     var table = document.getElementById("table1");
     trs = table.getElementsByTagName("tr");    
     for(var i = trs.length - 1; i > 0; i--) {
      table.deleteRow(i);
 }
//清空下拉列表
  document.getElementById('select2').length = 0;
  
  var desk = document.form1.select1.options[document.form1.select1.selectedIndex].value;
  if(desk=="null")
	  {alert("请先选择桌台号!");}
  else
{
	     createXMLHttpRequest();
	     var url = "dropDownListServer.jsp?desk="+desk;
	     xmlHttp.open("GET", url, true);
	     xmlHttp.onreadystatechange = showorders;
	     xmlHttp.send(null);     
 }
 }
 
function showorders()
{
   if(xmlHttp.readyState==4)
	 {
	  if(xmlHttp.status==200)
     {
      var orderData = xmlHttp.responseXML.getElementsByTagName("order");  
      for(var i = 0; i < orderData.length; i++)
      {
      var orderid = orderData[i].childNodes[0].firstChild.nodeValue;
      try
      {
    	document.form1.select2.options.add(new Option(orderid,orderid));
      }
      catch(e)
      {
       alert(e);
      }
      }
   }
}
}

function selectChnge2()
{
	//清空表格
    var table = document.getElementById("table1"),
    trs = table.getElementsByTagName("tr");    
    for(var i = trs.length - 1; i > 0; i--) {
     table.deleteRow(i);
}
   
  var orderid = document.form1.select2.options[document.form1.select2.selectedIndex].value;
   if(orderid=="订单号")
	  {alert("请选择订单号!");}
  else
   {
	     createXMLHttpRequest();
	     var url = "tableServer.jsp?orderid="+orderid;
	     xmlHttp.open("GET", url, true);
	     xmlHttp.onreadystatechange = showorderdetail;
	     xmlHttp.send(null);     
   }
 }
function showorderdetail()
{
	 document.getElementById('button1').style.display='inline'; 
   if(xmlHttp.readyState==4)
	 {
	  if(xmlHttp.status==200)
     {
	 var table=document.getElementById('table1');
      var orderData = xmlHttp.responseXML.getElementsByTagName("order");
      for(var i = 0; i < orderData.length; i++)
      {
      var name = orderData[i].childNodes[0].firstChild.nodeValue;
      var quantity = orderData[i].childNodes[1].firstChild.nodeValue;
      var price = orderData[i].childNodes[2].firstChild.nodeValue;
      //向table动态添加行
      var mytr=table.insertRow();
      var mytd1=document.createElement("td");
       mytd1.innerText=name;
       mytr.appendChild(mytd1);
       
      var mytd2=document.createElement("td");
      mytd2.innerText=quantity;
      mytr.appendChild(mytd2);
      
      var mytd3=document.createElement("td");
      mytd3.innerText=price;
      mytr.appendChild(mytd3);
      } 
      var tableLength = table.rows.length;
   }
}
}

//悬浮div实现
function xuanfukuang(){
	  document.form2.textfield4.value= document.form1.select2.options[document.form1.select2.selectedIndex].value;
	  document.getElementById('apDiv1').style.display = 'none'; 
	  document.getElementById('apDiv5').style.display = 'none';
	  document.getElementById('apDiv3').style.display = 'inline';
}
//悬浮div消失
function xuanfukuanga(){
	 document.form2.textfield4.value="";
	  document.getElementById('apDiv1').style.display = 'inline'; 
	  document.getElementById('apDiv5').style.display = 'inline'; 
	  document.getElementById('apDiv3').style.display = 'none';
}
//级联菜单实现2
function getSelectValue(){
	
	   if(document.form2.select5.selectedIndex==0)
		{
		document.form2.select3.selectedIndex==0;
		}
	else
		{
		 document.getElementById('select3').length = 1;
		<%for(int i=0;i<fatherlist.size();++i)
		   {%>
	          if(document.form2.select5.options[document.form2.select5.selectedIndex].text=="<%=fatherlist.get(i)%>")
	          {
	        	  <% ArrayList<JavaBean> childlist =(ArrayList<JavaBean>) dao.getItem(fatherlist.get(i));
	        	    int size=childlist.size();
	        	    int j=0;
	        	  %>
	        	  
	        	  <%for(;j<size;++j)
	   	          {%>
	   	        	 document.form2.select3.options.add(new Option("<%=childlist.get(j).getdishesname()%>","<%=childlist.get(j).getdishesname()%>"));
	   	      <%}%>
             }
	       <%}%>
		}
	
}
//验证表单信息完整
function check()
{
	 if(document.form2.select5.options[document.form2.select5.selectedIndex].text==""){
		   alert("请选择类别!");
		 return false;
		 }
	 if(document.form2.select3.options[document.form2.select3.selectedIndex].text==""){
		   alert("请选择菜品名称!");
		 return false;
		 }
	 if(document.form2.select4.options[document.form2.select4.selectedIndex].text==""){
		   alert("请选择数量!");
		 return false;
		 }
    
}
</script>

<body class='bodyCSS'>
<div id="apDiv2">操作订单 </div>

 <div id="apDiv5" class="demo">
     <div class="navbox">
         <ul class="nav">
             <li><a href="StaffMain.jsp">返回主页</a></li>
         </ul>
     </div>
 </div >
 
<div id="apDiv1">
<form id="form1" name="form1" method="post" action="" >
  <p>
  
   <select name="select" size="1" id="select1" onchange="selectChnge()">
    <option value="null">桌台号</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
   </select>
    &nbsp; &nbsp;
    
    <select name="select2" size="1" id="select2" onchange="selectChnge2()">
    </select> 
    &nbsp;
   &nbsp;
  </p>
   
   <table width="100%"  cellspacing="0" cellpadding="0" class="bordered" id="table1">
    <tr>
      <td>菜名：</td>
      <td>数量：</td>
      <td>价格：</td>
    </tr>
  </table>
  <input type="button" name="button1" id="button1" class="buttonCSS" style="display:none" onclick="xuanfukuang()" />
</form>
</div>


<div id="apDiv3" style="display:none">
<form id="form2" name="form2" method="post" action="InsertOrder" class="fromCSS" onSubmit="return check()">
  <p>选择类别：
    <select name="select5" size="1" id="select5" onchange="getSelectValue()" class="selectCSS2">  
     <option value=" "> </option>  
     <% for (int i=0;i<fatherlist.size();++i){ %>
     <option value="<%=fatherlist.get(i)%>"><%=fatherlist.get(i)%></option>	 
    <%} %>
    </select>
  </p>
 
  <p>选择菜名：
    <select name="select3" size="1" id="select3" class="selectCSS2">
    </select>
  </p>
  
  <p>选择数量： 
    <select name="select4" size="1" id="select4" class="selectCSS2">
      <option value=" "> </option> 
      <option value="1">1</option>  
      <option value="2">2</option>  
      <option value="3">3</option>  
      <option value="4">4</option>  
      <option value="5">5</option> 
    </select>
  </p>
  <p>
    <input type="submit" name="button" id="button" value="确认" />
    <input type="button" name="button2" id="button2" value="取消" class="buttonCSS2" onclick="xuanfukuanga()"/>
    <input type="text" name="textfield4" id="textfield4" style="display:none" />
  </p>
</form>
</div>

</body>
</html>