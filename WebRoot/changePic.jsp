<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">
  div{
  margin-left: 140px;
  margin-top: 100px;
  }
  </style>
    <base href="<%=basePath%>">
    
    <title>My JSP 'changePic.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div align="left"><a href="privateSpace">返回个人中心</a></div>
<div align="center">选择你的头像</div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=1"><img alt="" src="image/tx1.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=2"><img alt="" src="image/tx2.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=3"><img alt="" src="image/tx3.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=4"><img alt="" src="image/tx4.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=5"><img alt="" src="image/tx5.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=6"><img alt="" src="image/tx6.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=7"><img alt="" src="image/tx7.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=8"><img alt="" src="image/tx8.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=9"><img alt="" src="image/tx9.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=10"><img alt="" src="image/tx10.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=11"><img alt="" src="image/tx11.jpg" width="140" height="140"></a></div>
   <div style="float: left;margin-left: 150px;"><a href="changePic?id=12"><img alt="" src="image/tx12.jpg" width="140" height="140"></a></div>


  </body>
</html>
