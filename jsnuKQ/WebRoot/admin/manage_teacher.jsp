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
<link href="/jsnuKQ/admin/css/manage_teacher.css" rel="stylesheet">
</head>

<body>
	<jsp:include page="frame/header.jsp"></jsp:include>

	<!--描述：主体内容-->
	<div class="container-fluid">
		<!--年级，学院，班级-->
		<div class="row">

			<div class="col-md-4 col-xs-4 col-sm-4">
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
			<div class="col-md-4 col-xs-4 col-sm-4">
				<div class="form-group">
					<label for="name">学院</label> <select class="form-control"
						id="coolege_select">
						<s:iterator var="cool" value="#request.coolege">
							<option><s:property value="#cool" /></option>
						</s:iterator>
					</select>
				</div>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-4">
				<button class="btn btn-primary btn-lg" id="btn-refresh"
					onclick="refresh_on()">刷新</button>
			</div>
		</div>
		<div class="row">
			<div class="table-responsive">
				<table class="table">

					<thead>
						<tr>
							<th>教工号</th>
							<th>姓名</th>
							<th>学院</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<!-- 迭代输出 -->
						<c:forEach var="item" items="${requestScope.adminList }">
							<tr id='tr<c:out value="${item.id}"></c:out>'>
								<td><c:out value="${item.teacherId }"></c:out></td>
								<td><c:out value="${item.name }"></c:out></td>
								<td><c:out value="${item.coolege }"></c:out></td>
								<td><button class="btn btn-default"
										onclick="del(<c:out value="${item.id}"></c:out>)">删除</button>
									<button class="btn btn-default"
										onclick="motaikuang(<c:out value="${item.id}"></c:out>)"
										data-toggle="modal" data-target="#myModal">修改</button></td>
							</tr>
						</c:forEach>


					</tbody>
				</table>
			</div>
		</div>


		<!-- 模态框（Modal） 修改教师信息 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">修改教师信息</h4>
					</div>

					<div class="modal-body">
						<form role="form" action="/jsnuKQ/student/change" method="post">

							<div class="form-group">
								<label for="teacherId" class="hidden">ID</label> <input
									type="text" class="form-control hidden" id="ID"
									placeholder="请输入学号" name="id" onblur="yanzhengID()">
							</div>

							<div class="form-group">
								<label for="name">姓名</label> <input type="text"
									class="form-control" id="name" placeholder="请输入姓名" name="name">
							</div>

							<div class="radio">
								<label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="男" checked> 男
								</label> <label> <input type="radio" name="optionsRadios"
									id="optionsRadios1" value="女"> 女
								</label>
							</div>

							<div class="form-group">
								<label for="name">学院：</label> <select class="form-control"
									name="admin.coolege" id="coolege">
									<option>智慧教育学院</option>
									<option>教育科学学院</option>
									<option>文学院</option>
									<option>外国语学院</option>
									<option>马克思主义学院</option>
								</select>
							</div>

							<div class="form-group">
								<label for="grade">年级</label> <select class="form-control"
									name="admin.grade" id="grade">
									<option>大一</option>
									<option>大二</option>
									<option>大三</option>
									<option>大四</option>
								</select>
							</div>

						</form>

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-danger" id="btn-submit"
							onclick="change()">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->

			<script src="js/jquery-3.2.1.min.js"></script>
			<script src="../Bootstrap/js/bootstrap.min.js"></script>
			<script type="text/javascript">
		
		//点击刷新按钮执行的方法，将会执行ajax请求
		function refresh_on() {
			//分别获取三个select的对象
			var $grade = $("#grade_select");
			var $coolege = $("#coolege_select");
			var $tobody = $("tbody");
			$tobody.empty(); //移除所有的子节点
			//请求json数据
			$
					.getJSON(
							"/jsnuKQ/admin/refreshTeacher",
							{
								"grade" : $grade.val(),
								"coolege" : $coolege.val()
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
										var ele = '<tr id="tr'+json[i].id+'"><td>'
												+ json[i].teacherId
												+ '</td><td>'
												+ json[i].name
												+ '</td><td>'
												+ json[i].coolege
												+ '</td>'
												+ '<td><button class="btn btn-default" onclick="del('+json[i].id+')">删除</button><button class="btn btn-default" onclick="motaikuang('+json[i].id+')" data-toggle="modal" data-target="#myModal">修改</button></td></tr>';
										$tobody.append(ele); //将其添加到子节点中
									}

								} else {
									alert("刷新失败，请重新刷新!!!")
								}
							});
		}
		
		
		//删除按钮触发
		function del(id) {
			var href="/jsnuKQ/admin/deleteTeacher?id="+id;
			$.post(href, function(data, status, xhr) {
				if (status == "success") {
					if(data=="删除成功"){ //如果提示信息为删除成功表示已经删除了
						alert(data);
						$("#tr"+id).remove();  //删除这一行
					}else{
						alert(data);
					}
					
				} else {
					alert("删除失败，请重新点击！！");
				}
			});
		}
		
		
			
			
			//点击修改的时候触发，就是传入其中的id的值
			function motaikuang(id){
				$("#ID").val(id);
				var name=$("#tr"+id).children("td:eq(1)").html();//获取姓名
				var college=$("#tr"+id).children("td:eq(2)").html();//获取学院
				var grade=$("#grade_select").val();  //年级
				$("#name").val(name);   //位模态框设置值，都是一开始的值
				$("#coolege").val(college);
				$("#grade").val(grade);
			}
			
			
			
			//提交更改按钮触发调用
			function change() {
				
				var id=$("#ID").val();  //获取id
				var coolege=$("#coolege").val();  //获取学院
				var grade=$("#grade").val();  //年级
				var name=$("#name").val();  //姓名
				var grade_prev=$("#grade_select").val();   //获取选中的年级
				var coolege_prev=$("#coolege_select").val();  //获取选中的学院
				
				var sex;   //性别
				var radio = document.getElementsByName("optionsRadios"); //获取复选按钮的节点，用name属性获取
				for (var i = 0; i < radio.length; i++) {
					if (radio[i].checked == true) //如果哪一个按钮被点击了，那么就返回哪一个的值
						sex = radio[i].value;
				}
				
				var href="/jsnuKQ/admin/changeTeacher"; 
				var d={"id":id,"admin.coolege":coolege,
						"admin.grade":grade,
						"admin.name":name,"admin.sex":sex	
				};
				
				//ajax提交
				$.post(href,d,function(data,status,xhr){
					if(status=="success"){
						if(data=="修改成功"){
							alert(data);
							var $tr=$("#tr"+id);   //获取修改的那一行
							//如果年级，班级，学院有一个变了，那么就删除这个节点
							if(coolege!=coolege_prev||grade!=grade_prev){
								$tr.remove();  //删除这个节点
							}
							//否则就改变其中的值即可
							else{
								$tr.children("td:eq(1)").html(name);  //更新表格中的名字
							}
						}
						
						else{
							alert("修改失败，请重新输入！！");
						}
					}else{
						alert("提交失败，请重提交");
					}
				});
			}
			
			
		
		
		</script>
</body>


</html>