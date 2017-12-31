<%@page import="com.student.entity.User"%>
<%@page import="com.student.entity.Situation"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>江苏师范大学考勤系统</title>
<link href="/jsnuKQ/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/jsnuKQ/student/css/index.css" rel="stylesheet" />
</head>

<%
	User user = (User) request.getAttribute("user"); //获取user对象
%>


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
		<a class="navbar-brand" href="http://www.xznu.edu.cn/"> <img src="jiangsushifa.png"
			class="img-responsive" />
		</a>
	</div>

	<div class="collapse navbar-collapse pull-right"
		id="example-navbar-collapse">
		<ul class="nav navbar-nav">

			<li><button data-toggle="modal" data-target="#myModal"
					class="btn btn-primary btn-lg">修改</button></li>
			<li><button class="btn btn-primary btn-lg" id="btn-exit">退出</button></li>

		</ul>
	</div>
	</nav> </header>

	<div class="container-fluid">
		<div class="row">
			<div class="table-responsive">
				<table class="table">
					<caption>考勤情况</caption>
					<thead>
						<tr>
							<th>日期</th>
							<th>状态</th>
							<th>教师</th>
						</tr>
					</thead>
					<tbody>
						<%-- 使用迭代输出查询到的值 --%>
						<s:iterator var="item" value="#request.set">
							<tr>
								<td><s:property value="#item.date" /></td>
								<td><s:property value="#item.state" /></td>
								<td><s:property value="#item.teacherName" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
		<hr />
		<div class="row">
			<footer style="position: relative;left: 510px;">
			<p>
				<span><a href="https://chenjiabing666.github.io/">陈加兵</a></span>
				&nbsp;&nbsp;&nbsp;&nbsp;<span>|&nbsp;&nbsp;&nbsp;Copyright ©
					2017 ,</span> <span><a href="http://www.xznu.edu.cn/">江苏师范大学</a></span>
			</p>
			</footer>
		</div>

	</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">

			<div class="modal-content">

				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改信息</h4>
				</div>

				<div class="modal-body">
					<form role="form" action="/jsnuKQ/student/change" method="post">
						<div class="form-group">
							<label for="studentId">学号:</label> <input type="text"
								class="form-control" id="studentId" placeholder="请输入学号"
								name="user.studentId" readonly="readonly"
								value="<%=user.getStudentId()%>"> <span
								class="text-danger text-center"><s:property
									value="errors.stIdExist[0]" /></span> <br> <span
								class="text-danger" id="stIDerror" style="font-size: 18px;"></span>
						</div>

						<div class="form-group">
							<label for="name">姓名:</label> <input type="text"
								class="form-control" id="name" placeholder="请输入姓名"
								name="user.name" readonly="readonly" value="<%=user.getName()%>">
						</div>



						<div class="form-group">
							<label for="telephone">手机号码：</label> <input type="text"
								class="form-control" name="user.telephone" id="telephone"
								placeholder="请输入自己的手机号码" onblur="yanzhengTEL()"
								value="<%=user.getTelephone()%>"> <span
								class="text-danger" id="telError" style="font-size: 18px;"></span>
						</div>

						<div class="form-group">
							<label for="pw">新密码</label> <input type="password"
								class="form-control" id="pw" placeholder="请输入新的密码"
								name="user.password" onblur="yanzhengPW()"> <span
								class="text-danger" id="pw1Error" style="font-size: 18px;"></span>
						</div>

						<div class="form-group">
							<label for="pw_again">确认密码：</label> <input type="password"
								class="form-control" id="pw_again" placeholder="请再次输入密码"
								onblur="yanzhengPWagain()"> <span class="text-danger"
								id="pw2Error" style="font-size: 18px;"></span>
						</div>

					</form>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-danger" id="btn-submit">
						提交更改</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->

		<script src="js/jquery-3.2.1.min.js"></script>
		<script src="../Bootstrap/js/bootstrap.min.js"></script>

		<script type="text/javascript">
			$(function() {
				window.setInterval("login()", 10);
				
				//退出按钮重定
				$("#btn-exit").click(function(){
					window.location.href="/jsnuKQ/student/exit";
				});
				//生成ajax修改信息
				$("#btn-submit").click(function() {
					var stid = $("#studentId").val(); //学号
					var pass = $("#pw").val(); //密码
					var name = $("#name").val(); //姓名
					var telephone = $("#telephone").val(); //电话号码
					$.post("/jsnuKQ/student/change", {
						"user.studentId" : stid,
						"user.password" : pass,
						"user.name" : name,
						"user.telephone" : telephone
					}, function(data, status, xhr) {
						//如果请求成功
						if (status == "success") {
							alert(data);
						} else {
							alert("修改失败,请重新输入");
						}
					});
				});

			});
			//验证手机号码
			function yanzhengTEL() {
				var $tel = $("#telephone"); //获取手机号码的对象
				var $error = $("#telError"); //获取提示消息的文本
				var text = $tel.val();

				var pattern = /^\d{11}$/;
				//首先判断是否为11位数
				if (text.length == 11) {
					//如果号码符合要求				
					if (!pattern.test(text)) {
						$error.html("手机号码错误，请重新输入！！");
					} else {
						$error.html(""); //正确之后就清空提示信息
					}
				} else {
					$error.html("手机号码错误，请重新输入！！");
				}

			}

			//验证第一次输入的密码
			function yanzhengPW() {
				var $pw = $("#pw"); //输入密码的对象
				var $pw1Error = $("#pw1Error");
				if ($pw.val() == "") {
					$pw1Error.html("密码不能为空");
				} else {
					$pw1Error.html(""); //清空提示语句
				}

			}

			//验证重新输入密码
			function yanzhengPWagain() {
				var $pw = $("#pw"); //输入密码的对象
				var $pw_again = $("#pw_again"); //确认密码的对象
				var $pw2Error = $("#pw2Error"); //错误提示消息的对象

				var pw1 = $pw.val(); //第一次输入的密码
				var pw2 = $pw_again.val();
				if (pw1 != pw2) {
					$pw2Error.html("密码确认错误");
				} else {
					$pw2Error.html("");
				}
			}

			//登录时调用
			function login() {
				var $stIDerror = $("#stIDerror");
				var $telError = $("#telError");
				var $pw1Error = $("#pw1Error");
				var $pw2Error = $("#pw2Error");
				//如果这些提示信息不为空，那么就会禁用提交按钮
				if ($stIDerror.html() != "" || $telError.html() != ""
						|| $pw1Error.html() != "" || $pw2Error.html() != ""
						|| $("#telephone").val() == "" || $("#pw").val() == ""
						|| $("#pw_again").val() == "") {

					document.getElementById("btn-submit").disabled = true; //禁用提交按钮
				} else {
					document.getElementById("btn-submit").disabled = false; //启用按钮
				}
			}
		</script>
</body>
</html>