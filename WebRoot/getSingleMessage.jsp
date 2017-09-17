<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s" %>

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

<title>My JSP 'getSingleMessage.jsp' starting page</title>

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
	<div align="left"
		style="width: 1150px;height: 52px;border: 1px solid #000000;margin-left: 384px;margin-top: 7px;">
		<font style="font-size: 25px">
			<div
				style="width: 800px;height: 30px;margin-left: 12px;margin-top: 10px;">
				标题：
				<s:property value="msg.title" />
		</font>
	</div>

	</div>
	<div align="left"
		style="width: 1148px;height: 254px;border: 1px solid #000000;margin-left: 384px;margin-top: 7px;">
		
		<div style="margin-left: 30px;margin-top: 20px">
				<img alt="" src="<s:property value="users.pic" />" width="140px;" height="140px">
			</div>
			<div align="center"
				style="width: 140px;height: 30px;margin-left: 30px;margin-top: 12px;">
				<a href="getSingleHobby?textss=<s:property value="msg.leaveUser" />"><s:property value="msg.leaveUser" /></a>
			</div>
			<div align="center"
				style="width: 140px;height: 30px;margin-left: 30px;margin-top: 12px;">
				楼主
			</div>
			<div
				style="margin-left: 200px;margin-top: -180px;width: 900px;height: 155px;">
				<s:property value="msg.messages" />
			</div>
			<div
				style="margin-left:980px;margin-top: 10px;width: 150px;height: 25px;">
				<s:property value="msg.time" />
			</div>
		</div>
	<s:iterator value="sc" var="b">
		<div align="left"
			style="width: 1148px;height: 214px;border: 1px solid #000000;margin-left: 384px;margin-top:7px;">

			<div style="margin-left: 30px;margin-top: 20px">
				<img alt="" src="<s:property value="#b.pic" />" width="140px;" height="140px">
			</div>
			<div align="center"
				style="width: 140px;height: 30px;margin-left: 30px;margin-top: 12px;">
				<a href="getSingleHobby?textss=<s:property value="#b.cname" />"><s:property value="#b.cname" /></a>
			</div>
		
			<div
				style="margin-left: 200px;margin-top: -180px;width: 900px;height: 155px;">
				<s:property value="#b.textss" />
			</div>
			<div
				style="margin-left:980px;margin-top: 10px;width: 150px;height: 25px;">
				<s:property value="#b.time" />
			</div>
		</div>
	</s:iterator>
	<div align="left"
			style="width: 1148px;height: 303px;border: 1px solid #000000;margin-left: 384px;margin-top:7px;">
			
<form action="comment?id=<s:property value="msg.id" />" name="myform"
		method="post">
		<input type="hidden" name="textss" id="txt">
		<textarea style="resize: none;" id="tss" rows="20" cols="161" style="overflow:hidden;">我的评论。。。</textarea>
		<br />
		<script type="text/javascript">
    function doSubmit(){
    document.getElementById("txt").value=document.getElementById("tss").value;
   document.getElementsByName("myform")[0].submit();
   
    }
    </script>
		<input type="button" value="评论" onclick="doSubmit()">
	</form>
		</div>

	
	
	<s:debug></s:debug>
</body>
</html>
