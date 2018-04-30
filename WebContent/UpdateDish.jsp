<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.caibaobao.bean.JavaBean" %>
<%@ page import="com.caibaobao.bean.Dao" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
Dao dao=new Dao();
ArrayList<String> fatherlist =(ArrayList<String>) dao.getType();
ArrayList<String> namelist =(ArrayList<String>) dao.getName();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>更新菜品</title>
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
#apDiv3 {
	position: absolute;
	left: 18%;
	top: 128px;
	width: 900px;
	height: 700px;
	z-index: 3;
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

.FormCSS {
	background-color: #CCC;
	text-align:center;
	background-color:#EECFA1;
	
}
</style>
 
<script type="text/javascript">

function getSelectValue(){
	   document.getElementById('apDiv3').style.display='none';
	   if(document.form1.select1.selectedIndex==0)
		{
		document.form1.select2.selectedIndex==0;
		}
	else
		{
		 document.getElementById('select2').length = 1;
		<%for(int i=0;i<fatherlist.size();++i)
		   {%>
	          if(document.form1.select1.options[document.form1.select1.selectedIndex].text=="<%=fatherlist.get(i)%>")
	          {
	        	  <% ArrayList<JavaBean> childlist =(ArrayList<JavaBean>) dao.getItem(fatherlist.get(i));
	        	    int size=childlist.size();
	        	    int j=0;
	        	  %>
	        	  
	        	  <%for(;j<size;++j)
	   	          {%>
	   	        	 document.form1.select2.options.add(new Option("<%=childlist.get(j).getdishesname()%>","<%=childlist.get(j).getdishesname()%>"));
	   	      <%}%>
             }
	       <%}%>
		}
	
}

function SetTableValue(){
	 document.getElementById('apDiv3').style.display='inline'; 
	 var a=document.getElementById('table1');
	 a.rows[0].cells[0].innerHTML ="";
	 a.rows[1].cells[1].innerHTML = "";
     a.rows[2].cells[1].innerHTML = "";
     a.rows[3].cells[1].innerHTML = "";
     
     document.form2.textfield.value="";
     document.form2.textfield2.value="";
     document.form2.textfield3.value="";
     document.form2.select3.options[0].selected = 'selected';
     
		<%for(int i=0;i<namelist.size();++i)
		   {%>
	          if(document.form1.select2.options[document.form1.select2.selectedIndex].text=="<%=namelist.get(i)%>")
	          {
	        	  <% JavaBean jBean=dao.getDishInfo(namelist.get(i));  %>
	        	  <% String picture=jBean.getdishespicture();
                     String url="http://10.169.162.122:8080/cbb+book/"+picture;
                  %>
	        	  a.rows[0].cells[0].innerHTML = "<img src='<%=url%>' width='200' height='200'/>";
	        	  a.rows[1].cells[1].innerHTML = "<%=jBean.getdishesname()%>";
	              a.rows[2].cells[1].innerHTML = "<%=jBean.getdishesprice()%>元/份";
	              a.rows[3].cells[1].innerHTML = "<%=jBean.getdishesflag()%>";
	              
	              document.form2.textfield.value="<%=jBean.getdishespicture() %>";
	              document.form2.textfield2.value="<%=jBean.getdishesname()%>";
	              document.form2.textfield3.value="<%=jBean.getdishesprice()%>"; 
	              document.form2.textfield4.value="<%=jBean.getdishesname()%>";
	              
	              var s1='有';
	              var s2='<%=jBean.getdishesflag()%>';
	              if(s2==s1)
	            	  document.form2.select3.options[1].selected = 'selected';
	              else
	            	  document.form2.select3.options[2].selected = 'selected'; 
	                  
	           }
	       <%}%>
}


function check()
{
	 if(document.form2.textfield.value==""){
		   alert("请输入图片网址!");
		   document.form2.textfield.focus();
		 return false;
		 }
	
	 if(document.form2.textfield2.value==""){
		   alert("请输入菜品名称!");
		   document.form2.textfield2.focus();
		 return false;
		 }
	 
	 if(document.form2.textfield3.value==""){
		   alert("请输入菜品单价!");
		   document.form2.textfield3.focus();
		 return false;
		 }
	 
	 if(/^[1-9]\d*$|^0$/.test(document.form2.textfield3.value)==false){
	   alert("菜品单价只能为数字！");
	   document.form2.textfield3.value="";
	   document.form2.textfield3.focus();
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
            <li><a href="InsertDish.jsp">增加菜品</a></li>
            <li><a href="DataMining.jsp">数据汇总</a></li>
            <li><a href="LogOut.jsp">退出登录</a></li>
        </ul>
    </div>
</div >

<div id="apDiv2">更新菜品 </div>
 
<div id="apDiv1">
<form id="form1" name="form1" method="post" action="" >
  <p>
     <select name="select" size="1" id="select1" onchange="getSelectValue()">
      <option value="大类" selected="selected">大类</option>
    
     <% for (int i=0;i<fatherlist.size();++i){ %>
    
     <option value="<%=fatherlist.get(i)%>"><%=fatherlist.get(i)%></option>	 
    <%} %>
   </select>
    &nbsp; &nbsp;
    
    <select name="select2" size="1" id="select2" onchange="SetTableValue()">
     <option value="小类" >小类</option>
    </select> 
    &nbsp;
   &nbsp;
  </p>
</form>
</div>


<div id="apDiv3">
 </br>
      <table width="100%"  cellspacing="0" cellpadding="0" class="bordered" id="table1">
    <tr>
      <td width="10%" rowspan="4" bgcolor="#EDD9C0"></td>
    </tr>
    <tr>
      <td width="20%" height="40" >名称：</td>
      <td width="80%"></td>
    </tr>
    <tr>
      <td height="40" >单价：</td>
      <td></td>
    </tr>
    <tr>
      <td height="40" >状态：</td>
      <td></td>
    </tr>
  </table>
  </br>
  
  <form id="form2" name="form2" method="post" action="UpdateDish" onSubmit="return check()" class="FormCSS">
   </br>
  <p>请输入更新信息：</p>
  
  <p>图片来源：
    <label for="textfield"></label>
    <input type="text" name="textfield" id="textfield" style="width:130px; height:20px;"/>
  </p>
  
  <p>菜品名称：
    <label for="textfield2"></label>
    <input type="text" name="textfield2" id="textfield2" style="width:130px; height:20px;" />
  </p>
  
  <p>菜品单价：
    <label for="textfield3"></label>
    <input type="text" name="textfield3" id="textfield3" style="width:130px; height:20px;"/>
  </p>
  
  <p>菜品状态：
   <select name="select3" size="1" id="select3" style="width:135px; height:25px;" >
       <option value=" " > </option>
       <option value="有" >有</option>
       <option value="无" >无</option>
    </select> 
    
  </p>
  
  <input type="submit" name="button" id="button" value="更新" />
   </br>
  <input type="text" name="textfield4" id="textfield4" style="display:none" />
</form>
</div>
<%} %>
</body>
</html>