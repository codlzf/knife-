<%@ page language="java" import="java.util.*,lzf.model.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<style type="text/css">
a:link {
	color: #000000;
	text-decoration: none;
}

a:visited {
	color: #000000;
	text-decoration: none;
}

a:hover {
	color: #000000;
	text-decoration: none;
}

a:active {
	color: #FFFFFF;
	text-decoration: none;
}
</style>
<base href="<%=basePath%>">

<title>My JSP 'getAllMessage.jsp' starting page</title>

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
	<s:if test='users.role=="管理员"'>
		<s:iterator value="msgs" var="b">
			<div align="left"
				style="width: 1150px;height: 120px;border: 1px solid #000000;margin-left: 384px;margin-top:7px;">
				<div
					style="margin-left: 10px;margin-top: 10px;width: 800px;height: 30px;">
					<a href="getSingleMessage?id=<s:property value="#b.id" />"><font
						style="font-size: 26px;"><s:property value="#b.title" /></font></a>
				</div>
				<div
					style="margin-left: 840px;margin-top: -32px;width: 170px;height: 30px;">
					贴主：
					<a href="getSingleHobby?textss=<s:property value="#b.leaveUser" />"><s:property value="#b.leaveUser" /></a>
				</div>
				<div
					style="margin-left: 10px;margin-top: 14px;width: 980px;height: 25px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><s:property
							value="#b.messages" /></font>
				</div>

				<div
					style="width: 150px;height: 18px;margin-top: 7px;margin-left: 990px;">
					<s:property value="#b.time" />
				</div>
				<div
					style="width: 50px;height: 30px;margin-top: -90px;margin-left: 1050px;">
					<a href="topMessage?msg.id=<s:property value="#b.id" />">置顶</a>
				</div>
				<div
					style="width: 50px;height: 25px;margin-top: 10px;margin-left: 1050px;">
					<a href="delMyMessage?msg.id=<s:property value="#b.id" />">删除</a></div>
				
			</div>
		</s:iterator>
	</s:if>
	<s:else>
		<s:iterator value="msgs" var="b">
			<div align="left"
				style="width: 1150px;height: 120px;border: 1px solid #000000;margin-left: 384px;margin-top:7px;">
				<div
					style="margin-left: 10px;margin-top: 10px;width: 800px;height: 30px;">
					<a href="getSingleMessage?id=<s:property value="#b.id" />"><font
						style="font-size: 26px;"><s:property value="#b.title" /></font></a>
				</div>
				<div
					style="margin-left: 840px;margin-top: -32px;width: 170px;height: 30px;">
					贴主：
					<a href="getSingleHobby?textss=<s:property value="#b.leaveUser" />"><s:property value="#b.leaveUser" /></a>
				</div>
				<div
					style="margin-left: 10px;margin-top: 14px;width: 980px;height: 25px;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="gray"><s:property
							value="#b.messages" /></font>
				</div>

				<div
					style="width: 150px;height: 18px;margin-top: 9px;margin-left: 990px;">
					<s:property value="#b.time" />
				</div>
			</div>
		</s:iterator>
	</s:else>
	<s:debug></s:debug>
</body>
</html>
