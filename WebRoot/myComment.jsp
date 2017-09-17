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
    
    <title>My JSP 'myComment.jsp' starting page</title>
    
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
  <td>帖子标题</td>
  <td>我的评论</td>
  <td>发帖时间</td>
  </tr>
    <s:iterator value="cjm" var="b">
    
    <tr>
    <td><a href="getSingleMessage?id=<s:property value="#b.messageId" />"><s:property value="#b.messageTitle" /></a></td>
    <td><s:property value="#b.comment" /></td>
    <td><s:property value="#b.time" /></td>
    <td><a href="delComment?com.id=<s:property value="#b.commentId" />">删除</a></td>
    </tr>
    </s:iterator></table>
    <s:if test="%{count!=0}">
    <a href="myComment?count=<s:property value="0" />">首页</a>
    </s:if>
    <s:else>首页</s:else>
    <s:if test="%{count!=0}">
    <a href="myComment?count=<s:property value="count-1" />">上一页</a>
    </s:if>
    <s:else>上一页</s:else>
    <s:if test="%{count!=(sum-1)/10}">
    <a href="myComment?count=<s:property value="count+1" />">下一页</a>
    </s:if>
    <s:else>下一页</s:else>
    <s:if test="%{count!=(sum-1)/10}">
    <a href="myComment?count=<s:property value="(sum-1)/10" />">尾页</a>
    </s:if>
    <s:else>尾页</s:else>
    <s:debug></s:debug>
  </body>
</html>
