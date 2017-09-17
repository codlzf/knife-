<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'modifyUserHobby.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body onload="addyear()">
	<script type="text/javascript">
		function addyear() {
			var se = document.getElementById("y");
			se.innerHTML = "";
			for (var i = 1960; i < 2017; i++) {
				var newNode = document.createElement("option");
				newNode.value = i;
				newNode.innerHTML = newNode.value + "年";
				se.appendChild(newNode);
			}
			addmonth();
		}
	
	
	
		function addmonth() {
			var se = document.getElementById("m");
			se.innerHTML = "";
			for (var i = 1; i < 13; i++) {
				var newNode = document.createElement("option");
				newNode.value = i;
				newNode.innerHTML = newNode.value + "月";
				se.appendChild(newNode);
				getmonth();
			}
		}
		function getmonth() {
			var se = document.getElementById("m");
			addday(se.value);
		}
	
	
	
		function addday() {
			var c;
			var ye = document.getElementById("y");
			var me = document.getElementById("m");
			var se = document.getElementById("d");
			var i = me.value;
			se.innerHTML = "";
			if (i == 1 || i == 3 || i == 5 || i == 7 || i == 8 || i == 10 || i == 12) {
				c = 31;
			} else if (i == 2) {
				if (ye.value % 4 == 0) {
					c = 29;
				} else {
					c = 28;
				}
			} else {
				c = 30;
			}
			for (var a = 1; a <= c; a++) {
	
				var newNode = document.createElement("option");
				newNode.value = a;
				newNode.innerHTML = newNode.value + "日";
				se.appendChild(newNode);
			}
			getbirthday();
			getstar();
		}
	
		function getstar() {
			var m = document.getElementById("m");
			var star;
			var arr3 = new Array("水瓶座", "双鱼座", "白羊座", "金牛座", "双子座", "巨蟹座", "狮子座", "处女座", "天秤座", "天蝎座", "射手座", "魔蝎座");
			star = arr3[m.value - 1];
			document.getElementById("star").value = star;
	
		}
	
		function getbirthday() {
			var y = document.getElementById("y").value;
			var m = document.getElementById("m").value;
			var d = document.getElementById("d").value;
	
			if (m < 10) {
				m = "0" + m;
			}
			if (d < 10) {
				d = "0" + d;
			}
			var obj = document.getElementById("birthday").value = y + "年-" + m + "月-" + d + "日";
	
			document.getElementById("myform").submit;
		}
	</script>
	<div>
		<form id="myform" action="saveInfo" method="post">
			<table>

				<tr>
					<td>用户id：</td>
					<td><input type="text" readonly="readonly" name="ui.id"
						value=<s:property value="users.id" />></td>
				</tr>
				<tr>
					<td>用户名：</td>
					<td><input type="text" readonly="readonly" name="ui.username"
						value=<s:property value="users.username" /> /></td>
				</tr>
				<tr>
					<td>性别：</td>
					<td><input type="radio" name="ui.sex" value="男"
						<s:if test='ui.sex=="男"'>checked="checked"</s:if> />男 <input
						type="radio" name="ui.sex" value="女"
						<s:else>checked="checked"</s:else> />女</td>
				</tr>
				<tr>
					<td>出生年月：</td>
					<td><select name="year" id="y">
					</select> <select name="month" id="m" onchange="getmonth()">
					</select> <select name="day" id="d" onchange="show();">
					</select> <input type="hidden" name="ui.birthday" id="birthday">
				</tr>
				<tr>
					<td>爱好：</td>
					<td><input type="text" value="<s:property value="ui.hobby" />"
						name="ui.hobby" /></td>
				</tr>
				<tr>
					<td>自我介绍：</td>
					<td><input type="text"
						value="<s:property value="ui.introduce" />" name="ui.introduce" /></td>
				</tr>
				<tr>
					<td>星座：</td>
					<td><input type="text" name="ui.star" id="star"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>城市：</td>
					<td><input type="radio" name="ui.city" value="北京"
						<s:if test='ui.city=="北京"'>checked="checked"</s:if> />北京 <input
						type="radio" name="ui.city" value="上海"
						<s:elseif test='ui.city=="上海"'>checked="checked"</s:elseif> />上海
						<input type="radio" name="ui.city" value="广州"
						<s:elseif test='ui.city=="广州"'>checked="checked"</s:elseif> />广州
						<input type="radio" name="ui.city" value="深圳"
						<s:elseif test='ui.city=="深圳"'>checked="checked"</s:elseif> />深圳
						<input type="radio" name="ui.city" value="其他"
						<s:elseif test='ui.city=="其他"'>checked="checked"</s:elseif> />其他</td>
				</tr>
				<tr>
					<td><button id="btn" onclick="getbirthday()">提交</button></td>
				</tr>

			</table>
		</form>
	</div>

</body>
</html>
