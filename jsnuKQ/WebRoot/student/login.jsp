<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生登录界面</title>
<link href="/jsnuKQ/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/jsnuKQ/student/css/login.css" rel="stylesheet" />
</head>

<body>
	<div class="container">
		<h1 class="text-center">学生考勤系统</h1>
		<div class="row">
			<div class="col-md-4 col-sm-4"></div>
			<div class="col-md-4 col-sm-4" id="col">
				<form role="form" method="post" action="/jsnuKQ/student/login">
					<div class="form-group">
						<label for="name">学号</label> <input type="text"
							class="form-control" name="user.studentId" id="name"
							placeholder="请输入学号"> <span class="text-danger"
							id="stIDerror" style="font-size: 18px;"><s:property value="errors.stIdNotExist[0]"/></span>
					</div>

					<div class="form-group" id="pwDiv">
						<label for="pw">密码</label> <input type="password"
							class="form-control" name="user.password" id="pw"
							placeholder="请输入密码">
					</div>

					<button type="submit" class="btn btn-default btn-danger"
						id="btn-submit">登录</button>
					<button type="reset" class="btn btn-default btn-danger pull-right">重置</button>
				</form>

			</div>
			<div class="col-md-4 col-sm-4"></div>

		</div>

	</div>

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="../Bootstrap/js/bootstrap.min.js"></script>

	<script>
		$(function() {
			$("#pwDiv").slideUp();
			window.setInterval("yanzhengID()", 10); //每10毫秒调用这个方法验证位数
			window.setInterval("yanzhenglogin()", 10);
		});

		//如果填上的位数为8位就会出现填写密码
		function yanzhengID() {
			var pattern = /^\d{8}/ //创建正则表达式
			var text = $("input#name").val(); //获取表单的内容
			//首先确保长度为8
			if(text.length == 8) {
				//如果内容匹配，那么就会出现输入密码的文本框
				if(pattern.test(text)) {
					$("#stIDerror").html("");   //提示语句为空
					$("#pwDiv").slideDown(); //文本框下滑
				} else {
					$("#stIDerror").html("你输入的学号错误");  //显示提示语句
				}
			}

		}
		//查看提交按钮，如果密码为空，那么提交按钮就是disabled状态
		function yanzhenglogin() {
			var $pw = $("#pw");
			if ($pw.val() == "") {
				$("#btn-submit").addClass("disabled");
			} else {
				$("#btn-submit").removeClass("disabled");
			}
		}

	</script>

</body>
</html>