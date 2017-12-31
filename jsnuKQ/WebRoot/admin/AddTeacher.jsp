<%@page import="javax.persistence.Id"%>
<%@page import="com.student.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>后台首页</title>
<link href="/jsnuKQ/Bootstrap/css/bootstrap.min.css" rel="stylesheet" />
<link href="/jsnuKQ/admin/css/header.css" rel="stylesheet">
<link href="/jsnuKQ/admin/css/AddStudent.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="frame/header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form role="form" action="/jsnuKQ/student/regist" method="post">
					<div class="form-group">
						<label for="teacherId">教工号:</label> <input type="text"
							class="form-control " id="teacherId" placeholder="请输入教工号"
							name="admin.teacherId" onblur="yanzhengID()"> <span
							class="pull-right" id="jiance"><a
							class="btn btn-danger btn-group-xs"
							onclick="verificationStudentID()">检测教工号</a></span> <span
							class="text-danger text-center"><s:property
								value="errors.stIdExist[0]" /></span> <br> <span
							class="text-danger" id="stIDerror" style="font-size: 18px;"></span>
					</div>

					<div class="form-group">
						<label for="name">姓名:</label> <input type="text"
							class="form-control" id="name" placeholder="请输入姓名"
							name="admin.name">
					</div>

					<div class="radio">
						<label> <input type="radio" name="optionsRadios"
							id="optionsRadios1" value="男" checked> 男
						</label> <label> <input type="radio" name="optionsRadios"
							id="optionsRadios1" value="女"> 女
						</label>
					</div>



					<div class="form-group">
						<label for="pw">密码</label> <input type="text" class="form-control"
							id="pw" placeholder="请输入密码" name="admin.password"
							onblur="yanzhengPW()"> <span class="text-danger"
							id="pw1Error" style="font-size: 18px;"></span>
					</div>

					<div class="form-group">
						<label for="pw_again">确认密码：</label> <input type="text"
							class="form-control" id="pw_again" placeholder="请再次输入密码"
							onblur="yanzhengPWagain()"> <span class="text-danger"
							id="pw2Error" style="font-size: 18px;"></span>
					</div>

					<div class="form-group">
						<label for="college">学院：</label> <select class="form-control"
							name="admin.coolege" id="college">
							<option>智慧教育学院</option>
							<option>教育科学学院</option>
							<option>文学院</option>
							<option>外国语学院</option>
							<option>马克思主义学院</option>
						</select>
					</div>

					<div class="form-group">
						<label for="grade">年级</label> <select class="form-control"
							name="user.grade" id="grade">
							<option>大一</option>
							<option>大二</option>
							<option>大三</option>
							<option>大四</option>
						</select>
					</div>

					<div class="form-group">
						<label for="role">权限</label> <select class="form-control"
							name="user.role" id="role">
							<option>教师</option>
							<option>管理员</option>
						</select>
					</div>

					<a type="submit" class="btn btn-default btn-primary"
						id="btn-submit" onclick="ButtonSubmit()">提交</a>
					<button type="reset" class="btn btn-default btn-primary" id="reset">重置</button>
				</form>
			</div>
			<div class="col-md-2"></div>

		</div>

	</div>

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="../Bootstrap/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			//window.setInterval("login()", 10); //禁用按钮
		});
		//如果填上的位数为8位
		function yanzhengID() {
			var pattern = /^\d{8}$/ //创建正则表达式
			var $password = $("#pw");
			var $pw_again = $("#pw_again");
			var text = $("input#teacherId").val(); //获取表单的内容
			//首先确保长度为8
			if (text.length == 8) {
				//如果内容匹配
				if (!pattern.test(text)) {
					$("#stIDerror").html("输入错误，请重新输入"); //显示提示语句
					$("#stIDerror").parent("div").addClass("has-error");
				} else {
					$("#stIDerror").html(""); //清除提示语句
					$("#stIDerror").parent("div").removeClass("has-error");
					$password.val(text);
					$pw_again.val(text);
				}
			} else {
				$("#stIDerror").html("输入错误，请重新输入");
				$("#stIDerror").parent("div").addClass("has-error");
			}
		}
		//验证第一次输入的密码
		function yanzhengPW() {
			var $pw = $("#pw"); //输入密码的对象
			var $pw1Error = $("#pw1Error");
			if ($pw.val() == "") {
				$pw1Error.html("密码不能为空");
				$pw1Error.parent("div").addClass("has-error");
			} else {
				$pw1Error.html(""); //清空提示语句
				$pw1Error.parent("div").removeClass("has-error");
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
				$pw2Error.parent("div").addClass("has-error");
			} else {
				$pw2Error.html("");
				$pw2Error.parent("div").removeClass("has-error");
			}
		}

		function verificationStudentID() {
			
			var teacherId = $("#teacherId").val(); //获取表单输入的学号
			var d = {
				"teacherId" : teacherId
			}; //请求的数据
			$.post("/jsnuKQ/admin/verificationTeacherID", d, function(data, status,
					xhr) {
				if (status == "success") {
					alert(data);
				} else {
					alert("响应失败，请重新点击！！！");
				}
				;
			});
		}

		//登录时调用
		function login() {
			var $stIDerror = $("#stIDerror");
			var $pw1Error = $("#pw1Error");
			var $pw2Error = $("#pw2Error");
			//如果这些提示信息不为空，那么就会禁用提交按钮
			if ($stIDerror.html() != "" || $pw1Error.html() != ""
					|| $pw2Error.html() != "" || $("#studentId").val() == ""
					|| $("#name").val() == "" || $("#pw").val() == ""
					|| $("#pw_again").val() == "") {

				document.getElementById("btn-submit").disabled = true; //禁用提交按钮
			} else {
				document.getElementById("btn-submit").disabled = false; //启用按钮
			}
		}

		//表单提交的时触发
		function ButtonSubmit() {
			//以下的语句获取表单的对象
			var $teacherId = $("#teacherId");
			var $name = $("#name");
			var $password = $("#pw");
			var $college = $("#college");
			var $grade = $("#grade");
			var $role=$("#role");  //角色
			var sex; //性别
			var radio = document.getElementsByName("optionsRadios"); //获取复选按钮的节点，用name属性获取
			for (var i = 0; i < radio.length; i++) {
				if (radio[i].checked == true) //如果哪一个按钮被点击了，那么就返回哪一个的值
					sex = radio[i].value;
			}

			//设置提交的值
			var d = {
				"admin.teacherId" : $teacherId .val(),
				"admin.name" : $name.val(),
				"admin.sex" : sex,
				"admin.password" : $password.val(),
				"admin.coolege" : $college.val(),
				"admin.grade" : $grade.val(),
				"admin.role":$role.val()
			};
			$.post("/jsnuKQ/admin/addTeacher", d, function(data, status, xhr) {
				if (status == "success") {
					alert(data);
				} else {
					alert("响应失败，请重新添加!!")
				}
			});
		}
	</script>
</body>
</html>