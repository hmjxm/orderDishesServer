<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>增加菜品</title>
</head>

<style type="text/css">
.bodyCSS {
	background-color: #EDD9C0;
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
select{
  width: 15%;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  font-family:楷体;
  }
  .txtCSS{
  width: 15%;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  font-family:楷体;
  }
input[type="submit"]
{
  font-size: 19px;
  font-weight: 300;
  font-family:楷体;
  cursor: pointer;
  outline: none;
  width:10%;
  background-color:#F2EFE8;
}
input[type="reset"]
{
  font-size: 19px;
  font-weight: 300;
  font-family:楷体;
  cursor: pointer;
  outline: none;
  width:10%;
  background-color:#F2EFE8;
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
#apDiv1 {
	position: absolute;
	left: 18%;
	top: 55px;
	width: 900px;
	height: 700px;
	z-index: 1;
	background-color: #C2D4D8;
	text-align:center;
}
</style>
<script type="text/javascript">

function check()
{
	 if(document.form1.select.selectedIndex==0){
		   alert("请选择菜品所属的类别!");
		 return false;
		 }
	
	 if(document.form1.txtname.value==""){
		   alert("请输入菜品名称!");
		   document.form1.txtname.focus();
		 return false;
		 }
	 
	 if(document.form1.txtprice.value==""){
		   alert("请输入菜品单价!");
		   document.form1.txtprice.focus();
		 return false;
		 }
	 if(/^[1-9]\d*$|^0$/.test(document.form1.txtprice.value)==false){
		   alert("菜品单价只能为数字！");
		   document.form1.txtprice.value="";
		   document.form1.txtprice.focus();
		 return false;
		 }
	 
	 if(document.form1.txtURL.value==""){
		   alert("请输入图片链接!");
		   document.form1.txtURL.focus();
		 return false;
		 }
     var a=/^(http|ftp|https):\/\/.*/;
	 /*
	 if(a.test(document.form1.txtURL.value)==false){
		   alert("请输入正确的网址!");
		   document.form1.txtURL.value="";
		   document.form1.txtURL.focus();
		 return false;
		 }
	 */

	 if(document.form1.txtintro.value==""){
		   alert("请输入菜品简介!");
		   document.form1.txtintro.focus();
		 return false;
		 }
	 
}

</script>

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
 {%>
<div class="demo">
    <div class="navbox">
        <ul class="nav">
            <li><a href="AdminMain.jsp">返回主页</a></li>
            <li><a href="SearchSingleDish.jsp">分类查询</a></li>
            <li><a href="DeleteDish.jsp">删除菜品</a></li>
            <li><a href="UpdateDish.jsp">更新菜品</a></li>
            <li><a href="DataMining.jsp">数据汇总</a></li>
            <li><a href="LogOut.jsp">退出登录</a></li>
        </ul>
    </div>
</div >

<div id="apDiv2">增加菜品 </div>

<div id="apDiv1">
</br>
</br>
<form id="form1" name="form1" method="post" action="InsertDish" onSubmit="return check()">
     <p> 菜品类别：
       <select name="select" size="1" id="select" >
         <option value="大类" selected="selected">类别</option>
         <option value="热菜">热菜</option>
         <option value="凉菜">凉菜</option>
         <option value="甜点">甜点</option>
         <option value="饮品">饮品</option> 
       </select>
       </p>
     <p>菜品名称：
       <input type="text" name="txtname" id="txtname" class="txtCSS" />
     </p>
     
     <p>菜品单价：
       <input type="text" name="txtprice" id="txtprice" class="txtCSS"  />
     </p>
     
     <p>图片地址：
       <input type="text" name="txtURL" id="txtURL" class="txtCSS"  />
     </p>
     
     <p>菜品简介：
       <textarea name="txtintro" id="txtintro" cols="30" rows="2" class="txtCSS" ></textarea>
     </p>
     
     <p>
        <input type="reset" name="button2" id="button2" value="重置" />
       <input type="submit" name="button" id="button" value="插入" />
     </p>
     
</form>
</div>
<%} %>
</body>
</html>