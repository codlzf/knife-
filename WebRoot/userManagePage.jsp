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
    
    <title>My JSP 'userManagePage.jsp' starting page</title>
    
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
  <a href="privateSpace">私人空间</a>
  <table style="text-align: center;">
  <tr>
  <td>id</td>
  <td>用户名</td>
  <td>密码</td>
  <s:iterator value="userList" var="b">
    <tr>
    <td><s:property value="#b.id" /></td>
    <td><s:property value="#b.username" /></td>
    <td><s:property value="#b.password" /></td> 
    <td><a href="delUser?users.id=<s:property value="#b.id" />">删除用户</a></td>
    </tr>
    </s:iterator>
    </table>
    <s:debug></s:debug>
  </body>
</html>
