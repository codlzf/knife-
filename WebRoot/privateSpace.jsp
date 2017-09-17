<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'mainPage.jsp' starting page</title>
    
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
    <a href="leaveMessagePage.jsp">去发表新帖</a><br/>
    
    <a href="getAllMessage.action">查看论坛</a><br/>
    
    <a href="myMessage.action">我的帖子</a><br/>
    
    <a href="myComment.action">我的评论</a><br/>
    
    <a href="modifyUserInfoPage">修改个人信息</a><br/>
    <s:if test='users.role=="管理员"'>
    <a href="userManage">用户管理</a>
    </s:if>
    <a href="changePic.jsp">选择头像</a>
    
    <a href="logout">退出登录</a>
    <a href="modifyUserHobby">修改爱好</a>
    
    <a href="getSingleHobby?id=<s:property value="users.id" />">查看个人信息</a>
  </body>
</html>
