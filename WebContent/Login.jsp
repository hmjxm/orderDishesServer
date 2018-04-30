<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
     <title>用户登录</title>
     <style type="text/css">
body{
	background:#F98A53;
  font-family: 楷体;
}

body a,form li,.submit input[type="submit"],.new p a,.new p.sign{
	transition: 0.1s all;
	-webkit-transition: 0.1s all;
	-moz-transition: 0.1s all;
	-o-transition: 0.1s all;
}
body h1 {
  color:#fff;
  text-align: center;
  padding: 1em 0;
  font-size: 2.9em;
}
.app-cam h2{
  color: #fff;
  text-align: center;
  padding: 1em 0;
  font-size: 1.6em;
  font-weight: 300;
}
.app-cam{
  width:28%;
  margin:0 auto;
  text-align: center;
  background:url("imgs/bg.png")0px 0px no-repeat;
  padding:4em;
  height: 80%;
}
.cam {
  padding: 1em 0;
}
form {
   padding: 0% 1%;
}
/*-----*/
.cam img {
  margin: 2em 0;
}
.app-cam input[type="text"]{
  width: 81.2%;
  padding: 1.25em 1em 1.25em 4em;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  border: none;
  border-bottom:1px solid #C0C3C8;
  font-family: 楷体;
  background: url("imgs/icons.png") no-repeat 14px 20px #ffffff;
   border-top-left-radius:0.3em;
   -o-border-top-left-radius:0.3em;
   -moz-border-top-left-radius:0.3em;
   -webkit-border-top-right-radius:0.3em;
    border-top-right-radius:0.3em;
   -o-border-top-right-radius:0.3em;
   -moz-border-top-right-radius:0.3em;
   -webkit-border-top-right-radius:0.3em;
  }
.app-cam input[type="password"]{
  width: 81.2%;
  padding: 1.25em 1em 1.25em 4em;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  border: none;
  font-family:楷体;
   background: url("imgs/icons.png") no-repeat 13px -53px #ffffff;
  border: none;
   border-bottom:1px solid #C0C3C8;
   border-bottom-left-radius:0.3em;
   -o-border-bottom-left-radius:0.3em;
   -moz-border-bottom-left-radius:0.3em;
   -webkit-border-bottom-right-radius:0.3em;
    border-bottom-right-radius:0.3em;
   -o-border-bottom-right-radius:0.3em;
   -moz-border-bottom-right-radius:0.3em;
   -webkit-border-bottom-right-radius:0.3em;
  }
.app-cam select{
  width: 80%;
  padding: 1.25em 1em 1.25em 4em;
  color: #283440;
  font-size: 16px;
  outline: none;
  font-weight: 500;
  border: none;
  font-family:楷体;
  border: none;
   border-bottom-left-radius:0.3em;
   -o-border-bottom-left-radius:0.3em;
   -moz-border-bottom-left-radius:0.3em;
   -webkit-border-bottom-right-radius:0.3em;
    border-bottom-right-radius:0.3em;
   -o-border-bottom-right-radius:0.3em;
   -moz-border-bottom-right-radius:0.3em;
   -webkit-border-bottom-right-radius:0.3em;
  }

  .submit {
  margin: 1em 0;
  }
.app-cam input[type="submit"]{
  font-size: 20px;
  font-weight: 300;
  color: #fff;
  cursor: pointer;
  outline: none;
  padding: 17px 15px;
  width:100%;
  border:3px solid #f9671e;
  background: #f9671e;
  border-radius: 0.3em;
  -o-border-radius: 0.3em;
  -webkit-border-radius: 0.3em;
  -moz-border-radius: 0.3em;
}
input[type="submit"]:hover{
  background:none;
  border: 3px solid #f9671e;
  color: #f9671e;
}
.buttons{
    margin: 5em 0 1em 0;
}



@media (max-width:1440px){
  .app-cam{
    width:30%;
  }
  .app-cam input[type="text"],.app-cam input[type="password"]{
    width: 80.2%;
  	
  }
}
@media (max-width:1366px){
  .app-cam{
    width: 30%;
  }
.app-cam input[type="text"], .app-cam input[type="password"] {
    width: 79.7%;
  }
body h1 {
  font-size: 2.6em;
}
  	
}
@media (max-width:1280px){
  .app-cam {
  width: 35%;
  }
  .app-cam input[type="text"], .app-cam input[type="password"] {
  width: 80.7%;
  }
  
}
@media (max-width:1024px){
  .app-cam {
  width: 47%;
  }
  .app-cam input[type="text"], .app-cam input[type="password"] {
  width: 82.7%;
  }
 
}
@media (max-width:768px){
  body h1 {
  font-size: 2.4em;
  }
  .cam img {
  margin: 2em 0;
}
.app-cam h2 {
  padding: 0.8em 0;
  font-size: 1.6em;
}
.app-cam {
  width: 54%;
  margin: 0 auto 0 15%;
}
.copy-right {
  padding: 1em 1em;
}
.app-cam input[type="text"], .app-cam input[type="password"] {
  width:79.7%;
  }
 
}
@media (max-width:640px){
  body h1 {
  font-size: 2.1em;
}
.app-cam input[type="text"], .app-cam input[type="password"] {
    width: 79.8%;
}
.app-cam {
  width: 65%;
  margin: 0 auto 0 7%;
}
.new {
  margin: 2em 0 1em 0;
}
}
@media (max-width:480px){
  .app-cam {
  width: 90%;
  padding: 2em 1em 1em 1em;
  }
  .copy-right p {
    font-size: 0.9em;
  }
  .new p.sign {
  font-size: 0.9em;
  }
  .new p a {
      font-size: 0.97em;

  }
 .new p.sign a {
  font-size: 0.85em;
}
  form {
  width: 82%;
  margin: 0 auto;
  }
  .app-cam {
  width: 80%;
  }
  .app-cam input[type="text"], .app-cam input[type="password"] {
  width: 72.8%;
  }
  
  .buttons {
  margin: 4em 0 1em 0;
}
.cam img {
  width: 25%;
}

}
@media (max-width:320px){
  .app-cam {
  width: 84%;
  padding: 0em 1em 1em 1em;
  margin: 0 auto 0 3%;
  }
  body h1 {
  font-size: 1.5em;
  }
  .copy-right p {
      font-size: 0.8em;
    line-height: 1.7em;
  }
  .app-cam input[type="text"],.app-cam input[type="password"] {
    width:70%;
    padding: 1em 1em 1em 4em;
    font-size: 15px;
    background: url("imgs/icons.png") no-repeat 14px 20px #fff;
    background-size:9%;
  }
  .app-cam input[type="password"] {
    background: url("imgs/icons.png") no-repeat 14px -37px #fff;
  background-size: 9%;
  }
  .new p.sign {
  font-size: 0.87em;
  padding-top: 1px;
}
 .new p a {
  font-size: 0.845em;
}
 .new p.sign a {
  font-size: 0.83em;
}
  .new {
    margin:1em 0 1em 0;
  }
  .submit {
  margin: 1em 0 0.5em 0;
}
  .app-cam input[type="submit"] {
    font-size: 18px;
    padding: 11px 11px;
    }
  form {
  width:100%;
  margin: 0 auto;
  }
 
  .buttons {
  margin: 1em 0 1em 0;
}
  
}
</style>
     
 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">    
 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 <meta http-equiv="description" content="This is my page">
 
 <script type="text/javascript">
 function checklogin(){
  if(document.loginform.username.value=="用户名"){
   alert("请输入用户名！");
   document.loginform.username.focus();
   return false;
  }
  if(document.loginform.userpassword.value=="密码密码密"){
   alert("请输入密码！");
   document.loginform.userpassword.focus();
   return false;
  }
  return true;
 }
 </script>
  </head>
  <body>
	<h1>用户登录</h1>
		<div class="app-cam">
			<div class="cam"><img src="imgs/cam.png" class="img-responsive" alt="" /></div>
			
   <form action="CheckLogin" method="post" name="loginform" onSubmit="return checklogin();">
  <input  name="username" type="text" id="username" class="text" value="用户名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '用户名';}" >
  <input name="userpassword" type="password" id="userpassword"  value="密码密码密" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '密码密码密';}">
  <select name="usertype" size="1" id="usertype" class="select">
      <option style="color:#000000 font-family:楷体;">管理员</option>
      <option style="color:#000000 font-family:楷体;" >服务员</option>
  </select>    
    
    <div class="submit">
    <input type="submit" name="button" id="button" value="登录"></div>
			</form>
		
</body>
</html>