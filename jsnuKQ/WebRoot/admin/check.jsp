<%@page import="com.admin.entity.Admin"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>教师登录</title>
<link href="/jsnuKQ/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/jsnuKQ/admin/css/check.css" rel="stylesheet" />
</head>

<body>
	<style>
.navbar {
	position: relative;
	min-height: 87px;
	box-shadow: 2px 2px 2px grey;
	background-color: rgba(38, 140, 115, 0.99);
}

.navbar-default .navbar-nav>.active>a,.navbar-default .navbar-nav>.active>a:focus,.navbar-default .navbar-nav>.active>a:hover
	{
	color: #555;
	background-color: #2196F3;
}

.carousel-inner>.item>a>img,.carousel-inner>.item>img,.img-responsive,.thumbnail a>img,.thumbnail>img
	{
	height: 60px;
}

.nav>li {
	font-size: 20px;
	margin-right: 118px;
	margin-top: 18px;
}
/*设置链接的大小和颜色*/
.navbar-default .navbar-nav>li>a {
	color: #9fc34a;
	font-size: 29px;
	font-weight: 400;
}

.btn-group-lg>.btn,.btn-lg {
	padding: 10px 16px;
	font-size: 31px;
	line-height: 1.3333333;
	border-radius: 6px;
}

.btn-primary {
	color: #00BCD4;
	background-color: #298d75;
	border-color: #298d75;
	font-size: 32px;
	font-family: sans-serif;
	font-weight: 700;
}
</style>
	<!--导航栏-->
	<header> <nav class="navbar navbar-default navbar-fixed-top"
		role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target="#example-navbar-collapse">
			<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="http://www.xznu.edu.cn/"> <img
			src="image/jiangsushifa.png" class="img-responsive" />
		</a>
	</div>

	<div class="collapse navbar-collapse pull-right"
		id="example-navbar-collapse">
		<ul class="nav navbar-nav">

			<li><button data-toggle="modal" data-target="#myModal"
					class="btn btn-primary btn-lg">修改</button></li>
			<li><button class="btn btn-primary btn-lg" id="btn-exit" onclick="Exit()">退出</button></li>

		</ul>
	</div>
	</nav> </header>

	<div class="container-fluid">

		<div class="row">

			<div class="col-md-3 col-xs-3 col-sm-3">
				<div class="form-group">
					<label for="name">年级</label> <select class="form-control"
						id="grade_select">
						<option>大一</option>
						<option>大二</option>
						<option>大三</option>
						<option>大四</option>
					</select>
				</div>
			</div>
			<div class="col-md-3 col-xs-3 col-sm-3">
				<div class="form-group">
					<label for="name">学院</label> <select class="form-control"
						id="coolege_select">
						<s:iterator var="cool" value="#request.coolege">
							<option><s:property value="#cool" /></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="col-md-3 col-xs-3 col-sm-3">
				<div class="form-group">
					<label for="name">班级</label> <select class="form-control"
						id="cls_select">
						<s:iterator var="cl" value="#request.cls">
							<option><s:property value="#cl" /></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="col-md-3 col-xs-3 col-sm-3">
				<button class="btn btn-default btn-sm" id="btn-refresh"
					onclick="refresh_on()">刷新</button>
			</div>
		</div>


		<div class="row">
			<div class="table-responsive">
					<form action="/jsnuKQ/admin/teacherCheck" method="post">
				<table class="table">
					<caption>教师考勤</caption>
					<thead>
						<tr>
							<th>学号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>状态</th>
						</tr>
					</thead>
			
					<tbody>
						<%-- 迭代输出用户信息 --%>
						<%
							int index = 0;
						Admin admin=(Admin)session.getAttribute("admin");   //获取Admin的对象
							Date date = new Date();
							String model = "yyyy-MM-dd HH:mm:ss"; //指定格式化的模板
							SimpleDateFormat dateFormat2 = new SimpleDateFormat(model);
							String time = dateFormat2.format(date); //获取当前的时间
						%>
						
							<s:iterator var="item" value="#request.userList">
								<tr>
									<td class="hidden"><input class="hidden" type="text"
										name="id[<%=index%>]" value='<s:property value="#item.id"/>'></td>
									<td class="hidden"><input class="hidden" type="text"
										name='situation[<%=index%>].teacherName' value='<%=admin.getName()%>'></td>
										
									<td class="hidden"><input class="hidden" type="text"
										name="situation[<%=index%>].date" value='<%=time%>'></td>
									<td><s:property value="#item.studentId" /></td>
									<td><s:property value="#item.name" /></td>
									<td><s:property value="#item.sex" /></td>
									<td><label><input type="radio"
											name='situation[<%=index%>].state' value="正常"
											checked="checked" />正常</label> <label><input type="radio"
											name='situation[<%=index%>].state' value="事假" />事假</label> <label><input
											type="radio" name='situation[<%=index%>].state' value="迟到" />迟到</label>
										<label><input type="radio"
											name='situation[<%=index++%>].state' value="旷课" />旷课</label></td>
								</tr>
							</s:iterator>
						
					</tbody>

				</table>
				</form>
			</div>
		</div>

		<div class="row">
			<div class="col-md-5 col-xs-5 col-sm-5 "></div>
			<div class="col-md-2 col-xs-2 col-sm-2 ">
				<button class="btn btn-default btn-lg" id="btn-submit"
					onclick="button_submit()"
					style="font-size: 20px;border-radius: 24px;">提交</button>
			</div>
			<div class="col-md-5 col-xs-5 col-sm-5 "></div>

		</div>
		<hr />
		<div class="row">
			<footer style="position: relative;left: 499px;">
			<p>
				<span><a href="https://chenjiabing666.github.io/">陈加兵</a></span>
				&nbsp;&nbsp;&nbsp;&nbsp; <span>|&nbsp;&nbsp;&nbsp;Copyright ©
					2017 ,</span> <span><a href="http://www.xznu.edu.cn/">江苏师范大学</a></span>
			</p>
			</footer>
		</div>

	</div>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="../Bootstrap/js/bootstrap.min.js"></script>

	<script>
		//点击刷新按钮执行的方法，将会执行ajax请求
		function refresh_on() {
			//分别获取三个select的对象
			var $grade = $("#grade_select");
			var $coolege = $("#coolege_select");
			var $cls = $("#cls_select");
			var $tobody = $("tbody");
			var $form=$("form");
			$tobody.empty(); //移除所有的子节点
			//请求json数据

			$
					.getJSON(
							"/jsnuKQ/admin/refresh",
							{
								"grade" : $grade.val(),
								"coolege" : $coolege.val(),
								"cls" : $cls.val()
							},
							function(responseData, status, xhr) {
								//如果响应成功
								if (status == "success") {
									//此时的responseData.result只是一个字符串形式的JSON数据，需要个将其解析成JSON
									//使用$.parseJSON解析成真正的JSON数据，解析后的是一个数组
									var json = $.parseJSON(responseData.result);
									//解析完成之后就可以直接访问其中的属性了，比如json.name,json.age,json.password
									//alert(json[0].name);  //访问第一个对象的name属性

									for (var i = 0; i < json.length; i++) {
										var ele ='<tr id="tr'+json[i].id+'"><td class="hidden"><input type="text" class="hidden" name="id['+i+']" value="'+json[i].id+'"/></td><td>'
												+ json[i].studentId
												+ '</td><td>'
												+ json[i].name
												+ '</td><td>'
												+ json[i].sex
												+ '</td><td>'
												+ '<label><input type="radio" name="situation['+i+'].state"value="正常" checked="checked" />正常</label>'
												+ ' <label><input type="radio" name="situation['+i+'].state" value="事假" />事假</label>'
												+ ' <label><input type="radio" name="situation['+i+'].state" value="迟到" />迟到</label> '
												+ '<label><input type="radio" name="situation['+i+'].state" value="旷课" />旷课</label></td>'
												+'<td class="hidden"><input type="text" class="hidden" name="situation['+i+'].date" value="<%=time%>"></td>'+
												'<td class="hidden"><input type="text" class="hidden" name="situation['+i+'].teacherName" value="<%=admin.getName()%>"></td>';

										$tobody.append(ele); //将其添加到子节点中
									}

								} else {
									alert("刷新失败，请重新刷新!!!")
								}
							});
		}

		//点击提交按钮触发
		function button_submit() {
			$("form").submit();
			alert("提交成功");
		}
		
		function Exit(){
			location.href="/jsnuKQ/admin/exit";
		}
	</script>

</body>
</html>