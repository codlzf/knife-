<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body style="background-color: #7B68EE;">
<a href="login.jsp">回到登录界面</a>
	<div
		style="width: 350px;height: 140px;border: 1px solid #000000;margin-left: 765px;margin-top: 370px;background-color: #87CEEB;">
		<div style="margin-top: 15px;margin-left: 50px;">
			<table>
				<form action="register" method="post">
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="ruser.username"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="ruser.password"></td>
				</tr>
				<tr>
					<td>重复密码：</td>
					<td><input type="password" name="ruser.rePassword"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="注册"></td>
				</tr>

				</form>

<!-- 				<a href="login.jsp">回到登录界面</a> -->
			</table>
		</div>
	</div>
</body>
</html>
