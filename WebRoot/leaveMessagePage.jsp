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
    
    <title>My JSP 'leaveMessagePage.jsp' starting page</title>
    
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
    <form action="leaveMessage" name="myform" method="post">
   标题：<input type="text" name="msg.title"><br/>
   <input type="hidden" id="txt" name="msg.messages">
    帖子正文：<textarea id="tss" rows="20" cols="50" style="overflow:hidden;" ></textarea><br/>
    <script type="text/javascript">
    function doSubmit(){
    document.getElementById("txt").value=document.getElementById("tss").value;
   document.getElementsByName("myform")[0].submit();
    }
    </script>
     <input type="button" value="评论" onclick="doSubmit()">
    </form>
    <s:debug></s:debug>
  </body>
</html>
