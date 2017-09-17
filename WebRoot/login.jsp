<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
.div1 {
	
}
</style>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

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
	
		<div
			style="width: 350px;height: 140px;border: 1px solid #000000;margin-left: 765px;margin-top: 400px;background-color: #87CEEB;">
			<div style="margin-top: 25px;">
				<table align="center">
					<form action="login" method="post">
						<tr>
							<td>用户名：</td>
							<td><input type="text" name="users.username"></td>
						</tr>
						<tr>
							<td>密码：</td>
							<td><input type="password" name="users.password"></td>
						</tr>
						<tr>
							<td><input type="radio" name="users.role" value="普通用户"
								checked="checked">普通用户</td>
							<td><input type="radio" name="users.role" value="管理员">管理员</td>
						</tr>
						<tr>
							<td><input type="submit" value="登录"></td>
							<td><a href="register.jsp"><input type="button"
									value="注册"></a></td>
						</tr>

					</form>
				</table>
			</div>
		</div>
</body>
</html>
