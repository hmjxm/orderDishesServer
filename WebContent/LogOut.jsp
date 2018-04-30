<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>退出系统</title>
    
 <meta http-equiv="pragma" content="no-cache">
 <meta http-equiv="cache-control" content="no-cache">
 <meta http-equiv="expires" content="0">    
 <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
 <meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
   <%

//先将session的值移除掉
   session.removeAttribute("username");

//再消毁掉session,更加安全,消毁一定要在后面,要是先消毁再操作session会出异常
   session.invalidate();
   
    %>
    <script type="text/javascript">
    alert("成功退出,确定后转向登录页面");
    location.href="Login.jsp";
    </script>
  </body>
</html>