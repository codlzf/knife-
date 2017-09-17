<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'singleHobby.jsp' starting page</title>

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
	<table>
		
		<tr>
			<td>用户名：</td>
			<td><s:property value="ui.username" /></td>
		</tr>
		<tr>
			<td>性别：</td>
			<td><s:property value="ui.sex" /></td>
		</tr>
		<tr>
			<td>生日：</td>
			<td><s:property value="ui.birthday" /></td>
		</tr>
		<tr>
			<td>年龄：</td>
			<td><s:property value="ui.age" /></td>
		</tr>
		<tr>
			<td>兴趣爱好：</td>
			<td><s:property value="ui.hobby" /></td>
		</tr>
		<tr>
			<td>自我介绍：</td>
			<td><s:property value="ui.introduce" /></td>
		</tr>
		<tr>
			<td>星座：</td>
			<td><s:property value="ui.star" /></td>
		</tr>
		<tr>
			<td>所在城市：</td>
			<td><s:property value="ui.city" /></td>
		</tr>
		<tr>
		<td><a href="getAllMessage">返回论坛</a></td>
		</tr>
	</table>
</body>
</html>
