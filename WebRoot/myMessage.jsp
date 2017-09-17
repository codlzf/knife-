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
    
    <title>My JSP 'myMessage.jsp' starting page</title>
    
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
  <a href="privateSpace.jsp">私人空间</a>
  <table style="text-align: center;">
  <tr>
  <td>id</td>
  <td>标题</td>
  <td>发帖时间</td>
  </tr>
    <s:iterator value="msgs" var="b">
    
    <tr>
    <td><s:property value="#b.id" /></td>
    <td><a href="getSingleMessage?id=<s:property value="#b.id" />"><s:property value="#b.title" /></a></td>
    <td><s:property value="#b.time" /></td>
    <td>
    <a href="delMyMessage?msg.id=<s:property value="#b.id" />">删除</a>
   </td>
    </tr>
    </s:iterator></table>
    <s:debug></s:debug>
  </body>
</html>
