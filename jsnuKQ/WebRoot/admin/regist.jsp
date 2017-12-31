<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>学生注册界面</title>
<link href="../Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="css/regist.css" rel="stylesheet" />
</head>

<body>
	<div class="container">

		<div class="row">
			<div class="col-md-3 col-sm-2"></div>
			<div class="col-md-6 col-sm-8">
				<form role="form" action="/jsnuKQ/admin/regist" method="post">
					<div class="form-group">
						<label for="studentId">教工号</label> <input type="text"
							class="form-control" id="studentId" placeholder="请输入教工号"
							name="admin.teacherId" onblur="yanzhengID()"> <span
							class="pull-right" id="jiance"><a href="#"
							class="btn btn-danger btn-group-xs">检测教工号</a></span> <span
							class="text-danger text-center"><s:property
								value="errors.stIdExist[0]" /></span><br> <span class="text-danger"
							id="stIDerror" style="font-size: 18px;"></span>
					</div>

					<div class="form-group">
						<label for="name">姓名:</label> <input type="text"
							class="form-control" id="name" placeholder="请输入姓名"
							name="admin.name">
					</div>

					<div class="radio">
						<label> <input type="radio" name="admin.sex"
							id="optionsRadios1" value="男" checked> 男
						</label> <label> <input type="radio" name="user.sex"
							id="optionsRadios1" value="女" checked> 女
						</label>
					</div>

					<div class="form-group">
						<label for="telephone">手机号码：</label> <input type="text"
							class="form-control" name="admin.telephone" id="telephone"
							placeholder="请输入手机号码" onblur="yanzhengTEL()"> <span
							class="text-danger" id="telError" style="font-size: 18px;"></span>
					</div>

					<div class="form-group">
						<label for="pw">密码</label> <input type="password"
							class="form-control" id="pw" placeholder="请输入密码"
							name="admin.password" onblur="yanzhengPW()"> <span
							class="text-danger" id="pw1Error" style="font-size: 18px;"></span>
					</div>

					<div class="form-group">
						<label for="pw_again">确认密码：</label> <input type="password"
							class="form-control" id="pw_again" placeholder="请再次输入密码"
							onblur="yanzhengPWagain()"> <span class="text-danger"
							id="pw2Error" style="font-size: 18px;"></span>
					</div>

					<button type="submit" class="btn btn-default btn-primary"
						id="btn-submit">提交</button>
					<button type="reset" class="btn btn-default btn-primary" id="reset">重置</button>
				</form>

			</div>

			<div class="col-md-3 col-sm-2"></div>

		</div>

	</div>




	<s:debug></s:debug>



	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="../Bootstrap/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			window.setInterval("login()", 10); //禁用按钮
		});
		//如果填上的位数为8位就会出现填写密码
		function yanzhengID() {
			var pattern = /^\d{8}$/ //创建正则表达式
			var text = $("input#studentId").val(); //获取表单的内容
			//首先确保长度为8
			if (text.length == 8) {
				//如果内容匹配，那么就会出现输入密码的文本框
				if (!pattern.test(text)) {
					$("#stIDerror").html("输入错误，请重新输入"); //显示提示语句
				} else {
					$("#stIDerror").html(""); //清除提示语句
				}
			} else {
				$("#stIDerror").html("输入错误，请重新输入");
			}
		}

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
					|| $("#studentId").val() == "" || $("#name").val() == ""
					|| $("#telephone").val() == "" || $("#pw").val() == ""
					|| $("#pw_again").val() == "") {

				document.getElementById("btn-submit").disabled = true; //禁用提交按钮
			} else {
				document.getElementById("btn-submit").disabled = false; //启用按钮
			}
		}
	</script>
</body>
</body>
</html>